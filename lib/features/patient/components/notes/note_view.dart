import 'package:ff_55/features/patient/components/notes/models/note_model.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';

class NoteView extends StatelessWidget {
  final Note note;
  final int index;
  final Function onNoteDeleted;
  const NoteView(
      {super.key,
      required this.note,
      required this.index,
      required this.onNoteDeleted});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "NOTUM",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Utils.mainThemeColor,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "Notumu Sil",
                          style: TextStyle(fontSize: 30),
                        ),
                        content: Text(
                            "Notunuz (${note.title}) silmek istediğinize emin misiniz?",
                            style: const TextStyle(fontSize: 25)),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                onNoteDeleted(index);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Sil",
                                style: TextStyle(
                                    fontSize: 30, color: Utils.mainThemeColor),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("İptal",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Utils.mainThemeColor)))
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.delete,
                size: 40,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note.title,
              style: const TextStyle(fontSize: 35),
            ),
            Text(
              note.body,
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
