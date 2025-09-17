// class BookModel {
//   final String id;
//   final String title;
//   final String authorId;
//   final String authorName;
//   final String coverImageUrl;
//   final String summary;
//   final String genre;
//   final int totalReads;
//   final double averageRating;
//   final Timestamp createdAt;

//   BookModel({
//     required this.id,
//     required this.title,
//     required this.authorId,
//     required this.authorName,
//     required this.coverImageUrl,
//     required this.summary,
//     required this.genre,
//     required this.totalReads,
//     required this.averageRating,
//     required this.createdAt,
//   });

//   factory BookModel.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;
//     return BookModel(
//       id: snapshot.id, // Get the document ID
//       title: data['title'],
//       authorId: data['authorId'],
//       authorName: data['authorName'],
//       coverImageUrl: data['coverImageUrl'],
//       summary: data['summary'],
//       genre: data['genre'],
//       totalReads: data['totalReads'],
//       averageRating: (data['averageRating'] as num).toDouble(),
//       createdAt: data['createdAt'],
//     );
//   }
// }