import 'package:flutter/material.dart';
import 'package:jonihoney/models/books.dart';
import 'package:jonihoney/models/chapters.dart';

class Story extends StatefulWidget {
  final BookModel book;
  final List<ChapterModel> allChapters;
  final int initialChapterIndex;

  const Story({
    super.key,
    required this.book,
    required this.allChapters,
    required this.initialChapterIndex,
  });

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

  late ChapterModel _currentChapter;

  @override
  void initState() {
    super.initState();
    // Set the initial chapter to display
    _currentChapter = widget.allChapters[widget.initialChapterIndex];
  }

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
          ? Color(0xff111111)
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
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      final chapter = widget.allChapters[index];
                      return SizedBox(
                        height: 50,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            chapter.chapterTitle,
                            style: TextStyle(color: Colors.black87),
                          ),
                          onTap: () {
                            setState(() {
                              _currentChapter = chapter;
                            });
                            // Close the drawer after selecting a chapter
                            Navigator.pop(context);
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(color: Colors.transparent, height: 1),
                    itemCount: widget.allChapters.length,
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
                    _currentChapter.chapterTitle,
                    style: TextStyle(
                      fontSize:
                          _fontSize + 2, // Make chapter title slightly larger
                      color: _isDarkMode
                          ? Color(0xffe8e8e8)
                          : Color(0xff31363F),
                      fontFamily: _selectedFontFamily,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _currentChapter.content,
                    style: TextStyle(
                      height: _lineHeight,
                      fontSize: _fontSize,
                      color: _isDarkMode
                          ? Color(0xffe8e8e8)
                          : Color(0xff31363F),
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
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
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
                  Icons.settings_rounded,
                  color: _isDarkMode ? Colors.white : Color(0xff31363F),
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _isDarkMode
                    ? Icon(Icons.light_mode_rounded, color: Colors.white)
                    : Icon(Icons.dark_mode_rounded, color: Color(0xff31363F)),
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
                                _selectedBackgroundColor = Colors.white;
                              });
                              setModalState(() {
                                _selectedBackgroundColor = Colors.white;
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.grey.shade50,
                              side: BorderSide(
                                color: _selectedBackgroundColor == Colors.white
                                    ? Color(0xff624b81)
                                    : Colors.grey.shade50,
                              ),
                              splashFactory: NoSplash.splashFactory,
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
                                _selectedBackgroundColor = Color(0xffffecd5);
                              });
                              setModalState(() {
                                _selectedBackgroundColor = Color(0xffffecd5);
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xffffecd5),
                              splashFactory: NoSplash.splashFactory,
                              side: BorderSide(
                                color:
                                    _selectedBackgroundColor ==
                                        Color(0xffffecd5)
                                    ? Color.fromARGB(255, 252, 195, 126)
                                    : Color(0xffffecd5),
                              ),
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
                                _selectedBackgroundColor = Color(0xffcad6c2);
                              });
                              setModalState(() {
                                _selectedBackgroundColor = Color(0xffcad6c2);
                              });
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Color(0xffcad6c2),
                              side:
                                  _selectedBackgroundColor == Color(0xffcad6c2)
                                  ? BorderSide(
                                      color: Color.fromARGB(255, 140, 165, 124),
                                    )
                                  : BorderSide(color: Color(0xffcad6c2)),
                              splashFactory: NoSplash.splashFactory,
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
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                child: Text(
                                  'A-',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
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
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                child: Text(
                                  'A+',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
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
                                    _lineHeight = _lineHeight = 1.9;
                                  });
                                  setModalState(() {});
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  iconColor: Colors.black,
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                child: (Icon(Icons.density_small_rounded)),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _lineHeight = _lineHeight = 2.4;
                                  });
                                  setModalState(() {});
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  iconColor: Colors.black,
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                child: (Icon(Icons.density_medium_rounded)),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _lineHeight = _lineHeight = 3.0;
                                  });
                                  setModalState(() {});
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  iconColor: Colors.black,
                                  splashFactory: NoSplash.splashFactory,
                                ),
                                child: (Icon(Icons.density_large_rounded)),
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
                              backgroundColor: Colors.white,
                              foregroundColor: _selectedFontFamily == 'OpenSans'
                                  ? Color(0xff624b81)
                                  : Colors.black,
                              side: BorderSide(
                                color: _selectedFontFamily == 'OpenSans'
                                    ? Color(0xff624b81)
                                    : Colors.grey.shade200,
                              ),
                              splashFactory: NoSplash.splashFactory,
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
                              backgroundColor: Colors.white,
                              foregroundColor: _selectedFontFamily == 'Arial'
                                  ? Color(0xff624b81)
                                  : Colors.black,
                              side: BorderSide(
                                color: _selectedFontFamily == 'Arial'
                                    ? Color(0xff624b81)
                                    : Colors.grey.shade200,
                              ),
                              splashFactory: NoSplash.splashFactory,
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
                              backgroundColor: Colors.white,
                              foregroundColor: _selectedFontFamily == 'Georgia'
                                  ? Color(0xff624b81)
                                  : Colors.black,
                              side: BorderSide(
                                color: _selectedFontFamily == 'Georgia'
                                    ? Color(0xff624b81)
                                    : Colors.grey.shade200,
                              ),
                              splashFactory: NoSplash.splashFactory,
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
                style: IconButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
              ),

              backgroundColor: Colors.transparent,
              scrolledUnderElevation: 0,
              surfaceTintColor: Colors.transparent,
              elevation: 0,

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
                      _currentChapter.chapterTitle,
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
