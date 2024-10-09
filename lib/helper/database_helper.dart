import 'package:final_exam/model/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  get() async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() {
    String path = join(
      getDatabasesPath() as String,
      'notes.db',
    );
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute('CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, note TEXT)');
      },
    );
  }

  Future<int> insertData(NotesModel notes) async {
    final db = await _db;
    return await db!.insert('notes.db', notes.toMap());
  }

  Future<int> update(NotesModel notes) async {
    final db = await _db;
    return await db!.update('notes.db', notes.toMap(), where: 'id = ?', whereArgs: [notes.id]);
  }

  Future<int> delete(int id) async {
    final db = await _db;
    return await db!.delete('notes.db', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<NotesModel>> fetch() async {
    final db = await _db;
    List<Map<String, dynamic>> maps = await db!.rawQuery('notes.db');
    return List.generate(maps.length, (i){
      return NotesModel.fromMap(maps[i]);
    });
  }
}
