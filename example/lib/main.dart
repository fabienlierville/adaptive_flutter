import 'package:flutter/material.dart';
import 'package:adaptive_flutter/adaptive_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
        string: "Test",
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Adaptive.text(string: "Notre App", color: Colors.pink, size: 40.0, align: TextAlign.right),
              Adaptive.button(
                child: Adaptive.text(string: "Press me"),
                  onPressed: (){
                    Adaptive.alert(context: context);
                  }
              )
            ],
          )
       )
    );
  }

}
