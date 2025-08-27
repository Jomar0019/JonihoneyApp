class BookModel {
  String title;
  String imagePath;

  BookModel({required this.title, required this.imagePath});

  static List<BookModel> getBooks() {
    List<BookModel> books = [];

    books.add(
      BookModel(title: "The Ceo's Desire", imagePath: 'assets/images/ceo.jpg'),
    );

    books.add(
      BookModel(title: '750 Hours', imagePath: 'assets/images/750.png'),
    );
    books.add(
      BookModel(title: 'His Cold Heart', imagePath: 'assets/images/HCH.png'),
    );
    books.add(
      BookModel(title: 'Wave of Pleasure', imagePath: 'assets/images/WOP.png'),
    );
    books.add(
      BookModel(
        title: 'Last Romance',
        imagePath: 'assets/images/LastRomance.jpg',
      ),
    );
    books.add(
      BookModel(
        title: "The CEO's Daughter",
        imagePath: 'assets/images/TCD.png',
      ),
    );
    books.add(
      BookModel(
        title: "The Princess Desire",
        imagePath: 'assets/images/VS1.jpg',
      ),
    );

    return books;
  }
}
