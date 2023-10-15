import 'package:bubbleup/screens/LoginScreen.dart';
import 'package:bubbleup/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff6a6be9),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/img/logo.png"),
            SizedBox(
              height: 151,
            ),
            Container(
              height: 43,
              width: 325,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(40)),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 43,
                width: 325,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Color(0xff6a6be9)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
