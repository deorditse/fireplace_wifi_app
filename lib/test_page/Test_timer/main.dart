import 'package:fireplace_wifi_app/test_page/Test_timer/countdown_page.dart';
import 'package:flutter/material.dart';

class MyAppTimerTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return CountdownPage();
          }));
        },
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(5),
            color: Colors.blue,
            width: double.infinity,
            alignment: Alignment.center,
            height: 100,
            child: Text(
              'test',
              style: TextStyle(fontSize: 36),
            ),
          ),
        ),
      ),
    );
  }
}
