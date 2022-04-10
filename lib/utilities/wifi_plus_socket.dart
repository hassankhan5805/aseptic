import 'dart:async';
import 'dart:io';
import 'package:wifi_iot/wifi_iot.dart';


// WifiPlusSocket a = WifiPlusSocket();    create instance of this class
// a.start("loadcellesp", "123456789");    add this to start Socket with Wifi
// you can use a.write to send data 
// their is listen() which continuously recieve data

class WifiPlusSocket  {
  String? ssid;
  String? password;
  bool isWifiConnected = false;
  bool isMobileInternet = false;
  Socket? channel;
  String reciever = "";
  bool isChannelConnected = false;

start(String ssi,String pass){
      ssid = ssi;
    password = pass;
  
    connectWifi().then((value) => channelconnect());
    Timer.periodic(Duration(seconds: 5), (Timer t) => check());
}
  Future<void> check() async {
    bool a = await WiFiForIoTPlugin.isEnabled();
    String? currentSSID = await WiFiForIoTPlugin.getSSID();
    if (!a) {
      await WiFiForIoTPlugin.setEnabled(true);
    } else if (currentSSID != ssid) connectWifi();
    try {
      if (channel!.remotePort == 1669)
        isChannelConnected = true;
      else {
        isChannelConnected = false;
        channelconnect();
      }
    } catch (e) {
      print(e);
      isChannelConnected = false;
      channelconnect();
    }
    print("is channel connected $isChannelConnected");
  }

  Future<void> connectWifi() async {
    await WiFiForIoTPlugin.loadWifiList();
    isWifiConnected = await WiFiForIoTPlugin.connect(ssid!,
        security: NetworkSecurity.WPA, password: password);
    if (isWifiConnected == false) connectWifi();
  }

  Future<void> channelconnect() async {
    try {
      channel = await Socket.connect('192.168.43.230', 1669);
      channel!.listen(
        (message) {
          reciever = String.fromCharCodes(message);
          print(reciever);
        },
        onError: (error) {
          print("error in listening" + error.toString());
          check();
        },
      );
    } catch (_) {
      print("error on connecting to socket.");
    }
  }

  write(String msg) {
    isChannelConnected ? channel!.write(msg) : print("Channel not connected");
  }
 
}
