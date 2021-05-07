import 'package:flutter/material.dart';
import 'package:thriftini/Layouts/giveScreen.dart';
import 'package:thriftini/Layouts/profile.dart';
import 'package:thriftini/Layouts/takeScreen.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    TakeScreen(),
    //
    GiveScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {},
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: _selectedIndex == 0
              ? Text("الحاجات الي تنجم تاخوهم",
                  style: TextStyle(fontSize: 14.0))
              : Text("الحاجات الي تحب تتبرع بيهم",
                  style: TextStyle(fontSize: 14.0)),
          backgroundColor: Colors.blue[800],
          leading: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Icon(Icons.account_circle_rounded)),
          actions: [
            Container(
              width: 70,
              child: Row(
                children: [
                  Text("  دورو  "),
                  Text(
                    "0",
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'خود',
              backgroundColor: Colors.grey,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              label: 'أعطي',
              backgroundColor: Colors.grey,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue[900],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
