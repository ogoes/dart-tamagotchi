

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'sql.dart';

class DbConnection{
  DbConnection _connection;

  Future<DbConnection> get connection async {
    if (_connection != null) return _connection;

    _connection = await initDatabase();
    return _connection;
  }


  initDatabase() async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    String path = join(documentDir.path, "tamagotchi.db");
    return await openDatabase(path, version: 1, onOpen: (db) {}, onCreate: (Database db, int version) async {
      await db.execute(dbCreation);
    });
  }
}

class DataProvider {


}
