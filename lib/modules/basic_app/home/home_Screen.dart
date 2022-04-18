import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(Icons.menu),
        title: Text('First App'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              print("Notification Clicked!");
            },
          ),
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () => print("Hello"),
          ),
        ],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                 padding: EdgeInsets.all(10.0),
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg'),
                        ),
                        Container(
                          width: 200.0,
                          color: Colors.black.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Text(
                            "Flower",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15.0)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg'),
                        ),
                        Container(
                          width: 200.0,
                          color: Colors.black.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Text(
                            "Flower",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15.0)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg'),
                        ),
                        Container(
                          width: 200.0,
                          color: Colors.black.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Text(
                            "Flower",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15.0)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg'),
                        ),
                        Container(
                          width: 200.0,
                          color: Colors.black.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Text(
                            "Flower",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(15.0)
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512_960_720.jpg'),
                        ),
                        Container(
                          width: 200.0,
                          color: Colors.black.withOpacity(.6),
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                          ),
                          child: Text(
                            "Flower",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
