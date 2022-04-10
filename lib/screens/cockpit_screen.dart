import 'dart:async';

import 'package:aseptic/main.dart';
import 'package:aseptic/utilities/wifi_plus_socket.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:holding_gesture/holding_gesture.dart';

class CockPit extends StatefulWidget {
  @override
  _CockPitState createState() => _CockPitState();
}

class _CockPitState extends State<CockPit> {
  CameraController? controller;
  WifiPlusSocket a = WifiPlusSocket();

  @override
  void initState() {
    super.initState();
    a.start("aseptic", "123456789");
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
    controller = CameraController(cameras![0], ResolutionPreset.max);
    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    controller?.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values); // to re-show bars

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller!.value.isInitialized) {
      return Container();
    }
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          // systemOverlayStyle:
          //     SystemUiOverlayStyle(statusBarIconBrightness: Brightness),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey)),
                    onPressed: () {},
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 4),
                      child: Text('Status\nConnected',
                          textAlign: TextAlign.center),
                    )),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text('Rod\nON/OFF', textAlign: TextAlign.center),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Text('Timer\n00:00', textAlign: TextAlign.center),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                ),
                SizedBox(width: 5),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child:
                        Text('Temperature\n00.0', textAlign: TextAlign.center),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey)),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: CameraPreview(
            controller!,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      width: 150,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            HoldDetector(
                                holdTimeout: null,
                                onHold: () {
                                  print('Left Pressed Console');
                                  a.write('L');
                                },
                                child: Icon(
                                    CupertinoIcons.arrow_left_circle_fill,
                                    size: 70,
                                    color: Colors.grey)),
                            SizedBox(
                              width: 10,
                            ),
                            HoldDetector(
                                holdTimeout: null,
                                onHold: () {
                                  print('Right Pressed Console');
                                  a.write('R');
                                },
                                child: Icon(
                                    CupertinoIcons.arrow_right_circle_fill,
                                    size: 70,
                                    color: Colors.grey)),
                          ]),
                    ),
                    Container(
                      height: 150,
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HoldDetector(
                              holdTimeout: null,
                              onHold: () {
                                print('Forward Pressed Console');
                                a.write('F');
                              },
                              child: Icon(CupertinoIcons.arrow_up_circle_fill,
                                  size: 70, color: Colors.grey)),
                          SizedBox(
                            height: 10,
                          ),
                          HoldDetector(
                              holdTimeout: null,
                              onHold: () {
                                print('Back Pressed Console');
                                a.write('B');
                                // socket.stremData().listen((event) { })
                              },
                              child: Icon(CupertinoIcons.arrow_down_circle_fill,
                                  size: 70, color: Colors.grey))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
