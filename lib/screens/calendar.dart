import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../calendar/models/calendar/EthiopianCalendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List img = <String>['0.jpg', '1.jpg'];
  String present_day = '';

  _currentDay() {
    var now = new EthiopianCalendar.now();

    var currentDay = now.currentDay();
    int day_ = currentDay.day!;
    int month_ = currentDay.month!;
    int year_ = currentDay.year!;
    setState(() {
      present_day = "$day_-$month_-$year_";
    });
  }


  EthiopianCalendar _calendar = EthiopianCalendar.now();
  final List<String> _weekdayNames = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    // 'እሁድ', 'ሰኞ', 'ማግሰኞ', 'ረቡዕ', 'ሐሙስ', 'አርብ', 'ቅዳሜ',
  ];

  List<Widget> _buildDayCells() {
    _currentDay();
    List<Widget> cells = [];
    int daysInMonth = _calendar.daysInMonth();
    int firstDayOfWeek = _calendar.firstDayOfWeek();
    int prevMonthDays = _calendar.previousMonth().daysInMonth();
    int nextMonthDays = _calendar.nextMonth().daysInMonth();
    // todo weekend
    int prevMonthOffset = (firstDayOfWeek + 5) % 7;

    // Add cells for days from previous month
    for (int i = prevMonthDays - prevMonthOffset + 1; i <= prevMonthDays; i++) {
      EthiopianCalendar date = EthiopianCalendar(
          year: _calendar.year, month: _calendar.month, day: i);
      int cday = date.day!;
      int cmonth = date.month!;
      int cyear = date.year!;
      String currentDay = "$cday$cmonth$cyear";

      cells.add(
        GestureDetector(
          // onTap: () {
          //   setState(() {
          //     _calendar = date;
          //   });
          // },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              // color: date.isHoliday ? Colors.red : null,
              color: null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day}',
                  style: TextStyle(
                      color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
                // if (date.isHoliday)
                //   Text(
                //     date.holiday_name!,
                //     textAlign: TextAlign.center,
                //     style: const TextStyle(color: Color(0xffd27405)),
                //   ),
                //todo change present day num color
              ],
            ),
          ),
        ),
      );
    }

    // Add cells for each day of the month
    for (int i = 1; i <= daysInMonth; i++) {
      EthiopianCalendar date = EthiopianCalendar(
          year: _calendar.year, month: _calendar.month, day: i);

      int cday = date.day!;
      int cmonth = date.month!;
      int cyear = date.year!;
      String currentDay = "$cday$cmonth$cyear";
      // print(currentDay);

      cells.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _calendar = date;
            });
          },
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.transparent),
                // color: date.isHoliday ? Colors.red : null,
                // color: _currentDay(currentDay) ? Colors.red : Colors.teal,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${date.day}',
                    style: TextStyle(
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  // if (date.isHoliday)
                  //   Text(
                  //     date.holiday_name!,
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       color: Color(0xffd27405),
                  //     ),
                  //   ),
                  //todo change present day num color
                ],
              ),
            ),
          ),
        ),
      );
    }

    // Add cells for days from next month
    int numCells = cells.length;
    int numRows = (numCells / 7).ceil() * 7;
    int nextMonthOffset = numRows - numCells;
    for (int i = 1; i <= nextMonthOffset; i++) {
      EthiopianCalendar date = EthiopianCalendar(
          year: _calendar.year, month: _calendar.month, day: i);
      int cday = date.day!;
      int cmonth = date.month!;
      int cyear = date.year!;
      String currentDay = "$cday-$cmonth-$cyear";
      cells.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _calendar = date;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              // color: date.isHoliday ? Colors.red : null,
              color: null,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${date.day}',
                  style: TextStyle(
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                // if (date.isHoliday)
                //   Text(
                //     date.holiday_name!,
                //     textAlign: TextAlign.center,
                //     style: TextStyle(color: Color(0xffd27405)),
                //   ),
                //todo change present day num color
              ],
            ),
          ),
        ),
      );
    }
    for (int i = 1; i <= nextMonthDays - nextMonthOffset; i++) {
      EthiopianCalendar date = EthiopianCalendar(
          year: _calendar.year, month: _calendar.month, day: i);
      cells.add(
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
            // color: date.isHoliday ? Colors.red : null,
            color: null,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${i + daysInMonth + 2}',
                style: TextStyle(color: Colors.white),
              ),
              if (date.isHoliday)
                Text(
                  date.holiday_name!,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xffd27405)),
                ),
            ],
          ),
        ),
      );
    }

    // Add weekday name cells
    for (int i = 0; i < 7; i++) {
      cells.insert(
        i,
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0x00000),
                  width: 2.0,
                ),
              ),
            ),
            child: Center(
              child: Text(
                _weekdayNames[i],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade300,
                  // color: Color(0xffd27405),
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Remove extra cells for previous month if necessary
    if (cells.length > 35) {
      cells.removeRange(35, cells.length);
    }

    return cells;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   //Floating action button on Scaffold
      //   backgroundColor: Color.fromARGB(255, 0, 0, 0),
      //   onPressed: () {
      //     //code to execute on button press
      //   },
      //   child: Icon(
      //     Icons.calendar_month,
      //     color: Color(0xff1c1c1c),
      //   ), //icon inside button
      // ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      //floating action button location to left

      // bottomNavigationBar: BottomAppBar(
      //   //bottom navigation bar on scaffold
      //   color: Color(0xff1c1c1c),
      //   shape: CircularNotchedRectangle(), //shape of notch
      //   notchMargin:
      //       5, //notche margin between floating button and bottom appbar
      //   child: Row(
      //     //children inside bottom appbar
      //     mainAxisSize: MainAxisSize.max,
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       Padding(
      //         padding: EdgeInsets.only(left: 90),
      //         child: IconButton(
      //           icon: Icon(
      //             Icons.home,
      //             color: Color(0xffd27405),
      //           ),
      //           onPressed: () {
      //           },
      //         ),
      //       ),
      //       IconButton(
      //         icon:  Icon(
      //           Icons.attach_money,
      //           color: Color(0xffd27405),
      //         ),
      //         onPressed: () {
      //           Navigator.pushNamed(context, route.currency);
      //         },
      //       ),
      //       IconButton(
      //         icon: Icon(
      //           Icons.info,
      //           color: Color(0xffd27405),
      //         ),
      //         onPressed: () {},
      //       ),
      //       IconButton(
      //         icon: FaIcon(
      //           FontAwesomeIcons.user,
      //           color: Color(0xffd27405),
      //         ),
      //         onPressed: () {},
      //       ),
      //       // IconButton(
      //       //   icon: Icon(
      //       //     Icons.user,
      //       //     color: Color(0xffd27405),
      //       //   ),
      //       //   onPressed: () {},
      //       // ),
      //     ],
      //   ),
      // ),
      backgroundColor: Color(0xff1c1c),
      appBar: AppBar(
        backgroundColor: const Color(0xff1c1c1c),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: false,
        title: Text('Ethiopian Calendar'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 7,
            children: _buildDayCells(),
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_left,
                  color: Color.fromARGB(255, 232, 232, 232),
                  size: 60,
                ),
                onPressed: () {
                  setState(() {
                    _calendar = _calendar.previousMonth();
                  });
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_calendar.month_name} ${_calendar.year}',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    present_day,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 10,
                        fontFamily: 'Poppins'),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_right,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 60,
                ),
                onPressed: () {
                  setState(() {
                    _calendar = _calendar.nextMonth();
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
