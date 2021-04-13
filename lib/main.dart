import 'package:flutter/material.dart';
import 'dart:math';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: SafeArea(
        child: Scaffold(
          body: HomePage(),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[Colors.teal, Colors.red],
            ),
          ),
        ),
        Container(
          width: 200.0,
          child: Column(
            children: [
              DrawerHeader(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50.0,
                      // why can't I make the radius greater than 70
                      // //why my image is not working
                      backgroundColor: Colors.redAccent,
                      child: Image.asset("assets/me.png"),
                    ),
                    Image(
                      image: AssetImage("assets/john.png"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "muhammed hosny",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: Text("contact me"),
                      leading: Icon(
                        Icons.handyman_outlined,
                      ),
                    ),
                    ListTile(
                      title: Text("contact me"),
                      leading: Icon(
                        Icons.handyman_outlined,
                      ),
                    ),
                    ListTile(
                      title: Text("contact me"),
                      leading: Icon(
                        Icons.handyman_outlined,
                      ),
                    ),
                    ListTile(
                      title: Text("contact me"),
                      leading: Icon(
                        Icons.handyman_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (__, double val, _) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("next page"),
                  ),
                  body: Center(
                    child: Text("this is the next page"),
                  ),
                ),
              );
            }),
        GestureDetector(
          onHorizontalDragUpdate: (e) {
            double x = e.delta.dx;
            print(e.delta.dx);
            setState(() {
              if(x > 0)  value = 1;
              if(x< 0) value = 0;
            });
          },
          // onTap: () {
          //   setState(() {
          //     value = value == 0 ? 1 : 0;
          //   });
          // },
        )
      ],
    );
  }
}
