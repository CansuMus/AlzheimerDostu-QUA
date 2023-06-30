
import 'package:ff_55/features/companion/pages/components/notes/create_note.dart';
import 'package:ff_55/features/companion/pages/components/notes/models/note_model.dart';
import 'package:ff_55/features/companion/pages/components/notes/note_view.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class Notes_Home_Screen extends StatefulWidget {
  const Notes_Home_Screen({super.key});

  @override
  State<Notes_Home_Screen> createState() => _Notes_Home_ScreenState();
}

class _Notes_Home_ScreenState extends State<Notes_Home_Screen> {
  List<Note> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.mainThemeColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "NOTLARIM",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return NoteView(note: notes[index], index: index, onNoteDeleted:onDeleteNote,);
                }));
              },
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          notes[index].title,
                          style: const TextStyle(fontSize: 35),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          notes[index].body,
                          style: const TextStyle(fontSize: 20),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: Container(
        height: 80,
        width: 220,
        child: FloatingActionButton.extended(
          backgroundColor: Utils.mainThemeColor,
          icon: const Icon(
            Icons.add,
            size: 45,
          ),
          label: const Text(
            "Yeni Not Ekle",
            style: TextStyle(fontSize: 24),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CreateNote(
                onNewNoteCreated: onNewNote,
              );
            }));
          },
        ),
      ),
    );
  }

  void onNewNote(Note note) {
    notes.add(note);
    setState(() {});
  }

  void onDeleteNote(int index) {
    notes.removeAt(index);
    setState(() {});
  }
}
