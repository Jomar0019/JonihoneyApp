// ignore: file_names
import 'package:flutter/material.dart';
import 'package:jonihoney/models/books.dart';

class Homenav extends StatefulWidget {
  const Homenav({super.key});

  @override
  State<Homenav> createState() => _HomenavState();
}

class _HomenavState extends State<Homenav> {
  List<BookModel> books = [];

  @override
  void initState() {
    super.initState();
    _getBooks();
  }

  void _getBooks() {
    books = BookModel.getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Recently Updated',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 220,
            child: ListView.separated(
              itemCount: books.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20, right: 20),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemBuilder: (context, index) {
                return SizedBox(
                  width: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          books[index].imagePath,
                          fit: BoxFit.cover,
                          width: 120,
                          height: 180,
                        ),
                      ),
                      SizedBox(height: 6),
                      Expanded( child: Text(
                        books[index].title,
                        textAlign: TextAlign.center,
                        style : TextStyle(fontSize: 12),
                      )),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
