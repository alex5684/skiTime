import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wifi_iot/wifi_iot.dart';

class MyHelloWorldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHelloWorldState();
}

class _MyHelloWorldState extends State<MyHelloWorldPage> {
  BehaviorSubject<String> _emailController = BehaviorSubject();
  BehaviorSubject<String> _passwordController = BehaviorSubject();
  var isConnected;

  final _validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('email non valida');
    }
  });

  final _validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length >= 6) {
      sink.add(password);
    } else {
      sink.addError('password troppo corta');
    }
  });

  Stream<String> get _emailStream =>
      _emailController.stream.transform(_validateEmail);

  Stream<String> get _passwordStream =>
      _passwordController.stream.transform(_validatePassword);

  Stream<bool> get _loginButtonStream =>
      Rx.combineLatest2(_emailStream, _passwordStream, (a, b) => true);

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HelloWorldApp'),
      ),
      body: Column(
        children: [
          _email(),
          _password(),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _email() => StreamBuilder(
        stream: _emailStream,
        builder: (context, snapshot) {
          return Padding(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                errorText: snapshot.hasError ? '${snapshot.error}' : null,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: _emailController.sink.add,
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          );
        },
      );

  Widget _password() => StreamBuilder(
      stream: _passwordStream,
      builder: (context, snapshot) {
        return Padding(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Password',
              labelText: 'Password',
              errorText: snapshot.hasError ? '${snapshot.error}' : null,
            ),
            obscureText: true,
            onChanged: _passwordController.sink.add,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        );
      });

  Widget _loginButton() => StreamBuilder(
        stream: _loginButtonStream,
        builder: (context, snapshot) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: ElevatedButton(
              onPressed: startAttack(),
              //snapshot.data == true ? () => context.go('/details') : null ,
              child: Text('Login'),
            ),
          );
        },
      );

  startAttack() async {
    isConnected = await WiFiForIoTPlugin.connect("SkiTimeStart",
        security: NetworkSecurity.WPA, password: "SkiTime");
  }
}
