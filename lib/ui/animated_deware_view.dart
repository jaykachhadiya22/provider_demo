import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedDerwareView extends StatefulWidget {
  const AnimatedDerwareView({Key? key}) : super(key: key);
  @override
  State<AnimatedDerwareView> createState() => _AnimatedDerwareViewState();
}

class _AnimatedDerwareViewState extends State<AnimatedDerwareView> {
  late double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlue, Colors.blue],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          SafeArea(
              child: Container(
            width: 200,
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage:
                          NetworkImage("https://picsum.photos/250?image=9"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Kachhadiya Jay",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ],
                )),
                Expanded(
                    child: ListView(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.home, color: Colors.white),
                      title: const Text(
                        "Home",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.person, color: Colors.white),
                      title: const Text(
                        " Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.settings, color: Colors.white),
                      title: const Text(
                        "Setting",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.logout, color: Colors.white),
                      title: const Text(
                        "Log Out",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          )),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              duration: Duration(milliseconds: 500),
              builder: (_, double val, __) {

                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.001)
                    ..setEntry(0, 3, 200 * val)
                    ..rotateY((pi / 6) * val),
                  child: Scaffold(
                    appBar: AppBar(backgroundColor: Colors.amber),
                    body: Center(
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text("asking"))),
                  ),
                );
              }),
          GestureDetector(

            onHorizontalDragUpdate: (details) {
              if(details.delta.dx>0)
                {
                  setState(() {
                    value=1;
                  });
                }
              else
                {
                  setState(() {
                    value=0;
                  });
                }
            },
            onTap: () {
              setState(() {
                value == 0 ? value = 1 : value = 0;
              });
            },
          )
        ],
      ),
    );
  }
}
