import 'package:flutter/material.dart';
import 'package:mpcore/mpkit/mpkit.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return MPScaffold(
      body: Container(
        child: Column(
          children: [
            MPText('Welcome',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
