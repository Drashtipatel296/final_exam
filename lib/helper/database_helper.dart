import 'package:final_exam/model/notes_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _db;

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'notes.db',
    );
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute('CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, note TEXT)');
      },
    );
  }

  Future<int> insertData(NotesModel notes) async {
    final db = await this.db;
    return await db.insert('note', notes.toMap());
  }

  Future<int> update(NotesModel notes) async {
    final db = await this.db;
    return await db.update('note', notes.toMap(), where: 'id = ?', whereArgs: [notes.id]);
  }

  Future<int> delete(int id) async {
    final db = await this.db;
    return await db.delete('note', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<NotesModel>> fetch() async {
    final db = await this.db;
    List<Map<String, dynamic>> maps = await db!.query('note');
    return List.generate(maps.length, (i){
      return NotesModel.fromMap(maps[i]);
    });
  }
}
