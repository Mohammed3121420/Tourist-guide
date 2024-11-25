import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/screens/tabs_screen.dart';
import 'package:tourism_app/widgets/my_text_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _forKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPasswoed = CupertinoIcons.eye_fill;
  bool obscurepassword = true;

  bool containsUpperCase = false;
  bool containsLowerCase = false;
  bool containsIsNumber = false;
  bool containsIsSpeciatChar = false;
  bool containsBLength = false;

  Text buildValText(String text, bool val) {
    return Text(
      text,
      style: TextStyle(color: val ? Colors.green : Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _forKey,
      child: Column(
        children: [
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextFiled(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(CupertinoIcons.mail_solid),
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please fill in this filed";
                } else if (!RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
                    .hasMatch(val)) {
                  return "Please enter a valid email";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextFiled(
              controller: passwordController,
              hintText: "Password",
              obscureText: obscurepassword,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              onchanged: (val) {
                if (val!.contains(RegExp(r'[A-Z]'))) {
                  setState(() {
                    containsUpperCase = true;
                  });
                } else {
                  containsUpperCase = false;
                }
                if (val.contains(RegExp(r'[a-z]'))) {
                  setState(() {
                    containsLowerCase = true;
                  });
                } else {
                  containsLowerCase = false;
                }
                if (val.contains(RegExp(r'[0-9]'))) {
                  setState(() {
                    containsIsNumber = true;
                  });
                } else {
                  containsIsNumber = false;
                }
                if (val.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                  setState(() {
                    containsIsSpeciatChar = true;
                  });
                } else {
                  containsIsSpeciatChar = false;
                }
                if (val.length >= 8) {
                  setState(() {
                    containsBLength = true;
                  });
                } else {
                  containsBLength = false;
                }
                return null;
              },
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscurepassword = !obscurepassword;
                    if (obscurepassword) {
                      iconPasswoed = CupertinoIcons.eye_fill;
                    } else {
                      iconPasswoed = CupertinoIcons.eye_slash_fill;
                    }
                  });
                },
                icon: Icon(iconPasswoed),
              ),
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please fill in this filed";
                } else if (!RegExp(
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                    .hasMatch(val)) {
                  return "Please enter a valid password";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildValText("● 1 Uppercase", containsUpperCase),
                  buildValText("● 1 LowerCase", containsLowerCase),
                  buildValText("● 1 Number", containsIsNumber),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildValText("● 1 SpeciatChar", containsIsSpeciatChar),
                  buildValText("● 8 Length", containsBLength),
                ],
              )
            ],
          ),
          SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextFiled(
              controller: userNameController,
              hintText: "username",
              obscureText: false,
              keyboardType: TextInputType.name,
              prefixIcon: const Icon(CupertinoIcons.person_fill),
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please fill in this filed";
                } else if (val.length >= 30) {
                  return "The Name too long";
                }
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          !signInRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextButton(
                    onPressed: () {
                      if (_forKey.currentState!.validate()) {
                        setState(() {
                          signInRequired = true;
                        });
                        Navigator.pushNamed(context, TabsScreen.mtk);
                      }
                    },
                    style: TextButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: const Color.fromRGBO(205, 147, 216, 1),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
