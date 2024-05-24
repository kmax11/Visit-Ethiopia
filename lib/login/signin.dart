import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:visitethiopia/login/Forget.dart';
import 'package:visitethiopia/login/signup.dart';
import 'package:visitethiopia/screens/MainScreen.dart';
import 'package:visitethiopia/screens/home.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 44,letterSpacing: 2),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 190, 190, 191)),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Color(0xffefff00),
                            width: 5,
                          )),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(
                            color: Color(0xffae0000),
                            width: 3,
                          )),
                      labelText: 'Password',
                    ),
                  ),
                ),

                Container(height: 30),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text(
                        'Login',
                        style:
                            TextStyle(fontSize: 30, color: Color.fromARGB(255, 208, 206, 230)),
                      ),
                      onPressed: () {
                        print(emailController.text);
                        print(passwordController.text);

                        final url =
                            'https://termuze01.000webhostapp.com/php/login.php';
                        final data = {
                          'email': '${emailController.text}',
                          'password': '${passwordController.text}'
                        };

                        http.post(Uri.parse(url), body: data).then((response) {
                          final parsed = jsonDecode(response.body);

                          print('Response status: ${response.statusCode}');
                          print('Response body: ${response.body}');
                          print(parsed["number"]);

                        ////////////////////session
                        ///
                        // final _prefs = SharedPreferences.getInstance();

                        // Future<void> createSession(String userId, String accessToken) async {
                        // final prefs = await _prefs;
                        // await prefs.setString('user_id', userId);
                        // await prefs.setString('access_token', accessToken);
                        // }

                          if (parsed["number"]==1) {
                              //createSession("userid","tok");

                             Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen()
                      ),
                    );
                  
                          }
                        }).catchError((error) {
                          print('Error sending data: $error');
                        });
                      },
                    )),
                Container(height: 20),
                Row(
                  children: <Widget>[
                    const Text(
                      'Does not have account?',
                      style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                    TextButton(
                      child: const Text(
                        'Sign Up',
                        style:
                            TextStyle(fontSize: 20, color: Color(0xff1000a2)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signup()),
                        );
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ],
            )),
      ),
    );
  }
}


