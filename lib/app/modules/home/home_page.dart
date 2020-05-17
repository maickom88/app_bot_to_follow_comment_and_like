import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(children: <Widget>[
            Image(image: AssetImage('src/images/robot.png'), height: 300),
            SizedBox(height: 50),
            RaisedButton(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 18),
              color: Colors.lightBlue[400],
              onPressed: () => Modular.to.pushNamed('/getLikeComment'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Bot to follow",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
              color: Colors.blueAccent.withOpacity(0.8),
              onPressed: () => Modular.to.pushNamed('/getFollows'),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Bot like and comment",
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
