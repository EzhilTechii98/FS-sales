// Parse JSON and insert users into SQLite database
import 'dart:convert';

import '../model/user_model.dart';
import 'database_sqlite.dart';

void parseAndInsertUsers(String jsonData) async {
  final List<dynamic> usersJson = jsonDecode(jsonData);
  for (final userJson in usersJson) {
    final user = User(
      id: usersJson.indexOf(userJson) + 1,
      username: userJson['Username'],
      email: userJson['Email'],
      password: '123456', // Static password
    );
    await DatabaseHelper.insertUser(user);
  }
}