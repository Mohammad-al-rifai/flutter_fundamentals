import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamentals/shared/components/components.dart';
import 'package:flutter_fundamentals/shared/cubit/cubit.dart';
import 'package:flutter_fundamentals/shared/cubit/states.dart';

class ArchivedTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (context , state){},
      builder: (context , state){

        var tasks = AppCubit.get(context).archiveTasks;
        return tasksBuilder(
          tasks: tasks,
        );
      },
    );


  }
}
