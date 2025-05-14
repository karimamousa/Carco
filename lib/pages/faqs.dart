import 'package:flutter/material.dart';
import 'package:phase1/pages/navbar.dart';
import 'dart:math';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  final TextEditingController textController = TextEditingController();

  // البيانات المحلية
  List<Map<String, String>> notesList = [];

  void openNoteBox({String? noteID}) {
    // لو تعديل، نعرض النص الحالي
    if (noteID != null) {
      final note = notesList.firstWhere((note) => note['id'] == noteID);
      textController.text = note['note'] ?? '';
    } else {
      textController.clear();
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(labelText: "Note"),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (noteID == null) {
                // إضافة
                setState(() {
                  notesList.add({
                    'id': Random().nextInt(100000).toString(),
                    'note': textController.text
                  });
                });
              } else {
                // تعديل
                setState(() {
                  final index = notesList.indexWhere((note) => note['id'] == noteID);
                  if (index != -1) {
                    notesList[index]['note'] = textController.text;
                  }
                });
              }
              textController.clear();
              Navigator.pop(context);
            },
            child: Text(noteID == null ? "Add" : "Update"),
          )
        ],
      ),
    );
  }

  void deleteNote(String id) {
    setState(() {
      notesList.removeWhere((note) => note['id'] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xff00637c),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => navbar()));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openNoteBox,
        child: const Icon(Icons.add),
      ),
      body: notesList.isEmpty
          ? const Center(child: Text("No notes.."))
          : ListView.builder(
        itemCount: notesList.length,
        itemBuilder: (context, index) {
          final note = notesList[index];
          final id = note['id']!;
          final noteText = note['note']!;

          return ListTile(
            title: Text(noteText),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => openNoteBox(noteID: id),
                  icon: const Icon(Icons.settings),
                ),
                IconButton(
                  onPressed: () => deleteNote(id),
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}