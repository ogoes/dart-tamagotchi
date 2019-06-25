import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tamagotchi/models/user.dart';
import 'package:tamagotchi/database/database.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _visible = false;
  bool _visibleC = false;

  bool samePass = false;

  FocusNode _emailFocus;
  FocusNode _passFocus;
  FocusNode _confirmFocus;

  TextEditingController nameController;
  TextEditingController passController;
  TextEditingController confirmController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController = TextEditingController(text: "");
    passController = TextEditingController(text: "");
    confirmController = TextEditingController(text: "");

    _emailFocus = FocusNode();
    _passFocus = FocusNode();
    _confirmFocus = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    nameController.dispose();
    passController.dispose();
    confirmController.dispose();

    _emailFocus.dispose();
    _passFocus.dispose();
    _confirmFocus.dispose();

    super.dispose();
  }

  void submit(String name, String password, String passwordConfirmation) async {
    if (password != passwordConfirmation) {
      setState(() {
        samePass = true;
      });
      return;
    } else {
      setState(() {
        samePass = false;
      });
    }


    if (name.length > 0 && password.length > 0) {
      final secureStorage = FlutterSecureStorage();

      User user = User(username: name, password: password);

      var id = await DbConnection.db.newUser(user);
      if (id > 0) {
        await secureStorage.write(key: "user", value: "$id.$name-$password");
        await secureStorage.write(key: "logged", value: "yes");
        // TODO: going to home page
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.blueAccent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.01, 0.8],
            colors: [
              Colors.pink[100],
              Colors.blueAccent,
            ],
          ),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Spacer(),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Tamagotchi :)",
                  style: TextStyle(
                      color: Color(0x78000000),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  gradient: RadialGradient(radius: 2.0, colors: [
                    Colors.grey[300],
                    Colors.white,
                  ]),
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white54,
                      blurRadius: 15.0,
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Expanded(
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(
                            foreground: Paint()
                              ..shader = LinearGradient(colors: [
                                Colors.pink[100],
                                Colors.blueAccent,
                              ]).createShader(
                                Rect.fromCircle(
                                  center: new Offset(165.0, 55.0),
                                  radius: 180.0,
                                ),
                              ),
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 8),
                          child: TextField(
                            style: new TextStyle(
                              foreground: Paint()
                                ..shader = LinearGradient(colors: [
                                  Colors.blueAccent,
                                  Colors.pink.withOpacity(0.005)
                                ]).createShader(
                                  Rect.fromCircle(
                                    center: new Offset(174.0, 100.0),
                                    radius: 180.0,
                                  ),
                                ),
                              decoration: TextDecoration.none,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              // color: Colors.blueAccent.withOpacity(0.8)
                            ),
                            focusNode: _emailFocus,
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            controller: nameController,
                            onSubmitted: (String text) {
                              _fieldFocusChange(
                                  context, _emailFocus, _passFocus);
                            },
                            decoration: InputDecoration(
                              hintText: "usuário",
                              icon: Icon(
                                FontAwesomeIcons.userAlt,
                                color: Colors.blueAccent.withOpacity(0.6),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent.withOpacity(0.6),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 8),
                          child: TextField(
                            textInputAction: TextInputAction.next,
                            style: new TextStyle(
                              foreground: Paint()
                                ..shader = LinearGradient(colors: [
                                  Colors.blueAccent,
                                  Colors.pink.withOpacity(0.005)
                                ]).createShader(
                                  Rect.fromCircle(
                                    center: new Offset(174.0, 100.0),
                                    radius: 180.0,
                                  ),
                                ),
                              decoration: TextDecoration.none,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              // color: Colors.blueAccent.withOpacity(0.8)
                            ),
                            focusNode: _passFocus,
                            keyboardType: TextInputType.text,
                            controller: passController,
                            obscureText: !_visible,
                            onSubmitted: (String text) {
                              _fieldFocusChange(
                                  context, _passFocus, _confirmFocus);
                            },
                            decoration: InputDecoration(
                              hintText: "senha",
                              errorText: samePass
                                  ? "As senhas devem ser iguais"
                                  : null,
                              icon: Icon(
                                FontAwesomeIcons.unlock,
                                color: Colors.blueAccent.withOpacity(0.6),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: Container(
                                width: MediaQuery.of(context).size.width / 9,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _visible = !_visible;
                                    });
                                  },
                                  child: Icon(
                                    _visible
                                        ? FontAwesomeIcons.solidEye
                                        : FontAwesomeIcons.solidEyeSlash,
                                    color: Colors.blueAccent.withOpacity(0.6),
                                  ),
                                ),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent.withOpacity(0.6),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent.withOpacity(0.6),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 8),
                          child: TextField(
                            style: new TextStyle(
                              foreground: Paint()
                                ..shader = LinearGradient(colors: [
                                  Colors.blueAccent,
                                  Colors.pink.withOpacity(0.005)
                                ]).createShader(
                                  Rect.fromCircle(
                                    center: new Offset(174.0, 100.0),
                                    radius: 180.0,
                                  ),
                                ),
                              decoration: TextDecoration.none,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              // color: Colors.blueAccent.withOpacity(0.8)
                            ),
                            focusNode: _confirmFocus,
                            keyboardType: TextInputType.text,
                            controller: confirmController,
                            obscureText: !_visibleC,
                            onSubmitted: (String text) {
                              _confirmFocus.unfocus();
                              submit(nameController.text, passController.text,
                                  confirmController.text);
                            },
                            decoration: InputDecoration(
                              hintText: "confirme a senha",
                              errorText: samePass
                                  ? "As senhas devem ser iguais"
                                  : null,
                              icon: Icon(
                                FontAwesomeIcons.lock,
                                color: Colors.blueAccent.withOpacity(0.6),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              suffixIcon: Container(
                                width: MediaQuery.of(context).size.width / 9,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      _visibleC = !_visibleC;
                                    });
                                  },
                                  child: Icon(
                                    _visibleC
                                        ? FontAwesomeIcons.solidEye
                                        : FontAwesomeIcons.solidEyeSlash,
                                    color: Colors.blueAccent.withOpacity(0.6),
                                  ),
                                ),
                              ),
                              enabledBorder: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blueAccent.withOpacity(0.6),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.redAccent.withOpacity(0.6),
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2.8,
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10)),
                              child: FlatButton(
                                onPressed: () {
                                  print("Signin");
                                },
                                child: Text(
                                  "Cadastrar-se",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
