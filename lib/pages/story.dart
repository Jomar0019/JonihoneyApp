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
  bool _isDarkMode = false;
  int _selectedBackgroundIndex = 0; // 0: White, 1: Dark, 2: Sepia

  // Define background colors
  final List<Color> _backgroundColors = [
    Colors.white, // Light
    Color(0xfff4f1e9), // Sepia
    ?Colors.green[100],
  ];

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
      backgroundColor: _isDarkMode
          ? Color(0xff31363F)
          : _backgroundColors[_selectedBackgroundIndex],
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: _isDarkMode ? Color(0xff31363F) : Colors.white,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 50,
                        child: ListTile(
                          contentPadding:
                              EdgeInsets.zero, // Remove default padding
                          title: Text('Chapter ${index + 1}', style: TextStyle(color: _isDarkMode ? Colors.white : Color(0xff31363F)),),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                       Divider(color: _isDarkMode ? Color(0xff31363F) : Colors.white),
                    itemCount: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
      backgroundColor: Colors.black54,
      // Use a stateful builder to update the bottom sheet's UI
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return SizedBox(
              height: 280,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // White Background Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() => _selectedBackgroundIndex = 0);
                              setModalState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _backgroundColors[0],
                              side: _selectedBackgroundIndex == 0
                                  ? BorderSide(
                                      width: 1,
                                      color: Color(0xff624b81),
                                    )
                                  : BorderSide(color: Colors.transparent),
                            ),
                            child: Text(
                              'T',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        // Sepia Background Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() => _selectedBackgroundIndex = 1);
                              setModalState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _backgroundColors[1],
                              side: _selectedBackgroundIndex == 1
                                  ? BorderSide(
                                      width: 1,
                                      color: Color(0xff624b81),
                                    )
                                  : BorderSide(color: Colors.transparent),
                            ),
                            child: Text(
                              'T',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() => _selectedBackgroundIndex = 2);
                              setModalState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: _backgroundColors[2],
                              side: _selectedBackgroundIndex == 2
                                  ? BorderSide(
                                      width: 1,
                                      color: Color(0xff624b81),
                                    )
                                  : BorderSide(color: Colors.transparent),
                            ),
                            child: Text(
                              'T',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text('A-'),
                          ),
                        ),
                        Expanded(child: Center(child: Text('18'))),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text('A+'),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.format_line_spacing_rounded),
                            label: Text(''),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(child: Center(child: Text('1'))),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(Icons.format_line_spacing_rounded),
                            label: Text(''),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16),

                    // Fonts
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // White Background Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                width: 1,
                                color: Colors.transparent,
                              ),
                            ),
                            child: Text(
                              'Open Sans',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        // Sepia Background Button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                width: 1,
                                color: Colors.transparent,
                              ),
                            ),
                            child: Text(
                              'Roboto',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: BorderSide(
                                width: 1,
                                color: Colors.transparent,
                              ),
                            ),
                            child: Text(
                              'Arial',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
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
