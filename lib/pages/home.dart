import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Book1'),
        Text('Image1')
      ],
    )),
    Center(child: Text('Library', style: TextStyle(fontSize: 12))),
    Center(child: Text('Search', style: TextStyle(fontSize: 12))),
    Center(child: Text('Notifications', style: TextStyle(fontSize: 12))),
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
        title: Text('Jonihoney'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(
              Icons.account_circle,
              size: 32,
              color: Colors.pink[200],
            ),
          ),
        ],
        elevation: 0,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: _bottomNavBar(context),
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
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            label: 'Library',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[200],
        onTap: _onItemTappped,
      ),
    );
  }
}
