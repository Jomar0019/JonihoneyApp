import 'package:flutter/material.dart';
import 'package:jonihoney/models/books.dart';

class Story extends StatefulWidget {
  final BookModel book;

  const Story({super.key, required this.book});

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  bool _areBarsVisible = true;
  bool _isDarkMode = true;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _modeButton() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  void _toggleBars() {
    setState(() {
      _areBarsVisible = !_areBarsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // A list of widgets to display as the body for each tab.
    return Scaffold(
      backgroundColor: _isDarkMode ? Color(0xff222831) : Colors.white,
      key: _scaffoldKey,
      drawer: Drawer(child: Center(child: Text('Item 1'))),
      body: Stack(
        children: [
          GestureDetector(
            onTap: _toggleBars,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chapter 1",
                    style: TextStyle(
                      fontSize: 18,
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras accumsan aliquet laoreet. Vestibulum felis est, hendrerit sit amet auctor id, vulputate ac risus. Praesent lacus dolor, malesuada vel lectus eu, aliquam aliquet eros. Ut pharetra justo sit amet dictum semper. Donec augue quam, semper eget maximus eget, mattis eu libero. Quisque malesuada est ac libero viverra sagittis. Pellentesque pharetra eget arcu et lobortis. \n \n Nullam auctor sed libero vitae luctus. Praesent hendrerit neque vel nibh mattis, ut mattis arcu maximus. Cras a ipsum sagittis, convallis turpis a, pulvinar est. Integer ut posuere enim. Phasellus non tempor massa, eu pulvinar ante. Cras venenatis lacus a leo egestas, quis volutpat metus cursus. Nullam eget massa mollis, consequat mi et, iaculis quam. \n \n Nullam auctor sed libero vitae luctus. Praesent hendrerit neque vel nibh mattis, ut mattis arcu maximus. Cras a ipsum sagittis, convallis turpis a, pulvinar est. Integer ut posuere enim. Phasellus non tempor massa, eu pulvinar ante. Cras venenatis lacus a leo egestas, quis volutpat metus cursus. Nullam eget massa mollis, consequat mi et, iaculis quam",
                    style: TextStyle(
                      height: 1.9,
                      fontSize: 16,
                      color: _isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // Top Bar
          _topBar(context),

          // Bottom Setting Bar
          _bottomBar(),
        ],
      ),
    );
  }

  AnimatedOpacity _bottomBar() {
    return AnimatedOpacity(
      opacity: _areBarsVisible ? 1 : 0,
      duration: Duration(milliseconds: 250),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          // padding: EdgeInsets.only(bottom: 10),
          child: BottomNavigationBar(
            backgroundColor: _isDarkMode ? Color(0xff31363F) : Colors.white,

            elevation: 0,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            iconSize: 28,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_rounded,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  _isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.mode_comment_rounded,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
                label: '',
              ),
            ],
            onTap: (index) {
              if (index == 0) {
                _scaffoldKey.currentState?.openDrawer();
              }
              if (index == 1) {
                // Show bottom sheet for settings
                _showSettingsBottomSheet(context);
              }
              if (index == 2) {
                _modeButton();
              }
            },
          ),
        ),
      ),
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.text_fields),
                title: Text('Font Size'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.color_lens),
                title: Text('Background Color'),
                onTap: () => {},
              ),
            ],
          ),
        );
      },
    );
  }

  AnimatedOpacity _topBar(BuildContext context) {
    return AnimatedOpacity(
      opacity: _areBarsVisible ? 1 : 0,
      duration: const Duration(milliseconds: 250),
      child: Container(
        color: _isDarkMode ? Color(0xff31363F) : Colors.white,
        height: 80,
        child: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: _isDarkMode ? Colors.white : Color(0xff31363F),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          title: Center(
            child: Column(
              children: [
                Text(
                  widget.book.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: _isDarkMode ? Colors.white : Color(0xff31363F),
                  ),
                ),
                Text(
                  'Chapter 1',
                  style: TextStyle(
                    fontSize: 14,
                    color: _isDarkMode ? Colors.white : Color(0xff31363F),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.ios_share_rounded,
                color: _isDarkMode ? Colors.white : Color(0xff31363F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
