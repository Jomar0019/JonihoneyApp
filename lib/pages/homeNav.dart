import 'package:flutter/material.dart';
// import 'package:jonihoney/models/books.dart';
import 'package:jonihoney/pages/bookDetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jonihoney/models/book_model.dart';

Future<BookModel?> getBooks(String bookid) async {
  try {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection('books')
        .doc(bookid)
        .get();

    if (doc.exists) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      BookModel book = BookModel.fromJson(data);

      print('Book Name: ${book.booktitle}');
      print('Book Summary: ${book.booksummary}');

      return book;
    }
  } catch (e) {
    print("Error getting book: ${e}");
  }
  return null;
}

class Homenav extends StatefulWidget {
  const Homenav({super.key});

  @override
  State<Homenav> createState() => _HomenavState();
}

class _HomenavState extends State<Homenav> {
  // List<BookModel> books = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _getBooks();
  // }

  // void _getBooks() {
  //   books = BookModel.getBooks();
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Recently Updated
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Recently Updated',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: books.length - 6,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetail(book: book),
                          ),
                        );
                      },
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Most Popular
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Most Popular',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: books.length - 4,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetail(book: book),
                          ),
                        );
                      },
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Series
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Series',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  itemCount: books.length - 3,
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    final book = books[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookDetail(book: book),
                          ),
                        );
                      },
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
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: 50),
        ],
      ),
    );
  }
}
