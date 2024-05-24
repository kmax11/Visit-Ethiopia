
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../map/map.dart';
import '../util/places.dart';

class Details extends StatelessWidget {
  int index;
  Details({super.key, required this.index});
  TextEditingController feedbackcontrol = TextEditingController();

  void sendRequest() async {
    final url =
    Uri.parse('https://termuze01.000webhostapp.com/php/feedbacksend.php');
    final response = await http.post(url, body: {
      'feedback': feedbackcontrol.text,
      'otherr': 'value2',
    });
    if (response.statusCode == 200) {
      print('Request successful');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          InkWell(
            child: Column(
              children: [
                IconButton(onPressed: (){
                  
                }, icon: Icon(Icons.language))
              ],
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10,),
          buildSlider(),
          SizedBox(height: 20),
          ListView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            primary: false,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${places[index]["name"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 19,
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.location_on_sharp,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context){
                            return MapSample();
                          })
                      );
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Colors.blueGrey[300],
                  ),
                  SizedBox(width: 3),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${places[index]["location"]}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: Colors.blueGrey[300],
                      ),
                      maxLines: 1,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${places[index]["details"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 100.0),
              ////////ADDD
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: Color(0xffefff00),
                        width: 5,
                      )),
                  labelText: 'your feedback area',
                ),
              ),
              TextButton(onPressed: sendRequest,
                child: const Text("Send Feedback"),)
              ///////////////////////
            ],
          ),
        ],
      ),
    );
  }








  buildSlider() {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 250.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places[index]["img"].length,
        itemBuilder: (BuildContext context, int idx) {
          Map place = places[index];
          return Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                "${place["img"][idx]}",
                height: 350.0,
                width: MediaQuery.of(context).size.width - 40.0,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
