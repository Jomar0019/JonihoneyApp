import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jonihoney/models/books.dart';

class Story extends StatefulWidget {
  final BookModel book;

  const Story({super.key, required this.book});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  int _selectedIndex = 0;
  bool _barsVisible = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _toggleBars() {
    setState(() {
      _barsVisible = !_barsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // A list of widgets to display as the body for each tab.
    final List<Widget> pageOptions = [
      // The original body for the first tab
      CustomScrollView(
        slivers: <Widget>[
          if (_barsVisible)
            SliverAppBar(
              floating: true,
              snap: true,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.ios_share),
                  ),
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
            ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(30),
              child: Text('lorem20'),
              
            ),
          ),
        ],
      ),
      // Placeholder pages for other tabs
      const Center(child: Text('Search Page')),
      const Center(child: Text('Library Page')),
      const Center(child: Text('Notifications Page')),
    ];

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: _toggleBars,
        child: pageOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: IgnorePointer(
        ignoring: !_barsVisible,
        child: AnimatedOpacity(
          opacity: _barsVisible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: BottomNavigationBar(
            backgroundColor:
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/home.svg', colorFilter: ColorFilter.mode(_selectedIndex == 0 ? Theme.of(context).primaryColor : Colors.grey, BlendMode.srcIn)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/search.svg', colorFilter: ColorFilter.mode(_selectedIndex == 1 ? Theme.of(context).primaryColor : Colors.grey, BlendMode.srcIn)),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/book-open.svg', colorFilter: ColorFilter.mode(_selectedIndex == 2 ? Theme.of(context).primaryColor : Colors.grey, BlendMode.srcIn)),
                label: 'Library',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/bell.svg', colorFilter: ColorFilter.mode(_selectedIndex == 3 ? Theme.of(context).primaryColor : Colors.grey, BlendMode.srcIn)),
                label: 'Notifications',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
            showUnselectedLabels: true,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
          ),
        ),
      ),
    );
  }
}