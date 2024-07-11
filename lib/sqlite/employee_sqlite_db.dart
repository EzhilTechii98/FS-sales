import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static const _databaseName = "EmployeeDetailsDB.db";
  static const _databaseVersion = 1;

  static const employeesDetailsTable = 'employees_details_table';
  static const columnId = '_id';

  static const employeeName = '_employeeName';
  static const employeeEmail = '_employeeEmail';
  static const employeePhoneNumber = '_employeePhoneNumber';
  static const employeeTeam = '_employeeTeam';
  static const employeeDesignation = '_designation';
  static const employeePM = '_employeePM';
  static const employeeIndustry = '_employeeIndustry';
  static const employeeTechnology = '_employeeTechnology';
  static const employeeAllocated = '_employeeAllocated';

  late Database _db;

  Future<void> initialization() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
  }

  Future _onCreate(Database database, int version) async {
    await database.execute('''
          CREATE TABLE $employeesDetailsTable (
            $columnId INTEGER PRIMARY KEY,
            $employeeName TEXT,
            $employeeEmail TEXT,
            $employeePhoneNumber TEXT,
            $employeeTeam TEXT,
            $employeeDesignation TEXT,
            $employeePM TEXT,
            $employeeIndustry TEXT,
            $employeeTechnology TEXT,
            $employeeAllocated INTEGER
          )
          ''');
  }

  _onUpgrade(Database database, int oldVersion, int newVersion) async {
    await database.execute('drop table $employeesDetailsTable');
    _onCreate(database, newVersion);
  }

  Future<int> insertEmployeeDetails(Map<String, dynamic> row, String tableName) async {
    print(row);
    return await _db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows(String tableName) async {
    return await _db.query(tableName);
  }
  Future<int> updateEmployeeDetails(Map<String, dynamic> row, String tableName) async {
    int id = row[columnId];
    return await _db.update(
      tableName,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}