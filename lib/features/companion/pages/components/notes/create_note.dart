
import 'package:ff_55/features/companion/pages/components/notes/models/note_model.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';



class CreateNote extends StatefulWidget {
  final Function(Note) onNewNoteCreated;
  const CreateNote({super.key, required this.onNewNoteCreated});

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.mainThemeColor,
        title: const Text("Yeni Not Oluştur"),
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(fontSize: 40),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Başlık",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: bodyController,
              style: const TextStyle(fontSize: 30),
              decoration:
                  const InputDecoration(border: InputBorder.none, hintText: "Notum"),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 80,
        width: 220,
        child: FloatingActionButton.extended(
            onPressed: ()  {
              if (titleController.text.isEmpty) {
                return;
              }
              if (bodyController.text.isEmpty) {
                return;
              }
              final note =
                  Note(title: titleController.text, body: bodyController.text);
              widget.onNewNoteCreated(note);
              Navigator.of(context).pop();
            },
            backgroundColor: Utils.mainThemeColor,
            icon: const Icon(
              Icons.save,
              size: 45,
            ),
            label: const Text(
              "Kaydet",
              style: TextStyle(fontSize: 24),
            )),
      ),
    );
  }

}
