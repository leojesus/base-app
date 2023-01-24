import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//https://github.com/tekartik/sqflite/blob/master/sqflite/doc/opening_asset_db.md
//https://www.sqlite.org/cli.html
late Database current;
bool isDbReady = false;

class DatabaseProvider {
  static Future<Database> database() async {
    if (!isDbReady) {
      var databasesPath = await getDatabasesPath();
      var path = join(databasesPath, "genshin-data.db");

      print('Create database');

      ByteData data = await rootBundle.load(join("assets", "genshin.db"));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
      current = await openDatabase(path, readOnly: true);
      isDbReady = true;
    }

    return current;
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DatabaseProvider.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DatabaseProvider.database();
    return db.query(table);
  }

  static Future<List<Map<String, dynamic>>> getDataByColumn(String table, String column, String value) async {
    String whereString = '$column = ?';
    final db = await DatabaseProvider.database();
    return db.query(table, where: whereString, whereArgs: [value]);
  }

  static Future<List<Map<String, dynamic>>> getInDataByKey(String table, List<String> key) async {
    String whereString = 'key in (?)';
    final db = await DatabaseProvider.database();
    return db.query(table, where: whereString, whereArgs: [key.join(',')]);
  }

  static Future<List<Map<String, dynamic>>> where(String table, String where, List<String> args, String orderBy) async {
    final db = await DatabaseProvider.database();
    return db.query(table, where: where, whereArgs: args, orderBy: orderBy);
  }

  static Future<List<Map<String, dynamic>>> runQuery(String query) async {
    final db = await DatabaseProvider.database();
    return db.rawQuery(query);
  }
}
