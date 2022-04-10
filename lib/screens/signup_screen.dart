import 'package:aseptic/screens/home_screen.dart';
import 'package:aseptic/utilities/ColorsRes.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
        child: SingleChildScrollView(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/logo.png'),
                Padding(
                  padding: EdgeInsets.only(top: 40, bottom: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Sign Up',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Name',
                  ),
                ),
                TextFormField(
                  validator: (value) {},
                  decoration: InputDecoration(
                    hoverColor: Colors.grey,
                    hintText: 'Enter your Name',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.withOpacity(0.5)),
                  ),
                  keyboardType: TextInputType.text,
                  controller: null,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Email'),
                ),
                TextFormField(
                  validator: (value) {},
                  decoration: InputDecoration(
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.withOpacity(0.5))),
                  keyboardType: TextInputType.emailAddress,
                  controller: null,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Phone'),
                ),
                TextFormField(
                  validator: (value) {},
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Enter your Phone Number',
                      hintStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey.withOpacity(0.5))),
                  keyboardType: TextInputType.phone,
                  controller: null,
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password'),
                ),
                TextFormField(
                  validator: (value) {},
                  obscureText: true,
                  controller: null,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.withOpacity(0.5)),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Confirm Password',
                  ),
                ),
                TextFormField(
                  validator: (value) {},
                  obscureText: true,
                  controller: null,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Re-enter your Password',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey.withOpacity(0.5)),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
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
      ),
    );
  }
}
