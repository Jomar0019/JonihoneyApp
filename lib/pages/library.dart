import 'package:flutter/material.dart';
import 'package:jonihoney/models/books.dart';
import 'package:jonihoney/pages/bookDetail.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
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
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      // The total number of items in your list
      itemCount: books.length,
      // The delegate that controls the grid's layout
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Number of columns
        crossAxisSpacing: 8.0, // Horizontal space between items
        mainAxisSpacing: 8.0, // Vertical space between items
        childAspectRatio: 0.6, // Adjust aspect ratio to fit content
      ),
      // The builder for each grid item
      itemBuilder: (BuildContext context, int index) {
        final book = books[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookDetail(book: book)),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(book.imagePath, fit: BoxFit.cover),
          ),
        );
      },
    );
  }
}
