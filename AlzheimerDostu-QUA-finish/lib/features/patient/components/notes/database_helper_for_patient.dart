import 'dart:async';
import 'package:ff_55/features/patient/components/notes/models/note_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelperForPatient {
  static final DatabaseHelperForPatient _instance = DatabaseHelperForPatient._internal();

  factory DatabaseHelperForPatient() => _instance;

  static Database? _database;

  DatabaseHelperForPatient._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'notes_patient.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE notes_patient(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            body TEXT
          )
        ''');
      },
    );
  }

  Future<List<Note>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes_patient');

    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        title: maps[i]['title'],
        body: maps[i]['body'],
      );
    });
  }

  Future<int> insertNote(Note note) async {
    final db = await database;
    return await db.insert('notes_patient', note.toMap());
  }

  Future<int> deleteNote(int id) async {
    final db = await database;
    return await db.delete(
      'notes_patient',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
