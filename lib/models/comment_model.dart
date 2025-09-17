// class CommentModel {
//   final String id;
//   final String paragraphId;
//   final String userId;
//   final String username;
//   final String text;
//   final Timestamp createdAt;

//   CommentModel({
//     required this.id,
//     required this.paragraphId,
//     required this.userId,
//     required this.username,
//     required this.text,
//     required this.createdAt,
//   });

//   factory CommentModel.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;
//     return CommentModel(
//       id: snapshot.id,
//       paragraphId: data['paragraphId'],
//       userId: data['userId'],
//       username: data['username'],
//       text: data['text'],
//       createdAt: data['createdAt'],
//     );
//   }
// }