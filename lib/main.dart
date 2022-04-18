import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamentals/layout/news_app/cubit/cubit.dart';
import 'package:flutter_fundamentals/layout/news_app/news_layout.dart';
import 'package:flutter_fundamentals/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_fundamentals/layout/shop_app/shop_layout.dart';
import 'package:flutter_fundamentals/layout/todo_app/home_layout.dart';
import 'package:flutter_fundamentals/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_fundamentals/modules/shop_app/on_boarding/on_boarding_screen.dart';
import 'package:flutter_fundamentals/shared/bloc_observer.dart';
import 'package:flutter_fundamentals/shared/cubit/cubit.dart';
import 'package:flutter_fundamentals/shared/cubit/states.dart';
import 'package:flutter_fundamentals/shared/network/local/cache_helper.dart';
import 'package:flutter_fundamentals/shared/network/remote/dio_helper.dart';
import 'package:flutter_fundamentals/shared/styles/themes.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
 await CacheHelper.init();

 Widget widget;

 bool isDark = CacheHelper.getData(key: 'isDark');
 bool onBoarding = CacheHelper.getData(key: 'onBoarding');
 String token = CacheHelper.getData(key: 'token');

 if(onBoarding != null){
   if(token != null){
     widget = ShopLayout();
   }else{
     widget = ShopLoginScreen();
   }
 }else{
   widget = OnBoardingScreen();
 }
  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget{

  final bool isDark;
  final Widget startWidget;

  MyApp({
    this.isDark,
    this.startWidget
  });

  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
     providers: [
       BlocProvider(create: (BuildContext context) =>NewsCubit()..getBusiness(),),
       BlocProvider(create: (BuildContext context)=>AppCubit()..changeAppMode(
         fromShared: isDark,
       ),),
       //BlocProvider(create: (BuildContext context)  => AppCubit()..createDatabase()),
       BlocProvider(
           create: (BuildContext context) => ShopCubit()..getHomeData()
       ),
     ],
     child: BlocConsumer<AppCubit,AppStates>(
       listener: (context,state){

       },
       builder: (context,state){
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           theme: lightTheme,
           darkTheme: darkTheme,
          // themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,

           //home: NewsLayout(),
           home: startWidget,
         );
      },
     ),
   );
  }
}




