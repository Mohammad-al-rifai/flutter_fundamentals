import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20.0,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/68212019?s=400&u=86469b897809135034cce4b12a34cc0f713f6fd9&v=4'
              ),
            ),
            SizedBox(width: 15.0,),
            Text(
                'Chats',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ],
        ),
        actions: [
          CircleAvatar(
            radius: 15.0,
              backgroundColor: Colors.blue,
              child: IconButton(
                color: Colors.white,
                  icon: Icon(Icons.camera_alt,size: 18.0,),
                  onPressed: (){}
                  ),
          ),
          SizedBox(width: 10.0,),
          CircleAvatar(
            radius: 15.0,
            backgroundColor: Colors.blue,
            child: IconButton(
                color: Colors.white,
                icon: Icon(Icons.edit,size: 18.0,),
                onPressed: (){}
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search_rounded),
                    Text('Search'),
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                height: 100.0,
                child:
                ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder:(context , index) => buildStoryItem() ,
                    separatorBuilder: (context , index) => SizedBox(width: 20.0,),
                    itemCount: 10
                ),
              ),
              SizedBox(height: 20.0,),
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder:(context , index) => buildChatItem() ,
                  separatorBuilder: (context , index) => SizedBox(height: 20.0,),
                  itemCount: 15
              ),
            ],
          ),
        ),
      ),
    );
  }

    // 1. build item
    // 2. build list
    // 3. add item to list
  Widget buildStoryItem() => Container(
    width: 60.0,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/68212019?s=400&u=86469b897809135034cce4b12a34cc0f713f6fd9&v=4',
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,end: 3.0
              ),
              child: CircleAvatar(
                radius: 8.0,
                backgroundColor: Colors.red,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.0,),
        Text(
          'Muhammad Al-Rifai',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
              'https://avatars.githubusercontent.com/u/68212019?s=400&u=86469b897809135034cce4b12a34cc0f713f6fd9&v=4',
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                bottom: 3.0,end: 3.0
            ),
            child: CircleAvatar(
              radius: 8.0,
              backgroundColor: Colors.red,
            ),
          ),
        ],
      ),
      SizedBox(width:15.0 ,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Muhammad Reza Al-Rifai',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 5.0,),
            Row(
              children: [
                Expanded(
                  child:
                  Text(
                    'Hello Every One My Name Is Muhammad Al-Rifai',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Container(
                    width: 7.0,
                    height: 7.0,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                  ),
                ),
                Text(
                    '02:00 PM'
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
