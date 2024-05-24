import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitethiopia/language/LacaleString.dart';
import 'package:visitethiopia/screens/MainScreen.dart';
import 'package:visitethiopia/util/Constant.dart';

void main() async{
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
      translations: LocaleString(),
      locale: Locale('en', 'US'),
      title: Constants.appName,
      theme: Constants.darkTheme,
      darkTheme: Constants.darkTheme,
    );
  }
}
