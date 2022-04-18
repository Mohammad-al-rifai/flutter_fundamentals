
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_fundamentals/layout/news_app/cubit/cubit.dart';
import 'package:flutter_fundamentals/layout/news_app/cubit/states.dart';
import 'package:flutter_fundamentals/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (context,state){

      },
      builder: (context, state){
        var list = NewsCubit.get(context).business;
        return articleBuilder(list,context);
      },
    );
  }
}
