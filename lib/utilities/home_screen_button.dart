import 'package:flutter/material.dart';

class HomeScreenButton extends StatefulWidget {
  final String image;
  final String text;
  final Function() onPressed;
  HomeScreenButton(
      {required this.image, required this.onPressed, required this.text});
  @override
  _HomeScreenButtonState createState() => _HomeScreenButtonState();
}

class _HomeScreenButtonState extends State<HomeScreenButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(40),
        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Image.asset(widget.image, height: 100, width: 100),
              SizedBox(height: 10),
              Text(widget.text)
            ],
          ),
        ),
      ),
    );
  }
}
