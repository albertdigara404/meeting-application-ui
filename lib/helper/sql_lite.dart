import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""CREATE TABLE delegates(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      name TEXT,
      passport INTEGER,
      country TEXT,
      position TEXT,
      email TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
  
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'kmameetingdb',
      version: 1,
      onCreate: (sql.Database database, int version) async =>
          await createTables(database),
    );
  }

  static Future<int> createUser(String name, String email, String passport,
      String country, String position) async {
    final db = await SQLHelper.db();
    final data = {
      'name': name,
      'email': email,
      'country': country,
      'passport': passport,
      'position': position
    };
    final id = await db.insert('delegates', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await SQLHelper.db();
    return db.query('delegates', orderBy: "id");
  }

  static Future<List<Map<String, dynamic>>> getUser(int id) async {
    final db = await SQLHelper.db();
    return db.query('delegates', where: "id = ?", whereArgs: [id], limit: 1);
  }

  static Future<int> updateUser(int id, String name, String email,
      String passport, String country, String position) async {
    final db = await SQLHelper.db();
    final data = {
      'name': name,
      'email': email,
      'country': country,
      'passport': passport,
      'position': position,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('delegates', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteUser(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("delegates", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Error: $err");
    }
  }
}
