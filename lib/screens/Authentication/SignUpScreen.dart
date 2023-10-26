import 'package:bubbleup/screens/homeScreen.dart';
import 'package:bubbleup/services/auth.dart';
import 'package:bubbleup/widgets/custom_text_form.dart';
import 'package:bubbleup/widgets/scaffold_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

GlobalKey<FormState> _key = new GlobalKey();
bool _validate = false;
bool _isHidden = true;
String email = "";
String password = "";
bool loading = false;
final auth = FirebaseAuth.instance;
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController cpasswordController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Image.asset("assets/img/logo.png")),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                          child: Text(
                            "Create your account",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 325,
                      height: 80,
                      child: CustomTextField(
                        controller: emailController,
                        hintText: "Email",
                        regex:
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{3,}))$',
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 325,
                    height: 80,
                    child: CustomTextField(
                      controller: passwordController,
                      hintText: "Password",
                      regex:
                          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 325,
                      height: 80,
                      child: CustomTextField(
                        controller: cpasswordController,
                        hintText: "password",
                        regex:
                            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  loading
                      ? CircularProgressIndicator()
                      : Material(
                          child: GestureDetector(
                              child: InkWell(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            if (_key.currentState!.validate()) {
                              print(emailController.text);
                              print(passwordController.text);
                              if (passwordController.text ==
                                  cpasswordController.text) {
                                User? result = await AuthService().register(
                                    emailController.text,
                                    passwordController.text,
                                    context);
                                if (result != null) {
                                  print("Success");
                                  print(result.email);
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()));
                                  CustomMessages().ScaffoldMessage(
                                      "Please Verify your Email", context);
                                }
                                const Text("Signing Up");
                              } else {
                                CustomMessages().ScaffoldMessage(
                                    "Both passwords are not same", context);
                              }
                              setState(() {
                                loading = false;
                              });
                            }
                          },
                          child: Container(
                            height: 43,
                            width: 130,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xff6a6be9)),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ))),
                  SizedBox(
                    height: 30,
                  ),
                  Text("or sign up with"),
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
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              loading = true;
                            });
                            User? result =
                                await AuthService().signInWithGoogle();
                            if (result != null) {
                              print("Success");
                              print(result.email);
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('Logged In successfully')));
                            }
                            const Text("Logging In");
                            setState(() {
                              loading = false;
                            });
                          },
                          child: Container(
                              width: 60,
                              height: 50,
                              child: Image.asset("assets/img/google.png")),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
