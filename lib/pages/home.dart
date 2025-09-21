import 'package:flutter/material.dart';
import 'package:jonihoney/pages/homeNav.dart';
import 'package:jonihoney/pages/library.dart';
import 'package:jonihoney/pages/search.dart';

// ...existing code...
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    Homenav(),
    Library(),
    Search(),
    const Center(child: Text('Notifications', style: TextStyle(fontSize: 12))),
  ];

  void _onItemTappped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: SvgPicture.asset('assets/icons/jhoney.svg', height: 60),
        title: Text('Jonihoney', style: TextStyle(color: Color(0xff624b81), fontWeight: FontWeight.bold),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.account_circle,
              size: 32,
              color: Color(0xff624b81),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: .5)),
        ),
        child: _bottomNavBar(context),
      ),
    );
  }

  Theme _bottomNavBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_rounded),
            label: 'Library',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xff624b81),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        onTap: _onItemTappped,
      ),
    );
  }
}
