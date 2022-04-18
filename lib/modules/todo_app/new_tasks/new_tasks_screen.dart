import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_fundamentals/shared/components/components.dart';
import 'package:flutter_fundamentals/shared/components/constants.dart';
import 'package:flutter_fundamentals/shared/cubit/cubit.dart';
import 'package:flutter_fundamentals/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context , state){
        var tasks = AppCubit.get(context).newTasks;
       return tasksBuilder(
         tasks: tasks,
       );
      },
    );


  }
}
