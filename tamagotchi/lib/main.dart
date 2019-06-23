import 'package:flutter/material.dart';
import 'package:tamagotchi/database/database.dart';
import 'package:tamagotchi/models/user.dart';
import 'package:tamagotchi/states/normal.dart';
import 'package:tamagotchi/pages/login.dart';


import 'models/pet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste Banco',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index;

  List<User> user = [];
  List<Pet> pets = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DbConnection.db.deleteAllUser();
    DbConnection.db
        .newUser(User(username: "otavio", password: "asdas"))
        .then((item) => print(item));

    DbConnection.db.getAllUsers().then((users) {
      setState(() {
        user = users;
      });
      print(users.first.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: user.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Text(user[index].username),
                          Text(user[index].password),
                          Text(user[index].id.toString()),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: pets.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: <Widget>[
                          Text(pets[index].name),
                          Text(pets[index].icon),
                          Text(pets[index].id.toString()),
                          Text(pets[index].userId.toString()),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () async {
                await DbConnection.db
                    .newUser(User(username: "otavia", password: "gord"));
                user = await DbConnection.db.getAllUsers();
                setState(() {});
              },
              child: Icon(Icons.add_circle),
            ),
          ),
          FloatingActionButton(
            onPressed: () async {
              await DbConnection.db.newPet(Pet(
                name: "novo",
                icon: "normal",
                userId: 1,
                state: Normal("normal", name: "novo"),
              ));
              pets = await DbConnection.db.getAllPetsByUser(user.first);
              setState(() {});
            },
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
