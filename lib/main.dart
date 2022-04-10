import 'package:aseptic/screens/login_screen.dart';
import 'package:aseptic/screens/signup_screen.dart';
import 'package:aseptic/utilities/ColorsRes.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
List<CameraDescription>? cameras;

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    home: WelcomeScreen(),
  ));
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/logo.png'),
              Text(
                'Welcome to Aseptic',
                style: TextStyle(fontSize: 30.0),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: ColorsRes.asepticGradient),
                  child: Center(
                      child:
                          Text('Login', style: TextStyle(color: Colors.white))),
                ),
              ),
              SizedBox(height: 20.0),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: ColorsRes.asepticGradient),
                  child: Center(
                      child: Text('Sign Up',
                          style: TextStyle(color: Colors.white))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
