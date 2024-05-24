
import 'package:flutter/material.dart';
import '../screens/details.dart';

class HorizontalPlaceItem extends StatefulWidget {
  final Map place;
  int index;
  HorizontalPlaceItem({super.key, required this.place,required this.index});

  @override
  State<HorizontalPlaceItem> createState() => _HorizontalPlaceItemState();
}

class _HorizontalPlaceItemState extends State<HorizontalPlaceItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        child: Container(
          height: 250.0,
          width: 140.0,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "${widget.place["img"][0]}",
                  height: 178.0,
                  width: 140.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.place["name"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${widget.place["location"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.blueGrey[300],
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context){
              return Details(index:widget.index);
            })
          );
        },
      ),
    );
  }
}
