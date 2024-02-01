import 'package:flutter/material.dart';
import 'route_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        // page display separated into 3 parts
        children: <Widget>[Logo(), LoginInputFields(), BottomButtons()],
      ),
    );
  }
}
