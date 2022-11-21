import 'package:flutter/material.dart';
import 'package:ski_time_mobile/pages/my_hello_world_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHelloWorldPage(),
    );
  }
}
