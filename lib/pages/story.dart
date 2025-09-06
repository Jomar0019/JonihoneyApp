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


  void _toggleBars() {
    setState(() {
      _areBarsVisible = !_areBarsVisible;
    });
  }


  @override
  Widget build(BuildContext context) {
    // A list of widgets to display as the body for each tab.
    return Scaffold(
      body: Stack(
        children: [
          GestureDetector(
            onTap: _toggleBars,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Chapter 1", style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras accumsan aliquet laoreet. Vestibulum felis est, hendrerit sit amet auctor id, vulputate ac risus. Praesent lacus dolor, malesuada vel lectus eu, aliquam aliquet eros. Ut pharetra justo sit amet dictum semper. Donec augue quam, semper eget maximus eget, mattis eu libero. Quisque malesuada est ac libero viverra sagittis. Pellentesque pharetra eget arcu et lobortis. \n \n Nullam auctor sed libero vitae luctus. Praesent hendrerit neque vel nibh mattis, ut mattis arcu maximus. Cras a ipsum sagittis, convallis turpis a, pulvinar est. Integer ut posuere enim. Phasellus non tempor massa, eu pulvinar ante. Cras venenatis lacus a leo egestas, quis volutpat metus cursus. Nullam eget massa mollis, consequat mi et, iaculis quam. \n \n Nullam auctor sed libero vitae luctus. Praesent hendrerit neque vel nibh mattis, ut mattis arcu maximus. Cras a ipsum sagittis, convallis turpis a, pulvinar est. Integer ut posuere enim. Phasellus non tempor massa, eu pulvinar ante. Cras venenatis lacus a leo egestas, quis volutpat metus cursus. Nullam eget massa mollis, consequat mi et, iaculis quam",
                    style: TextStyle(height: 1.9, fontSize: 16),
                  ),
                  SizedBox(height: 100)
                ],
              ),
            ),
          ),

          // Top Bar
          AnimatedOpacity(
            opacity: _areBarsVisible ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            child: Container(
              height: 100,
              child: AppBar(
                leading: const Icon(Icons.arrow_back),
                title: Center(
                  child: Column(
                    children: [
                      Text('Title', style: TextStyle(fontSize: 18)),
                      Text('Book Part', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ),
                actions: [Padding(padding: EdgeInsets.only(right: 20),child:Icon(Icons.ios_share_rounded))],
              ),
            ),
          ),

          // Bottom Setting Bar
          AnimatedOpacity(
            opacity: _areBarsVisible ? 1 : 0,
            duration: Duration(milliseconds: 250),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // padding: EdgeInsets.only(bottom: 10),
                child: BottomNavigationBar(
                  elevation: 0,
                  type: BottomNavigationBarType.fixed,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  iconSize: 28,
                  items: [
                    BottomNavigationBarItem(icon: Icon(Icons.list_rounded,), label: ''),
                    BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
                    BottomNavigationBarItem(icon: Icon(Icons.dark_mode), label: ''),
                    BottomNavigationBarItem(icon: Icon(Icons.mode_comment_rounded), label: ''),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
