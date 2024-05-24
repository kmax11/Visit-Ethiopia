import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'signin.dart';
import 'dart:convert';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
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
                        fontSize: 30),
                  )),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: fnameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'First Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: lnameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Last name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
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
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Signup'),
                    onPressed: () {
                      print(fnameController.text);
                      print(lnameController.text);
                      print(emailController.text);
                      print(passwordController.text);

                      final url =
                          'https://termuze01.000webhostapp.com/php/register.php';
                      final data = {
                        'fname': '${fnameController.text}',
                        'lname': '${lnameController.text}',
                        'email': '${emailController.text}',
                        'pass': '${passwordController.text}'
                      };

                      http.post(Uri.parse(url), body: data).then((response) {
                        print('Response status: ${response.statusCode}');
                        print('Response body: ${response.body}');
                        print('ok');
                        final parsedData = response.body;
                        print(parsedData);
                      }).catchError((error) {
                        print('Error sending data: $error');
                      });
                    },
                  )),
              Row(
                children: <Widget>[
                  const Text('Already have account?'),
                  TextButton(
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}
