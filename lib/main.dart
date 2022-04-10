//import 'package:flutter/material.dart';
// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
//import 'ad_helper.dart';
//import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = "Invicteen123";
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 96.0,
        child: Image.asset('assets/animeprofile.jpg'),
      ),
    );
    return MaterialApp(
      theme: _darkTheme,
      debugShowCheckedModeBanner: false,
      title: "My App",
      home: Scaffold(
        drawer: SideBar(),
        backgroundColor: Colors.indigo[400],
        appBar: AppBar(
          elevation: 500.0,
          centerTitle: true,
          title: Text("", style: TextStyle(fontSize: 30)),
          shadowColor: Colors.orange,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey,
        ),
        body: Center(
          child: Column(
            children: [
              logo,
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text("Hello" + " " + name,
                    style: TextStyle(fontSize: 45, color: Colors.white)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  child: Text(
                      "Welcome to the Home Page.This page is customizable.Above is your profile picture.You can customize it however you want. Also this is the first project of mine you are witnessing here. So stay tuned for more content from,\n\n\nInvicteen123! XX",
                      style: TextStyle(fontSize: 18)))
            ],
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatefulWidget {
  //const NextScreen({Key? key}) : super(key: key);

  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  var userInput = '';
  var secondInput = '';
  var result = '';
  void buttonText(var text) {
    setState(() {
      result += text;
      userInput = result;
    });
  }

  void clear() {
    setState(() {
      result = '';
    });
  }

  void del() {
    setState(() {
      result = result.substring(0, result.length - 1);
    });
  }

  void split() {
    double num = 0, num3 = 1, num4 = 0;
    setState(() {
      if (userInput.contains("+")) {
        var spil = userInput.split("+");
        for (int i = 0; i < spil.length; i++) {
          num += double.parse(spil[i]);
        }
        result = "$num";
      }
      if (userInput.contains("-")) {
        var spil2 = userInput.split("-");
        double temp = double.parse(spil2[0]);
        double num2 = temp;

        for (int i = 1; i < spil2.length; i++) {
          num2 -= double.parse(spil2[i]);
        }
        result = "$num2";
      }
      if (userInput.contains("x")) {
        var spil3 = userInput.split("x");

        for (int i = 0; i < spil3.length; i++) {
          num3 *= double.parse(spil3[i]);
        }
        result = "$num3";
      }
      if (userInput.contains("/")) {
        var spil4 = userInput.split("/");

        num4 = double.parse(spil4[0]) / double.parse(spil4[1]);
        result = "$num4";
      }
      if (userInput.contains("%")) {
        var spil5 = userInput.split("%");

        double num5 = double.parse(spil5[0]) / 100;

        result = "$num5";
      }
    });
  }

  void change() {
    setState(() {
      result = "-";
      if (userInput.contains("-")) {
        userInput = "+";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        drawer: SideBar(),
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text(
            "Calculator",
            style: TextStyle(fontSize: 35),
          ),
          //foregroundColor: Colors.green,
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(width: 50, height: 50),
            Container(
                child: SizedBox(
              width: 275,
              height: 150,
              child: Text("$result",
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: TextStyle(fontSize: 30, color: Colors.white)),
            )),
            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  height: 95,
                  width: 76,
                  child: TextButton(
                      onPressed: () => {clear()},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0))),
                        //shape: CircleBorder(),
                        onPrimary: Colors.red,
                      ),
                      child: Text("AC",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  height: 95,
                  width: 76,
                  child: TextButton(
                      onPressed: () => {change()},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0))),
                        onPrimary: Colors.orangeAccent,
                        //shape: CircleBorder(),
                      ),
                      child: Text("+/-",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  height: 95,
                  width: 76,
                  child: TextButton(
                      onPressed: () => {buttonText("%")},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0))),
                        //shape: CircleBorder(),
                        onPrimary: Colors.orangeAccent,
                      ),
                      child: Text("%",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  height: 95,
                  width: 76,
                  child: TextButton(
                      onPressed: () => {buttonText("/")},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0))),
                        onPrimary: Colors.orangeAccent,
                        //shape: CircleBorder(),
                      ),
                      child: Text("/",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
              ],
            )),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {buttonText("7")},
                        style: ElevatedButton.styleFrom(
                            //shape: CircleBorder(),
                            ),
                        child: Text("7",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {buttonText("8")},
                        style: ElevatedButton.styleFrom(
                            //shape: CircleBorder(),
                            ),
                        child: Text("8",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {buttonText("9")},
                        style: ElevatedButton.styleFrom(
                            //shape: CircleBorder(),
                            ),
                        child: Text("9",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {buttonText("x")},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0.0))),
                          onPrimary: Colors.orangeAccent,
                          //shape: CircleBorder(),
                        ),
                        child: Text("x",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                  ),
                ],
              ),
            ),
            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  height: 95,
                  width: 76,
                  child: TextButton(
                      onPressed: () => {buttonText("4")},
                      style: ElevatedButton.styleFrom(
                          //shape: CircleBorder(),
                          ),
                      child: Text("4",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  height: 95,
                  width: 76,
                  child: TextButton(
                      onPressed: () => {buttonText("5")},
                      style: ElevatedButton.styleFrom(
                          //shape: CircleBorder(),
                          ),
                      child: Text("5",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  height: 95,
                  width: 76,
                  child: TextButton(
                      onPressed: () => {buttonText("6")},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        //shape: CircleBorder(),
                      ),
                      child: Text("6",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 20,
                  width: 20,
                ),
                SizedBox(
                  height: 95,
                  width: 76,
                  child: TextButton(
                      onPressed: () => {buttonText("-")},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(0.0))),
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        onPrimary: Colors.orangeAccent,
                        //shape: CircleBorder(),
                      ),
                      child: Text("-",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold))),
                ),
              ],
            )),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {buttonText("1")},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          // shape: CircleBorder(),
                        ),
                        child: Text("1",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {buttonText("2")},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          // shape: CircleBorder(),
                        ),
                        child: Text("2",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold))),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                      height: 95,
                      width: 76,
                      child: TextButton(
                          onPressed: () => {buttonText("3")},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            //shape: CircleBorder(),
                          ),
                          child: Text("3",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold)))),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {buttonText("+")},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0.0))),
                          padding: EdgeInsets.zero,
                          onPrimary: Colors.orangeAccent,
                          //shape: CircleBorder(),
                        ),
                        child: Text("+", style: TextStyle(fontSize: 40))),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {buttonText(".")},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          //shape: CircleBorder(),
                        ),
                        child: Text(".", style: TextStyle(fontSize: 40))),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {buttonText("0")},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          //shape: CircleBorder(),
                        ),
                        child: Text("0", style: TextStyle(fontSize: 30))),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {del()},
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.orangeAccent,
                          //shape: CircleBorder(),
                          padding: EdgeInsets.zero,
                        ),
                        child: Text("DEL", style: TextStyle(fontSize: 30))),
                  ),
                  SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  SizedBox(
                    height: 95,
                    width: 76,
                    child: TextButton(
                        onPressed: () => {split()},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0.0))),
                          onPrimary: Colors.orangeAccent,
                          //shape: CircleBorder(),
                        ),
                        child: Text("=", style: TextStyle(fontSize: 40))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttontapped;

  MyButton({this.color, this.textColor, this.buttonText, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(0.2),
        child: ClipRRect(
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// void _listen() async{
//   if(!_isListening) {
//     bool available = await _speech.initialize(

//     );
//   }
// }

class SideBar extends StatefulWidget {
  // const SideBar({Key? key}) : super(key: key);
  static String tap = "login-page";

  @override
  _State createState() => _State();
}

class _State extends State<SideBar> {
  bool _isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Text(
                "Menu",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, color: Colors.orange[300]),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              navigate_next(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('Login'),
            onTap: () {
              navigate_next_third(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate_outlined),
            title: Text('Calculator'),
            onTap: () {
              navigate_next_second(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // navigate_next_third(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('You have been logged out')));
            },
          ),
          SizedBox(
            height: 330,
          ),
          Container(child: Text("©Copyright,All Rights Reserved by Sanjayan")),
        ],
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  static String tag = "login-page";
  //LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 48.0,
        child: Image.asset('assets/animeprofile.jpg'),
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      theme: _darkTheme,
      home: Scaffold(
        drawer: SideBar(),
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          shadowColor: Colors.deepOrangeAccent,
          elevation: 100,
        ),
        //backgroundColor: Colors.white,
        body: Container(
          child: ListView(children: [
            Container(
              child: Column(
                children: [
                  Container(
                      child: Text("      ", style: TextStyle(fontSize: 50))),
                  Container(
                    child: Column(
                      children: [
                        logo,
                      ],
                    ),
                  ),
                  Container(
                    child: Text("                             ",
                        style: TextStyle(fontSize: 100)),
                  ),
                  Container(
                    child: Text("Enter Your Login Credentials",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)),
                  ),
                  Container(child: Text("  ")),
                  Container(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        labelText: "Enter UserName",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                      ),
                    ),
                  ),
                  Container(
                    child: Text("        ", style: TextStyle(fontSize: 50)),
                  ),
                  Container(
                      child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: "Enter Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0))))),
                  Container(
                    child: Text("                             ",
                        style: TextStyle(fontSize: 30.0)),
                  ),
                  Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepOrangeAccent)),
                      child: Text("Log in", style: TextStyle(fontSize: 20.0)),
                      onPressed: () {
                        navigate_next(context);
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    child: TextButton(
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

void navigate_next(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
}

void navigate_next_second(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => NextScreen()));
}

void navigate_next_third(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => LoginScreen()));
}

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
);
ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
);
