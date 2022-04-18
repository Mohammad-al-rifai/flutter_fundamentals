import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_fundamentals/shared/components/components.dart';
import 'package:flutter_fundamentals/shared/components/constants.dart';
import 'package:flutter_fundamentals/shared/cubit/cubit.dart';
import 'package:flutter_fundamentals/shared/cubit/states.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';


// 1. create database
// 2. create tables
// 3. open database
// 4. insert to database
// 5. get from database
// 6. update database
// 7. delete from database


class HomeLayout extends StatelessWidget {


  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   createDatabase();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit , AppStates>(
      listener: (BuildContext context, AppStates state){
        if(state is AppInsertDatabaseState){
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, AppStates state){
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              cubit.titles[cubit.currentIndex],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (cubit.isBottomSheetShown) {
                if (formKey.currentState.validate()) {

                  cubit.insertToDatabase(
                      title: titleController.text,
                      time: timeController.text,
                      date: dateController.text,
                  );
                }
              } else {
                scaffoldKey.currentState
                    .showBottomSheet(
                        (context) => SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              defaultFormField(
                                controller: titleController,
                                type: TextInputType.text,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'Title Must Not Be Empty';
                                  }
                                  return null;
                                },
                                label: 'Task Title',
                                prefix: Icons.title,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
                                  controller: timeController,
                                  type: TextInputType.datetime,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Time Must Not Be Empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task Time',
                                  prefix: Icons.watch_later_outlined,
                                  onTap: () {
                                    print('onTap is Clicked!');
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timeController.text =
                                          value.format(context).toString();
                                      print(
                                          value.format(context).toString());
                                    });
                                  }),
                              SizedBox(
                                height: 15.0,
                              ),
                              defaultFormField(
                                  controller: dateController,
                                  type: TextInputType.datetime,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Date Must Not Be Empty';
                                    }
                                    return null;
                                  },
                                  label: 'Task date',
                                  prefix: Icons.calendar_today,
                                  onTap: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate:
                                      DateTime.parse('2022-01-01'),
                                    ).then((value) {
                                      dateController.text =
                                          DateFormat.yMMMd()
                                              .format(value)
                                              .toString();
                                      print(
                                          DateFormat.yMMMd().format(value));
                                    });
                                    print('onTap2 is Clicked!');
                                  }),
                            ],
                          ),
                        ),
                      ),
                    ),
                    elevation: 20.0)
                    .closed
                    .then((value) {
                      cubit.changeBottomSheetState(
                          isShow: false,
                          icon: Icons.edit
                      );
                });
                cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                );
              }
            },
            child: Icon(
              cubit.fabIcon,
            ),
          ),
          body: Conditional.single(
            context: context,
            conditionBuilder: (context) => state is! AppGetDatabaseLoadingState,
            widgetBuilder: (context) => cubit.screens[cubit.currentIndex],
            fallbackBuilder: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: 'Tasks',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.check_circle_outline,
                ),
                label: 'Done',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.archive_outlined,
                ),
                label: 'Archived',
              ),
            ],
          ),
        );
      }
    );
  }





}




