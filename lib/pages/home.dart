import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Recently Updated',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 10, // Example item count
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 15, // Horizontal space between items
                mainAxisSpacing: 15, // Vertical space between items
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.pink[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Image ${index + 1}'),
                      Text('Title ${index + 1}')
                    ],

                  ),
                );
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  BottomNavigationBar _bottomNavBar() {
    return BottomNavigationBar(
      fixedColor: Colors.pink[200],
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmarks),
          label: 'Bookmarks',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Book'),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Activity',
        ),
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Text(
        'Jonihoney',
        style: TextStyle(fontSize: 22, color: Colors.black),
      ),
      centerTitle: true,
      elevation: 0,

      leading: Container(alignment: Alignment.center, child: Icon(Icons.menu)),

      actions: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: Colors.pink[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(Icons.person, color: Colors.white),
        ),
      ],
    );
  }
}
