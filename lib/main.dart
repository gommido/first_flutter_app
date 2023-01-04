import 'package:animator/animator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('I'),
              Animator<double>(
                curve: Curves.easeInExpo,
                duration: const Duration(milliseconds: 300),
                cycles: 0,
                tween: Tween<double>(
                    begin: 100,
                    end: 60
                ),
                builder: (context, animatorState, child) =>
                    SizedBox(
                      height: sHeight / 5,
                      width: sWidth / 5,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                        size: animatorState.value / 2,),
                    ),
              ),
              const Text('FLUTTER'),

            ],
          )

      ),
    );
  }
}
animator: ^3.2.0