import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Group Members",style: TextStyle(fontSize: 26),),
          SizedBox(height: 3,),
          Text("1. Gezahegn Gulilat",style: TextStyle(fontSize: 18),),
          Text("2. Termuze Musa",style: TextStyle(fontSize: 18),),
          Text("3. Kidus Asrat",style: TextStyle(fontSize: 18),),
          Text("4. Alaf ",style: TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}
