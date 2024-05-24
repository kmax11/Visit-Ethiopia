// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:visitethiopia/login/signin.dart';
import 'package:visitethiopia/screens/about.dart';
import 'package:visitethiopia/screens/calendar.dart';
import 'package:visitethiopia/screens/calender_converter.dart';
import '../currency/currency.dart';
import '../language/HomePage.dart';
import '../util/Constant.dart';
import '../util/places.dart';
import 'package:flutter/material.dart';
import '../widgets/VerticalPlaceItem.dart';
import '../widgets/horizontalPlaceItem.dart';
import '../widgets/iconBadge.dart';
import '../widgets/searchBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        width: 240,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              alignment: Alignment.topLeft,
              height: 150,
              width: 240,
              child: Image.asset(
                "assets/aa/aa2.jpeg",
                fit: BoxFit.cover,
                width: 240,
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("login".tr),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
                  return Login();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text("calendar".tr),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return CalendarPage();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.edit_calendar_sharp),
              title: Text("calendarconverter".tr),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return CalendarConverter();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.currency_exchange_sharp),
              title: Text("currency".tr),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return MyCurrency();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("language".tr),
              onTap: () {
                buildLanguageDialog(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box_outlined),
              title: Text("about".tr),
              onTap: (){
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return About();
                }));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('tit'.tr),
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.language,
              size: null,
              color: null,
            ),
            onPressed: () {
              buildLanguageDialog(context);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // UPPER TEXT
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('hometitle'.tr,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Search Bar  //////////
          SizedBox(
            height: 30,
          ),

          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'popular'.tr,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildHorizontalList(context),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: Constants.category.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      decoration: BoxDecoration(
                          color: Color(0xFF2e3440),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Color(0xFF8B8878), blurRadius: 1)
                          ]),
                      child: Center(
                          child: Text(
                        Constants.category[index],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2),
                      )),
                    ),
                    onTap: () {
                      setState(() {
                        category = Constants.category[index];
                      });
                    },
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 12),
          Container(
              child: category == null
                  ? buildVerticalList("All")
                  : buildVerticalList(category!)),
        ],
      ),
    );
  }


  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          Map place = places.toList()[index];
          return HorizontalPlaceItem(place: place, index: index);
        },
      ),
    );
  }

  buildVerticalList(String category) {
    List<int> selectedItems = [];
    if (category == "All") {
      for (int i = 0; i < places.length; i++) {
        selectedItems.add(i);
      }
    } else {
      for (int i = 0; i < places.length; i++) {
        if (places[i]['category'] == category) {
          selectedItems.add(i);
        }
      }
    }
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ListView.builder(
        primary: false,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: selectedItems.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places[selectedItems[index]];
          return VerticalPlaceItem(place: place, index: selectedItems[index]);
        },
      ),
    );
  }

  final List locale = [
    {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
    {'name': 'አማርኛ', 'locale': Locale('am','ET')},
  ];

  updateLanguage(Locale locale) {
    Get.back();
    Get.updateLocale(locale);
  }

  buildLanguageDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
            title: Text('Choose Your Language'),
            content: Container(
              width: double.maxFinite,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: 
                      GestureDetector(
                        child: Text(locale[index]['name']),
                        onTap: () {
                          print(locale[index]['name']);
                          updateLanguage(locale[index]['locale']);
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: Colors.blue,
                    );
                  },
                  itemCount: locale.length),
            ),
        );
    });
  }

}
