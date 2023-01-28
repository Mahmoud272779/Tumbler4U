// ignore_for_file: file_names, curly_braces_in_flow_control_structures, prefer_const_constructors

//import 'package:dicee/date/models/usersEmail.dart';

import 'package:flutter/material.dart';
import 'package:tumbler/logic/functions/isEmailValid.dart';
import 'package:tumbler/presentation/screens/logInScreens/emailLogin1.dart';
import 'package:tumbler/presentation/screens/logInScreens/enterPassword.dart';

String? _Sendemail;
bool display = true;

class LoginEmail extends StatefulWidget {
  @override
  _LoginEmailState createState() => _LoginEmailState();
}

TextEditingController Textfieldemail = TextEditingController();

class _LoginEmailState extends State<LoginEmail> {
  TextEditingController _email = TextEditingController();

  GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();
  @override
  void initState() {
    _email.text = Sendemail!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formGlobalKey,
            child: Column(
              children: [
                Text(
                  't',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Raleway',
                      fontSize: 200),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 300,
                  height: 50,
                  padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
                  child: TextFormField(
                      controller: _email,
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Email',
                      ),
                      validator: isEmailValid),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                Container(
                  width: 300,
                  height: 50,
                  color: Colors.blue,
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Send Magic Link',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: 50,
                  color: Colors.grey,
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (_formGlobalKey.currentState!.validate()) {
                          //Add the  here
                          _formGlobalKey.currentState!.save();

                          setState(() {
                            //Check if the email exists, after posting of course.
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EnterPassword()));
                          });
                        }
                      });
                    },
                    child: Text(
                      'Enter password',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
