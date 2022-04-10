import 'package:aseptic/screens/home_screen.dart';
import 'package:aseptic/utilities/ColorsRes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          padding:
              EdgeInsets.only(left: 20, right: 20, bottom: kToolbarHeight - 10),
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
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    validator: (value) {},
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: 'Enter Your Email',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey.withOpacity(0.5))),
                    keyboardType: TextInputType.emailAddress,
                    controller: null,
                  ),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Password'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
                  child: TextFormField(
                    validator: (value) {},
                    obscureText: true,
                    controller: null,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Password',
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
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: ColorsRes.asepticGradient),
                  child: GestureDetector(
                    child: Center(
                        child: Text('Login',
                            style: TextStyle(color: Colors.white))),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
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
