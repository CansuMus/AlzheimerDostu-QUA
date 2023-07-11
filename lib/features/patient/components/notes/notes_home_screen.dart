// // notes_home_screen.dart
//
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// import 'package:ff_55/features/patient/components/notes/create_note.dart';
// import 'package:ff_55/features/patient/components/notes/models/note_model.dart';
// import 'package:ff_55/features/patient/components/notes/note_view.dart';
// import 'package:ff_55/styles/colors/colors.dart';
//
// class NotesHomeScreen extends StatefulWidget {
//   const NotesHomeScreen({Key? key}) : super(key: key);
//
//   @override
//   State<NotesHomeScreen> createState() => _NotesHomeScreenState();
// }
//
// class _NotesHomeScreenState extends State<NotesHomeScreen> {
//   late User user;
//   late CollectionReference<Map<String, dynamic>> notesRef;
//   List<Note> notes = [];
//
//   @override
//   void initState() {
//     super.initState();
//     user = FirebaseAuth.instance.currentUser!;
//     notesRef = FirebaseFirestore.instance
//         .collection('users')
//         .doc(user.uid)
//         .collection('notes');
//     _fetchNotes();
//   }
//
//   void _fetchNotes() async {
//     try {
//       final snapshot = await notesRef.get();
//       final fetchedNotes = snapshot.docs.map((doc) {
//         final data = doc.data();
//         return Note(
//           id: doc.id,
//           title: data['title'],
//           body: data['body'],
//         );
//       }).toList();
//
//       setState(() {
//         notes = fetchedNotes;
//       });
//     } catch (e) {
//       print('Notları getirirken bir hata oluştu: $e');
//     }
//   }
//
//   Future<void> _deleteNote(int index) async {
//     try {
//       final noteId = notes[index].id;
//       await notesRef.doc(noteId).delete();
//
//       setState(() {
//         notes.removeAt(index);
//       });
//     } catch (e) {
//       print('Not silinirken bir hata oluştu: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Utils.mainThemeColor,
//         elevation: 0,
//         centerTitle: true,
//         title: const Text(
//           "NOTLARIM",
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 30),
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: notes.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => NoteView(
//                     note: notes[index],
//                     index: index,
//                     onNoteDeleted: _deleteNote,
//                   ),
//                 ),
//               );
//             },
//             child: Padding(
//               padding: EdgeInsets.all(10),
//               child: Card(
//                 child: Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         notes[index].title,
//                         style: const TextStyle(fontSize: 35),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Text(
//                         notes[index].body,
//                         style: const TextStyle(fontSize: 20),
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Container(
//         height: 80,
//         width: 220,
//         child: FloatingActionButton.extended(
//           backgroundColor: Utils.mainThemeColor,
//           icon: const Icon(
//             Icons.add,
//             size: 45,
//           ),
//           label: const Text(
//             "Yeni Not Ekle",
//             style: TextStyle(fontSize: 24),
//           ),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => CreateNote(
//                   onNewNoteCreated: (note) {
//                     setState(() {
//                       notes.add(note);
//                     });
//                   },
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
