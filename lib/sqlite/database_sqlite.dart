import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/user_model.dart';

class DatabaseHelper {
  static Database? _database;
  static const String _tableName = 'users';

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  static Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'app_database.db');
    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, email TEXT, password TEXT)');
    }, version: 1);
  }

  static Future<void> insertUser(User user) async {
    final db = await database;
    await db.insert(_tableName, user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<User?> getUser(String email, String password) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(_tableName,
        where: 'email = ? AND password = ?', whereArgs: [email, password]);
    if (maps.isNotEmpty) {
      return User(
        id: maps[0]['id'],
        username: maps[0]['username'],
        email: maps[0]['email'],
        password: maps[0]['password'],
      );
    }
    return null;
  }
}