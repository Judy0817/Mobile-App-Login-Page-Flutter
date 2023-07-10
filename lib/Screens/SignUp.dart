import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../Reusable/reusable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'loginScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _userNameTextController = TextEditingController();

  Widget builduserName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "User Name",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ]),
          height: 60,
          child: TextField(
            controller: _userNameTextController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xDE281829),
                ),
                hintText: 'User Name',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ]),
          height: 60,
          child: TextField(
            controller: _emailTextController,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xDE281829),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ]),
          height: 60,
          child: TextField(
            controller: _passwordTextController,
            obscureText: true,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xDE281829),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  // Future<void> signUserUp() async {
  //   if (_userNameTextController.text == "") {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(errorMessage("Enter Your User Name"));
  //   } else if (_emailTextController.text == "") {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(errorMessage("Enter Your Email"));
  //   } else if (_passwordTextController.text == "") {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(errorMessage("Enter Your Password"));
  //   } else {
  //     try {
  //       UserCredential userCredential = await FirebaseAuth.instance
  //           .createUserWithEmailAndPassword(
  //               email: _emailTextController.text,
  //               password: _passwordTextController.text);
  //       User? user = FirebaseAuth.instance.currentUser;
  //
  //       if (user != null && !user.emailVerified) {
  //         await user.sendEmailVerification();
  //       }
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => const LoginScreen()));
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'weak-password') {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             errorMessage("Password must be at least 6 characters"));
  //       } else if (e.code == 'email-already-in-use') {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //             errorMessage("Account already exists for that email"));
  //       }
  //     } catch (e) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(errorMessage("User Registration Failed"));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFF43073c),
                ),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      builduserName(),
                      SizedBox(height: 20),
                      buildEmail(),
                      SizedBox(height: 20),
                      buildPassword(),
                      SizedBox(height: 35),
                      SignInSignUpBtn("Sign Up", () async {
                        if (_userNameTextController.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              errorMessage("Enter Your User Name"));
                        } else if (_emailTextController.text == "") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(errorMessage("Enter Your Email"));
                        } else if (_passwordTextController.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(
                              errorMessage("Enter Your Password"));
                        } else {
                          try {
                            UserCredential userCredential = await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text);
                            User? user = FirebaseAuth.instance.currentUser;

                            if (user != null && !user.emailVerified) {
                              await user.sendEmailVerification();
                            }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  errorMessage(
                                      "Password must be at least 6 characters"));
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  errorMessage(
                                      "Account already exists for that email"));
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                errorMessage("User Registration Failed"));
                          }
                        }
                      }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
