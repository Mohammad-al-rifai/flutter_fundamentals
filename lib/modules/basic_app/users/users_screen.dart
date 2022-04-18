import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamentals/models/user/user_model.dart';


class UsersScreen extends StatelessWidget {

  List<UserModel> users =[
    UserModel(id: 1, name: 'Muhammad Al-Rifai', phone: '+963996696170'),
   UserModel(id: 2, name: 'Ali Al-Rifai', phone: '+963996696170'),
    UserModel(id: 3, name: 'Bilal Al-Rifai', phone: '+963996696170'),
    UserModel(id: 4, name: 'Ahmed Al-Rifai', phone: '+963996696170'),
    UserModel(id: 5, name: 'Abed Al-Rifai', phone: '+963996696170'),
    UserModel(id: 6, name: 'Omer Al-Rifai', phone: '+963996696170'),
    UserModel(id: 7, name: 'Mansour Al-Rifai', phone: '+963996696170'),
    UserModel(id: 8, name: 'Khalil Al-Rifai', phone: '+963996696170'),
    UserModel(id: 9, name: 'Reza Al-Rifai', phone: '+963996696170'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildUserItem(users[index]),
          separatorBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsetsDirectional.only(start: 20.0, end: 20.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
          itemCount: users.length
      ),
    );
  }

  Widget buildUserItem(UserModel users) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${users.id}',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${users.name}',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '${users.phone}',
                  style: TextStyle(color: Colors.grey, fontSize: 18.0),
                ),
              ],
            ),
          ],
        ),
      );
  // 1. build item
  // 2. build list
  // 3. add item to lis
}
