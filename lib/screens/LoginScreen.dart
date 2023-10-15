import 'package:bubbleup/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset("assets/img/logo3.png")),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ))),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 325,
                  height: 58,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Email',
                      hintText: 'Enter your email',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 325,
                  height: 58,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      labelText: 'Password',
                      hintText: 'Enter your password',
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 43,
                  width: 130,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(40),
                      color: Color(0xff6a6be9)),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
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
                  height: 30,
                ),
                Text("or login with"),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.white,
                      child: Container(
                          width: 60,
                          height: 50,
                          child: Image.asset("assets/img/google.png")),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Card(
                      elevation: 5,
                      shadowColor: Colors.black,
                      color: Colors.white,
                      child: Container(
                          width: 60,
                          height: 50,
                          child: Image.asset("assets/img/facebook.png")),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
