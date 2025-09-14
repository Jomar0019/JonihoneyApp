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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _toggleBars() {
    setState(() {
      _areBarsVisible = !_areBarsVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    // A list of widgets to display as the body for each tab.
    return Scaffold(
      backgroundColor: Colors.white,
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Chapter 1",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras accumsan aliquet laoreet. Vestibulum felis est, hendrerit sit amet auctor id, vulputate ac risus. Praesent lacus dolor, malesuada vel lectus eu, aliquam aliquet eros. Ut pharetra justo sit amet dictum semper. Donec augue quam, semper eget maximus eget, mattis eu libero. Quisque malesuada est ac libero viverra sagittis. Pellentesque pharetra eget arcu et lobortis. \n \n Nullam auctor sed libero vitae luctus. Praesent hendrerit neque vel nibh mattis, ut mattis arcu maximus. Cras a ipsum sagittis, convallis turpis a, pulvinar est. Integer ut posuere enim. Phasellus non tempor massa, eu pulvinar ante. Cras venenatis lacus a leo egestas, quis volutpat metus cursus. Nullam eget massa mollis, consequat mi et, iaculis quam. \n \n Nullam auctor sed libero vitae luctus. Praesent hendrerit neque vel nibh mattis, ut mattis arcu maximus. Cras a ipsum sagittis, convallis turpis a, pulvinar est. Integer ut posuere enim. Phasellus non tempor massa, eu pulvinar ante. Cras venenatis lacus a leo egestas, quis volutpat metus cursus. Nullam eget massa mollis, consequat mi et, iaculis quam",
                    style: TextStyle(
                      height: 1.9,
                      fontSize: 16,
                      color: Colors.black,
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
          backgroundColor: Colors.white,

          elevation: 0,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_rounded, color: Colors.black),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.black),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.dark_mode, color: Colors.black),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mode_comment_rounded, color: Colors.black),
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
          },
        ),
      ),
    );
  }

  void _showSettingsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.black54,
      context: context,
      builder: (BuildContext bc) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: 230,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text('T'),
                          ),
                        ),

                        SizedBox(width: 8),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text('T'),
                          ),
                        ),

                        SizedBox(width: 8),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text('T'),
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
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: Text('A-'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                child: Text('16'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: Text('A+'),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          child: Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: (Icon(
                                  Icons.format_line_spacing_rounded,
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                child: Text('16'),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                ),
                                child: Icon(Icons.format_line_spacing_rounded),
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
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text('Sans'),
                          ),
                        ),

                        SizedBox(width: 8),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text('Comic'),
                          ),
                        ),

                        SizedBox(width: 8),

                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Text('Poppins'),
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
        color: Colors.white,
        height: 80,
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xff31363F)),
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
                  style: TextStyle(fontSize: 18, color: Color(0xff31363F)),
                ),
                Text(
                  'Chapter 1',
                  style: TextStyle(fontSize: 14, color: Color(0xff31363F)),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.ios_share_rounded, color: Color(0xff31363F)),
            ),
          ],
        ),
      ),
    );
  }
}
