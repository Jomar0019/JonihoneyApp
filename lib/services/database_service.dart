import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection
  final CollectionReference books = FirebaseFirestore.instance.collection(
    'books',
  );

  // create
  Future<void> addBook(String book) {
    return books.add({'book': book, 'timestamp': Timestamp.now()});
  }

  // read
  Stream<QuerySnapshot> getBooksStream() {
    final booksStream = books
        .orderBy('timestamp', descending: true)
        .snapshots();
    return booksStream;
  }

  // Update
  Future<void> updateBook(String bookId, String newBook) {
    return books.doc(bookId).update({
      'book': newBook,
      'timestamp': Timestamp.now()
    });
  }

  // Delete
  Future<void> deleteBook(String bookId) {
    return books.doc(bookId).delete();
  }
}


















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';

// class DatabaseService {
//   // --- Singleton Setup ---
//   DatabaseService._(); // Private constructor
//   static final DatabaseService _instance = DatabaseService._(); // Singleton instance
//   factory DatabaseService() => _instance; // Factory to access the instance

//   // --- Firebase Service Instances ---
//   final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // --- Realtime Database Operations ---

//   /// Creates or updates data at a specific path in Realtime Database.
//   Future<void> setDataRTDB({
//     required String path,
//     required Map<String, dynamic> data,
//   }) async {
//     final DatabaseReference ref = _firebaseDatabase.ref().child(path);
//     await ref.set(data);
//   }

//   // --- Firestore CRUD Operations ---

//   /// Creates a new document in a Firestore collection and returns its reference.
//   /// - `collectionPath`: The path to the collection (e.g., 'users').
//   /// - `data`: The map of data to store in the document.
//   Future<DocumentReference> createDoc(
//       {required String collectionPath, required Map<String, dynamic> data}) {
//     return _firestore.collection(collectionPath).add(data);
//   }

//   /// Reads a single document from a Firestore collection.
//   /// - `collectionPath`: The path to the collection.
//   /// - `docId`: The ID of the document to read.
//   Future<DocumentSnapshot<Map<String, dynamic>>> readDoc(
//       {required String collectionPath, required String docId}) {
//     return _firestore.collection(collectionPath).doc(docId).get();
//   }

//   /// Reads all documents from a Firestore collection.
//   /// - `collectionPath`: The path to the collection.
//   Future<QuerySnapshot<Map<String, dynamic>>> readCollection(
//       {required String collectionPath}) {
//     return _firestore.collection(collectionPath).get();
//   }

//   /// Updates an existing document in a Firestore collection.
//   /// - `collectionPath`: The path to the collection.
//   /// - `docId`: The ID of the document to update.
//   /// - `data`: A map of the fields to update.
//   Future<void> updateDoc(
//       {required String collectionPath, required String docId, required Map<String, dynamic> data}) {
//     return _firestore.collection(collectionPath).doc(docId).update(data);
//   }

//   /// Deletes a document from a Firestore collection.
//   /// - `collectionPath`: The path to the collection.
//   /// - `docId`: The ID of the document to delete.
//   Future<void> deleteDoc({required String collectionPath, required String docId}) {
//     return _firestore.collection(collectionPath).doc(docId).delete();
//   }
// }