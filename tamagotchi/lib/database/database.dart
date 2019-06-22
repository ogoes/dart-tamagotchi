import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'sql.dart';
import 'package:tamagotchi/models/user.dart';
import 'package:tamagotchi/models/pet.dart';

class DbConnection {
  DbConnection._();

  static final DbConnection db = DbConnection._();

  static Database _connection;

  Future<Database> get connection async {
    if (_connection != null) return _connection;

    _connection = await initDatabase();
    return _connection;
  }

  initDatabase() async {
    Directory documentDir = await getApplicationDocumentsDirectory();
    String path = join(documentDir.path, "tamagotchi.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(dbCreation);
    });
  }

  newUser(User source) async {
    final db = await connection;
    var res = await db.insert('user', source.toJson());
    return res;
  }

  getUser(int id) async {
    final db = await connection;
    var res = await db.query('user', where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? User.fromJson(res.first) : null;
  }

  getAllUsers() async {
    final db = await connection;
    var res = await db.query('user');
    return res.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];
  }

  getAllPets(User source) async {
    final db = await connection;
    var res = await db.query('pet', where: "user_id = ?", whereArgs: [source.id]);
    return res.isNotEmpty? res.map((pet) => Pet.fromJson(pet)).toList() : [];
  }

  getPet(int id) async {
    final db = await connection;
    var res = await db.query('pet', where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Pet.fromJson(res.first) : null;
  }
  
  updatePet(Pet source) async {
    final db = await connection;
    var res = await db.update('pet', source.toJson(), where: "id = ?", whereArgs: [source.id]);
    return res;
  }

  deletePet(int id) async {
    final db = await connection;
    db.delete('pet', where: "id = ?", whereArgs: [id]);
  }
}
