import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/screens/admin_screen.dart';
import 'package:tourism_app/screens/tabs_screen.dart';
import 'package:tourism_app/widgets/my_text_filed.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static const mtk = "/signin";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final _forKey = GlobalKey<FormState>();
  bool signInRequired = false;
  IconData iconPasswoed = CupertinoIcons.eye_fill;
  bool obscurepassword = true;
  String? _errorMsg;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _forKey,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextFiled(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              prefixIcon: const Icon(CupertinoIcons.mail_solid),
              errorMsg: _errorMsg,
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
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: MyTextFiled(
              controller: passwordController,
              hintText: "Password",
              obscureText: obscurepassword,
              keyboardType: TextInputType.visiblePassword,
              prefixIcon: const Icon(CupertinoIcons.lock_fill),
              errorMsg: _errorMsg,
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
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          !signInRequired
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextButton(
                    onPressed: () {
                      if (_forKey.currentState!.validate()) {
                        setState(() {
                          signInRequired = true;
                        });
                        if (emailController.text.trim().toLowerCase() ==
                            "admin@gmail.com") {
                          Navigator.pushNamed(context, AdminScreen.mtk);
                        } else {
                          Navigator.pushNamed(context, TabsScreen.mtk);
                        }
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
