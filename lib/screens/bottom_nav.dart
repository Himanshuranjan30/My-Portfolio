import 'package:flutter/material.dart';
import 'package:myportfolio/screens/aboutme.dart';

class BottomNavBarV2 extends StatefulWidget {
  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  int currentIndex = 0;

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      body: Stack(
        children: [
          AboutMe(),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                        backgroundColor: Colors.blue,
                        child: Icon(Icons.home),
                        elevation: 0.1,
                        onPressed: () {
                          setBottomBarIndex(2);
                        }),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Transform.scale(
                          scale: 10,
                          child: IconButton(
                            icon: ImageIcon(
                              AssetImage(
                                'assets/about.png',
                              ),
                              color: currentIndex == 0
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            onPressed: () {
                              setBottomBarIndex(0);
                            },
                            splashColor: Colors.white,
                            iconSize: 4,
                          ),
                        ),
                        Transform.scale(
                          scale: 10,
                          child: IconButton(
                            icon: ImageIcon(
                              AssetImage('assets/skills.png'),
                              color: currentIndex == 1
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            onPressed: () {
                              setBottomBarIndex(1);
                            },
                            iconSize: 4,
                          ),
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        Transform.scale(
                          scale: 10,
                          child: IconButton(
                            icon: ImageIcon(
                              AssetImage('assets/projects.png'),
                              color: currentIndex == 2
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            onPressed: () {
                              setBottomBarIndex(3);
                            },
                            iconSize: 4,
                          ),
                        ),
                        Transform.scale(
                          scale: 10,
                          child: IconButton(
                            icon: ImageIcon(
                              AssetImage('assets/blog.png'),
                              color: currentIndex == 3
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                            onPressed: () {
                              setBottomBarIndex(4);
                            },
                            iconSize: 4,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
