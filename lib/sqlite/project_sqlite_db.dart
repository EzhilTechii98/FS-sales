

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper2 {
  static const _databaseName = "ProjectDetailsDB.db";
  static const _databaseVersion = 1;

  static const projectDetailsTable = 'project_details_table';
  static const columnId = '_id';

  static const projectName = '_projectName';
  static const projectIndustry = '_projectIndustry';
  static const projectTechnology = '_projectTechnology';
  static const projectManager = '_projectManager';
  static const projectClientName = '_projectClientName';
  static const projectClientEmail = '_projectClientEmail';
  static const projectClientPhone = '_projectClientPhone';

  late Database _db;

  Future<void> initialization() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreatePro, onUpgrade: _onUpgrade);
  }

  Future _onCreatePro(Database database, int version) async {
    await database.execute('''
          CREATE TABLE $projectDetailsTable (
            $columnId INTEGER PRIMARY KEY,
            $projectName TEXT,
            $projectIndustry TEXT,
            $projectTechnology TEXT,
            $projectManager TEXT,
            $projectClientName TEXT,
            $projectClientEmail TEXT,
            $projectClientPhone TEXT
          )
          ''');
  }

  _onUpgrade(Database database, int oldVersion, int newVersion) async{
    await database.execute('drop table $projectDetailsTable');
    _onCreatePro(database, newVersion);
  }

  Future<int> insertProjectDetails(Map<String, dynamic> row, String tableName) async {
    return await _db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    return await _db.query(tableName);
  }
  Future<int> updateProjectDetails(Map<String, dynamic> row, String tableName) async {
    int id = row[columnId];
    return await _db.update(
      tableName,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
  Future<int> deleteProjectDetails(int id, String tableName) async {
    return await _db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}