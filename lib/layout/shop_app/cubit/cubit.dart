import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamentals/layout/shop_app/cubit/states.dart';
import 'package:flutter_fundamentals/models/shop_app/home_model.dart';
import 'package:flutter_fundamentals/modules/shop_app/categories/categories_screen.dart';
import 'package:flutter_fundamentals/modules/shop_app/favorites/favorites_screen.dart';
import 'package:flutter_fundamentals/modules/shop_app/products/products_screen.dart';
import 'package:flutter_fundamentals/modules/shop_app/settings/setting_screen.dart';
import 'package:flutter_fundamentals/shared/components/constants.dart';
import 'package:flutter_fundamentals/shared/network/end_points.dart';
import 'package:flutter_fundamentals/shared/network/remote/dio_helper.dart';

class ShopCubit extends Cubit<ShopStates>
{
   ShopCubit(): super(ShopInitialState());

   static ShopCubit get(context)=>BlocProvider.of(context);

   int currentIndex = 0;

   List<Widget> bottomScreens =
   [
     ProductsScreen(),
     CategoriesScreen(),
     FavoritesScreen(),
     SettingScreen()
   ];

   void changeBottom(int index)
   {
     currentIndex = index;
     emit(ShopChangeBottomNavState());
   }

   HomeModel homeModel;

   void getHomeData()
   {
     emit(ShopLoadingHomeDataState());
     DioHelper.getData(url: HOME,).then((value){
       homeModel = HomeModel.fromJson(value.data);
       printFullText(homeModel.toString());
       emit(ShopSuccessHomeDataState());
     }).catchError((error){
       print(error.toString());
       emit(ShopErrorHomeDataState());
     });

   }

}