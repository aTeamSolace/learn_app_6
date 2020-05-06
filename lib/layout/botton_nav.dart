import 'dart:convert';
import 'package:learn_app_6/layout/announcement.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:learn_app_6/layout/webview_url.dart';
import 'package:learn_app_6/layout/widgets/constant.dart';
import 'courses.dart';
import 'give_to_school.dart';

class BottomNavPage extends StatefulWidget {
  int initialIndex;
  BottomNavPage({
    this.initialIndex,
  });
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<BottomNavPage>
    with SingleTickerProviderStateMixin {
  var myDrawerPages = [];
  var myAppbarName = [];
  var myFooter = [];
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
        initialIndex: widget.initialIndex, length: 4, vsync: this);
    _selectedIndex = widget.initialIndex;

    _pageController = new PageController();
    _title = "Give To School";
    setState(() {
      drawerData();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Future drawerData() async {
    var data =
        await DefaultAssetBundle.of(context).loadString("assets/data.json");
    final jsonResult = json.decode(data);
    setState(() {
      myDrawerPages = jsonResult['drawer'];
      myAppbarName = jsonResult['appbar'];
      myFooter = jsonResult['footer'];
    });
  }

  var myData = [GiveToSchool(), Courses(), Announcement()];

  PageController _pageController;
  int _page = 0;
  String _title = "MyApp";

  final _key = UniqueKey();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      endDrawer: Drawer(
        child: Container(
          child: ListView.separated(
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: myDrawerPages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    myDrawerPages[index]['pageTitle'],
                    style: Constant.myStyle,
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BottomNavPage(
                                  initialIndex: index,
                                )));
                  },
                );
              }),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: new Text(
          _title,
          style: Constant.myStyle,
        ),
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.black),
//        backgroundColor: _appBarColor,
      ),
      body: Stack(
        children: <Widget>[
          _widgetOptions.elementAt(_selectedIndex),
        Align(
          alignment: Alignment.bottomCenter,
          child: myFooter.length > 0 ? Container(
            color: Colors.black54,
            height: 50,
            width: MediaQuery.of(context).size.width,
            child:  ListView.separated(itemBuilder: (context, int index){
              return InkWell(
                child: Container(
                  width: MediaQuery.of(context).size.width / myFooter.length,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.ac_unit),
                      Text(myFooter[index]['pageTitle'])
                    ],
                  ),
                ),
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewContainer(url: myFooter[index]['pageUrl'],)));
                },
              );
            },itemCount: myFooter.length,
              scrollDirection: Axis.horizontal,shrinkWrap: true, separatorBuilder: (BuildContext context, int index) { return VerticalDivider(color: Colors.black); },
            ),
          )
              :
              Container(),
        )
        ],
      ),
//      PageView(
//        children: <Widget>[GiveToSchool(), Courses(), Announcement()],
//        controller: _pageController,
//        onPageChanged: onPageChanged,
//      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.heart),
            title: Text(" "),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.graduation_cap),
            title: Text(" "),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.newspaper_o),
            title: Text(" "),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedLabelStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  void navigateToPage(int page) {
    _pageController.animateToPage(page,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  int _selectedIndex;

  static List<Widget> _widgetOptions = <Widget>[
    GiveToSchool(),
    Courses(),
    Announcement()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    String _temptitle = "";
    Color _tempColor;
    switch (_selectedIndex) {
      case 0:
        _temptitle = myAppbarName[0]['appbarTitle'];
//        _tempColor = Colors.pink;
        break;
      case 1:
        _temptitle = myAppbarName[1]['appbarTitle'];
//        _tempColor = Colors.green;
        break;
      case 2:
        _temptitle = myAppbarName[2]['appbarTitle'];
//        _tempColor = Colors.deepPurple;
        break;
    }
    setState(() {
      this._page = index;
      this._title = _temptitle;
//    this._appBarColor = _tempColor;
    });
  }

  void onPageChanged(int page) {
    String _temptitle = "";
    Color _tempColor;
    switch (page) {
      case 0:
        _temptitle = myAppbarName[0]['appbarTitle'];
//        _tempColor = Colors.pink;
        break;
      case 1:
        _temptitle = myAppbarName[1]['appbarTitle'];
//        _tempColor = Colors.green;
        break;
      case 2:
        _temptitle = myAppbarName[1]['appbarTitle'];
//        _tempColor = Colors.deepPurple;
        break;
    }
    setState(() {
      this._page = page;
      this._title = _temptitle;
//    this._appBarColor = _tempColor;
    });
  }
}
