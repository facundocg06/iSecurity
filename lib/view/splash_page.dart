import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:isecurity/view/home_page.dart';
import 'package:isecurity/view/login_page.dart';
import 'package:isecurity/utils/auth.dart';

class SplashPage extends StatefulWidget {
  static const routeName = 'splash';
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterLayoutMixin {
  @override
  void afterFirstLayout(BuildContext context) {
    this._check();
  }

  _check() async {
    final String token = await Auth.instance.accessToken;
    if (token != null) {
      print("was logged");
      Navigator.pushReplacementNamed(context, HomePage.routeName);
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
