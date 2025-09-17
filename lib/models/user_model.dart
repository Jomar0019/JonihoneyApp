// class UserModel {
//   final String id;
//   final String username;
//   final String email;

//   UserModel({required this.id, required this.username, required this.email});

//   factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;
//     return UserModel(
//       id: snapshot.id,
//       username: data['username'],
//       email: data['email'],
//     );
//   }
// }