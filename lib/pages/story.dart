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
  String _selectedFontFamily = 'OpenSans';
  double _fontSize = 16.0;
  double _lineHeight = 1.9;
  Color _selectedBackgroundColor = Colors.white;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _toggleBars() {
    setState(() {
      _areBarsVisible = !_areBarsVisible;
    });
  }

  void _toggleMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode
          ? Color(0xff101010)
          : _selectedBackgroundColor,
      key: _scaffoldKey,
      drawer: Drawer(
        // Drawer background color
        backgroundColor: Colors.white,
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 50,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Chapter ${index + 1}',
                            style: TextStyle(color: Colors.black87),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(color: Colors.white),
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
                      fontSize:
                          _fontSize + 2, // Make chapter title slightly larger
                      color: _isDarkMode ? Colors.white : Color(0xff31363F),
                      fontFamily: _selectedFontFamily,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras accumsan aliquet laoreet. Vestibulum felis est, hendrerit sit amet auctor id, vulputate ac risus. Praesent lacus dolor, malesuada vel lectus eu, aliquam aliquet eros. Ut pharetra justo sit amet dictum semper. Donec augue quam, semper eget maximus eget, mattis eu libero. Quisque malesuada est ac libero viverra sagittis. Pellentesque pharetra eget arcu et lobortis. \n \n Nullam auctor sed libero vitae luctus. Praesent hendrerit neque vel nibh mattis, ut mattis arcu maximus. Cras a ipsum sagittis, convallis turpis a, pulvinar est. Integer ut posuere enim. Phasellus non tempor massa, eu pulvinar ante. Cras venenatis lacus a leo egestas, quis volutpat metus cursus. Nullam eget massa mollis, consequat mi et, iaculis quam. \n \n Nullam auctor sed libero vitae luctus. Praesent hendrerit neque vel nibh mattis, ut mattis arcu maximus. Cras a ipsum sagittis, convallis turpis a, pulvinar est. Integer ut posuere enim. Phasellus non tempor massa, eu pulvinar ante. Cras venenatis lacus a leo egestas, quis volutpat metus cursus. Nullam eget massa mollis, consequat mi et, iaculis quam",
                    style: TextStyle(
                      height: _lineHeight,
                      fontSize: _fontSize,
                      color: _isDarkMode ? Colors.white : Color(0xff31363F),
                      fontFamily: _selectedFontFamily,
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
        child: BottomNavigationBar(
          backgroundColor: _isDarkMode ? Color(0xff1f1f1f) : Colors.white,

          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_rounded,
                color: _isDarkMode ? Colors.white : Color(0xff31363F),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _isDarkMode ? Colors.white : Color(0xff31363F),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _isDarkMode
                  ? Icon(Icons.light_mode_rounded, color: Colors.white)
                  : Icon(Icons.dark_mode, color: Colors.black),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.mode_comment_rounded,
                color: _isDarkMode ? Colors.white : Color(0xff31363F),
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
              _toggleMode();
            }
          },
        ),
      ),
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return SizedBox(
              height: 230,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _selectedBackgroundColor = Colors.grey.shade50;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade50,
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
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _selectedBackgroundColor = Color(0xffeadbcb);
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xffeadbcb),
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
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                _selectedBackgroundColor = Color(0xffb5d9cc);
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xffb5d9cc),
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

                    SizedBox(height: 20),

                    // FontSize and LineHeight
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (_fontSize > 12) {
                                      // Set a minimum font size
                                      _fontSize--;
                                    }
                                  });
                                  setModalState(() {});
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                ),
                                child: Text(
                                  'a-',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                child: Text(
                                  _fontSize.toInt().toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (_fontSize < 24) {
                                      // Set a maximum font size
                                      _fontSize++;
                                    }
                                  });
                                  setModalState(() {});
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                ),
                                child: Text(
                                  'a+',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (_lineHeight > 1.2) {
                                      // Set a minimum line height
                                      _lineHeight = (_lineHeight - 0.1).clamp(
                                        1.2,
                                        3.0,
                                      );
                                    }
                                  });
                                  setModalState(() {});
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  iconColor: Colors.black,
                                ),
                                child: Row(
                                  children: [
                                    (Icon(Icons.format_line_spacing_rounded)),
                                    (Icon(Icons.remove)),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 8,
                                ),
                                child: Text(
                                  _lineHeight.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (_lineHeight < 3.0) {
                                      // Set a maximum line height
                                      _lineHeight = (_lineHeight + 0.1).clamp(
                                        1.2,
                                        3.0,
                                      );
                                    }
                                  });
                                  setModalState(() {});
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  iconColor: Colors.black,
                                ),
                                child: Row(
                                  children: [
                                    (Icon(Icons.format_line_spacing_rounded)),
                                    (Icon(Icons.add)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Font Style
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // Use setState to update the main page state
                              setState(() {
                                _selectedFontFamily = 'OpenSans';
                              });
                              // Also update the modal state for immediate visual feedback
                              setModalState(() {
                                _selectedFontFamily = 'OpenSans';
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: _selectedFontFamily == 'OpenSans'
                                  ? Color(0xff624b81)
                                  : Colors.white,
                              foregroundColor: _selectedFontFamily == 'OpenSans'
                                  ? Colors.white
                                  : Colors.black,
                              side: BorderSide(
                                color: _selectedFontFamily == 'OpenSans'
                                    ? Colors.black
                                    : Colors.grey.shade200,
                              ),
                            ),
                            child: Text('System'),
                          ),
                        ),

                        SizedBox(width: 8),

                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _selectedFontFamily = 'Arial';
                              });
                              setModalState(() {
                                _selectedFontFamily = 'Arial';
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: _selectedFontFamily == 'Arial'
                                  ? Color(0xff624b81)
                                  : Colors.white,
                              foregroundColor: _selectedFontFamily == 'Arial'
                                  ? Colors.white
                                  : Colors.black,
                              side: BorderSide(
                                color: _selectedFontFamily == 'Arial'
                                    ? Colors.black
                                    : Colors.grey.shade200,
                              ),
                            ),
                            child: Text('Arial'),
                          ),
                        ),

                        SizedBox(width: 8),

                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _selectedFontFamily = 'Georgia';
                              });
                              setModalState(() {
                                _selectedFontFamily = 'Georgia';
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: _selectedFontFamily == 'Georgia'
                                  ? Color(0xff624b81)
                                  : Colors.white,
                              foregroundColor: _selectedFontFamily == 'Georgia'
                                  ? Colors.white
                                  : Colors.black,
                              side: BorderSide(
                                color: _selectedFontFamily == 'Georgia'
                                    ? Colors.black
                                    : Colors.grey.shade200,
                              ),
                            ),
                            child: Text('Georgia'),
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
      child: SizedBox(
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: _isDarkMode ? Colors.white : Color(0xff31363F),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),

              backgroundColor: _isDarkMode ? Color(0xff1f1f1f) : Colors.white,

              title: Center(
                child: Column(
                  children: [
                    Text(
                      widget.book.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: _isDarkMode ? Colors.white : Color(0xff31363F),
                        fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
    );
  }
}
