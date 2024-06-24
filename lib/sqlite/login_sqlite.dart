
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/employee_model.dart';

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