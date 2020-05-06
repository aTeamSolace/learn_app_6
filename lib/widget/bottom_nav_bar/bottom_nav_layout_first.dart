import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';

class BottomNavLayoutOne extends StatefulWidget {

  @override
  _BottomNavLayoutOneState createState() => _BottomNavLayoutOneState();
}

class _BottomNavLayoutOneState extends State<BottomNavLayoutOne> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0',
    ),
    Text(
      'Index 1',
    ),
    Text(
      'Index 2',
    ),
    Text(
      'Index 3',
    ),
    Text(
      'Index 4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Nav Bar", style: Constant.myStyle),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex)
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.blue[500],
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.calendar_today,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.people,
            label: '',
//            selectedBackgroundColor: Colors.orange,
          ),
          FFNavigationBarItem(
            iconData: Icons.attach_money,
            label: '',
//            selectedBackgroundColor: Colors.purple,
          ),
          FFNavigationBarItem(
            iconData: Icons.note,
            label: '',
//            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: '',
//            selectedBackgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}