import 'package:aseptic/screens/cockpit_screen.dart';
import 'package:aseptic/utilities/ColorsRes.dart';
import 'package:aseptic/utilities/home_screen_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void startPressed() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => CockPit()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Aseptic',
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: ColorsRes.asepticGradient),
          ),
        ),
        body: Center(
          child: GridView(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: HomeScreenButton(
                    image: 'assets/start.png',
                    onPressed: () {
                      startPressed();
                    },
                    text: 'Start',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HomeScreenButton(
                    image: 'assets/instructions.png',
                    onPressed: () {
                      startPressed();
                    },
                    text: 'Instructions',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HomeScreenButton(
                    image: 'assets/contact.png',
                    onPressed: () {
                      startPressed();
                    },
                    text: 'Contact Us',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: HomeScreenButton(
                      image: 'assets/log.png',
                      onPressed: startPressed,
                      text: 'Logs'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: HomeScreenButton(
                      image: 'assets/caution.png',
                      onPressed: () {
                        startPressed();
                      },
                      text: 'Cautions'),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: HomeScreenButton(
                      image: 'assets/trouble.png',
                      onPressed: () {
                        startPressed();
                      },
                      text: 'Troubleshoot'),
                ),
              ]),
        ));
  }
}
