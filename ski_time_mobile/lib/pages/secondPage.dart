import 'package:flutter/material.dart';
import 'package:flutter_native_text_view/flutter_native_text_view.dart';

class secondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _secondPage();
}

class _secondPage extends State<secondPage> {
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class MyHelloWorldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHelloWorldState();
}

const String risposta = "";

class _MyHelloWorldState extends State<MyHelloWorldPage> {
  List<Post>? posts;
  var isLoaded=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                child: Text('hi'),
              );
            }));
  }

  Widget _loginButton() => StreamBuilder(
        builder: (context, snapshot) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: _httpRequest(),
              child: Text('Login'),
            ),
          );
        },
      );
}

Widget _textView() => StreamBuilder(
      builder: (context, snapshot) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: NativeTextView(
            risposta,
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        );
      },
    );

_httpRequest() {}

getData() async {}
