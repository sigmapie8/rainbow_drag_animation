import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Example Animation",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Color> squares = [
    Colors.white,
    Colors.black,
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

  double _leftPosition = 0.0;
  double _bottomPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Listener(
        onPointerMove: (event) {
          setState(() {
            _leftPosition = event.position.dx;
            _bottomPosition = event.position.dy;
          });
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Stack(
            children: List.generate(squares.length, (index) {
              double widgetSide = (index + 1) * 20;

              return AnimatedPositioned(
                top: _bottomPosition - widgetSide / 2,
                left: _leftPosition - widgetSide / 2,
                duration: Duration(milliseconds: 100 * index),
                child: Container(
                  height: widgetSide,
                  width: widgetSide,
                  decoration: BoxDecoration(
                      border: Border.all(color: squares[index]),
                      shape: BoxShape.rectangle),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
