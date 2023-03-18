import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool ondragstarted = false;
  String? imgpath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Draggable(
              data: 'assets/img/nadim.jpg',
              child: Image.asset(
                'assets/img/nadim.jpg',
                width: 100,
              ),
              feedback: Image.asset(
                'assets/img/nadim.jpg',
                width: 100,
              ),
              childWhenDragging: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
              ),
              onDragStarted: () {
                setState(() {
                  ondragstarted = true;
                });
              },
              onDragEnd: (nadim) {
                setState(() {
                  ondragstarted = false;
                });
              },
            ),
            SizedBox(
              height: 100,
            ),
            DragTarget(onAccept: (data) {
              setState(() {
                imgpath = data.toString();
              });
            }, builder: (_, Object, List) {
              return Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: ondragstarted == true ? 6 : 0,
                      color: ondragstarted == true ? Colors.green : Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: imgpath != null
                    ? Image.asset(
                        imgpath!,
                        width: 100,
                      )
                    : SizedBox(),
              );
            })
          ],
        ),
      ),
    );
  }
}
