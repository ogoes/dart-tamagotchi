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
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) async {},
      onCreate: (Database db, int version) async {
        await db.execute(userCreation);
        await db.execute(petCreation);
      },
    );
  }

  newUser(User source) async {
    final db = await connection;

    var res = await db.rawInsert("INSERT INTO user (username, password) VALUES (?, ?);", [source.username, source.password]);
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
    print(res.first);
    return res.isNotEmpty ? res.map((c) => User.fromJson(c)).toList() : [];
  }

  getAllPetsByUser(User source) async {
    final db = await connection;
    var res =
        await db.query('pet', where: "user_id = ?", whereArgs: [source.id]);
    return res.isNotEmpty ? res.map((pet) => Pet.fromJson(pet)).toList() : [];
  }

  getPetById(int id) async {
    final db = await connection;
    var res = await db.query('pet', where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Pet.fromJson(res.first) : null;
  }

  newPet(Pet source) async {
    final db = await connection;

    var res = await db.insert('pet', source.toJson());
    return res;
  }

  updatePet(Pet source) async {
    final db = await connection;
    var res = await db.update('pet', source.toJson(),
        where: "id = ?", whereArgs: [source.id]);
    return res;
  }

  deleteAllUser() async {
    final db = await connection;
    db.delete('user');
  }

  deletePet(int id) async {
    final db = await connection;
    db.delete('pet', where: "id = ?", whereArgs: [id]);
  }
}
