import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:visitethiopia/login/signin.dart';
import 'package:visitethiopia/screens/calendar.dart';

import '../widgets/iconBadge.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;
  int selectedIndex = 0;
  List pages = [
    Home(),
    CalendarPage(),
    Login()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: List.generate(4, (index) => Home()),
      ),

      bottomNavigationBar: GNav(
        rippleColor: Colors.grey[300]!,
        hoverColor: Colors.grey[100]!,
        gap: 8,
        activeColor: Colors.black,
        iconSize: 18,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        duration: Duration(milliseconds: 400),
        tabBackgroundColor: Colors.grey[100]!,
        color: Colors.white,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.calendar_month,
            text: 'Calendar',
            onPressed: (){
            },
          ),
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
        ],
      )
    );
  }
  Widget barIcon({IconData icon = Icons.home, int page = 0, bool badge = false}) {
    return IconButton(
      icon: badge ? IconBadge(icon: icon, size: 24.0, color: null,) : Icon(icon, size: 24.0),
      color: _page == page ? Theme.of(context).colorScheme.secondary : Colors.blueGrey[300],
      onPressed: () => _pageController.jumpToPage(page),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
