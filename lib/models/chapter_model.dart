// class Paragraph {
//   final String paragraphId;
//   final String text;

//   Paragraph({required this.paragraphId, required this.text});

//   factory Paragraph.fromMap(Map<String, dynamic> map) {
//     return Paragraph(
//       paragraphId: map['paragraphId'],
//       text: map['text'],
//     );
//   }
// }

// class ChapterModel {
//   final String id;
//   final String chapterTitle;
//   final int chapterNumber;
//   final List<Paragraph> content;

//   ChapterModel({
//     required this.id,
//     required this.chapterTitle,
//     required this.chapterNumber,
//     required this.content,
//   });

//   factory ChapterModel.fromSnapshot(DocumentSnapshot snapshot) {
//     final data = snapshot.data() as Map<String, dynamic>;
    
//     // Convert the list of maps from Firestore into a list of Paragraph objects
//     final contentList = (data['content'] as List)
//         .map((paragraphData) => Paragraph.fromMap(paragraphData))
//         .toList();

//     return ChapterModel(
//       id: snapshot.id,
//       chapterTitle: data['chapterTitle'],
//       chapterNumber: data['chapterNumber'],
//       content: contentList,
//     );
//   }
// }