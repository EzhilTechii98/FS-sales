import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/employee_model.dart';
/*

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

   static Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'users.db');

    return openDatabase(path, onCreate: (db, version)
    {
      return db.execute(
          'CREATE TABLE Users(id INTEGER PRIMARY KEY, username TEXT, email TEXT, designation TEXT, phonenumber TEXT, team TEXT, reportingManager TEXT, industry TEXT, technology TEXT, employeeId TEXT)');
    }, version: 2);
  }

  // Future<int> saveUser(Map<String, dynamic> user) async {
  //   var dbClient = await db;
  //   int res = await dbClient!.insert("Users", user);
  //   return res;
  // }

  Future<int> saveUser2(Employee user) async {
    var dbClient = await db;
    int res = await dbClient!.insert("Users", user.toJson());
    return res;
  }

  Future<Map?> getUser(String email) async {
    var dbClient = await db;
    List<Map> result = await dbClient!.query("Users",
        columns: ["id", "username", "email", "designation", "phonenumber", "team", "reportingManager", "industry", "technology", "employeeId"],
        where: 'email = ?',
        whereArgs: [email]);

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  Future<List<Employee>> getUsers() async {
    var dbClient = await db;
    List<Map> result = await dbClient!.query("Users");

    print('===========$result');
    List<Employee> users = [];
    for (var item in result) {
      users.add(Employee.fromJson(item as Map<String, dynamic>));
    }
    return users;
  }

  // Future<Map?> getAllUser(String username) async {
  //   var dbClient = await db;
  //   List<Map> result = await dbClient!.query("Users",
  //       columns: ["id", "username", "email", "designation", "phonenumber", "team", "reportingManager", "industry", "technology", "employeeId"],
  //       where: 'username = ?',
  //       whereArgs: [username]);
  //
  //   if (result.isNotEmpty) {
  //     return result.first;
  //   }
  //   return null;
  // }
}



Future<void> loadJsonData(DatabaseHelper dbHelper) async {
  String jsonString = await rootBundle.loadString('assets/users.json');
  print(jsonString);
  List<dynamic> jsonData = json.decode(jsonString);

  for (var user in jsonData) {
    var employee = Employee.fromJson(user);
    print(employee.toJson());  // Print to debug
    await dbHelper.saveUser2(employee);
  }
}
*/


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

  _onUpgrade(Database database, int oldVersion, int newVersion) async{
    await database.execute('drop table $employeesDetailsTable');
    _onCreate(database, newVersion);
  }

  Future<int> insertEmployeeDetails(Map<String, dynamic> row, String tableName) async {
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
  Future<int> deleteEmployeeDetails(int id, String tableName) async {
    return await _db.delete(
      tableName,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}