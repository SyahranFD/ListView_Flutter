import 'package:flutter/material.dart';
import 'package:listview_movie/app/pages/listview_movie.dart';
import 'package:listview_movie/app/widget/widget.dart';
import 'package:listview_movie/helpers/themes.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF131216),
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 40),

              Text('Login', style: tsTitleLogin, textAlign: TextAlign.center),

              SizedBox(height: 20),
              textFormFieldLogin(label: "Username", isObsecure: false),
              textFormFieldLogin(label: "Password", isObsecure: true),
              Container(
                margin: EdgeInsets.only(left: 10),
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
                    Text("Remember me", style: tsCheckboxRememberMe),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 25),
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
                  child: Text("Login", style: tsButtonLogin),
                ),
              ),

              SizedBox(height: 5),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: tsAskAccount),
                  Text(" Create Account", style: tsCreateAccount),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
