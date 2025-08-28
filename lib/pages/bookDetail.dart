import 'package:flutter/material.dart';
import 'package:jonihoney/models/books.dart';

class BookDetail extends StatelessWidget {
  final BookModel book;

  const BookDetail({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.ios_share)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(book.imagePath, width: 180),
                  ),
                ],
              ),
            ),
            Text(book.title, style: TextStyle(fontSize: 24)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.visibility, color: Colors.grey, size: 22),
                          SizedBox(width: 6),
                          Text(
                            'Reads',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        '1.2M',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(color: Colors.grey, width: 1),
                      left: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.comment, color: Colors.grey, size: 22),
                          SizedBox(width: 6),
                          Text(
                            'Comments',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        '5.2K',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.list, color: Colors.grey, size: 22),
                          SizedBox(width: 6),
                          Text(
                            'Parts',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                      Text(
                        '32',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),

            SizedBox(
              width: 350,
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff624b81),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {},
                child: Text('Start Reading', style: TextStyle(fontSize: 16)),
              ),
            ),


            SizedBox(height: 10,),

            Padding(padding: const EdgeInsets.only(left: 20, right: 20),child:Text(book.summary, style: TextStyle(height: 1.6, fontSize: 16),)),

            SizedBox(height: 20,),

          ],
        ),
      ),
    );
  }
}
