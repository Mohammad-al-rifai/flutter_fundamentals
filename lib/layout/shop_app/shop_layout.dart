import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamentals/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_fundamentals/layout/shop_app/cubit/states.dart';
import 'package:flutter_fundamentals/modules/shop_app/login/shop_login_screen.dart';
import 'package:flutter_fundamentals/modules/shop_app/search/search_screen.dart';
import 'package:flutter_fundamentals/shared/components/components.dart';
import 'package:flutter_fundamentals/shared/cubit/cubit.dart';
import 'package:flutter_fundamentals/shared/network/local/cache_helper.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Sala',
            ),
            actions: [
              IconButton(icon: Icon(Icons.logout), onPressed: (){
                CacheHelper.removeData(key: 'token').then((value){
                  if(value){
                    navigateAndFinish(context, ShopLoginScreen());
                  }
                });

              }),
              IconButton(
                  icon: Icon(Icons.brightness_4_outlined,),
                  onPressed: (){
                    AppCubit.get(context).changeAppMode();
                  }
              ),
              IconButton(
                  icon: Icon(Icons.search,),
                  onPressed: (){
                    navigateTo(context, SearchScreen());
                  }
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeBottom(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Categories'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites'
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
              ),
            ],
          ),

        );
      },
    );
  }
}
