import 'package:flutter/material.dart';
import 'package:listview_movie/listview_movie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var rememberMe = false;

  Widget myTextFormField(String label, bool isObsecure) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: TextFormField(
        obscureText: isObsecure,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.orange, width: 2),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget myText(String textValue, double fontSize, FontWeight fontWeight, Color color) {
    return Text(
      textValue,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF131216),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              myTextFormField("Username", false),
              myTextFormField("Password", true),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Checkbox(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = !rememberMe;
                        });
                      },
                    ),
                    myText("Remember me", 14, FontWeight.w400, Colors.white)
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(25, 10, 25, 5),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ListViewMovie())
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: myText("Login", 18, FontWeight.w600, Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  myText("Don't have an account?", 14, FontWeight.w400, Colors.white),
                  myText(" Create Account", 14, FontWeight.w600, Colors.blue),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
