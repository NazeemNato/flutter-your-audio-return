import 'package:flutter/material.dart';
import 'package:audiocall/screen/webrtc_screen.dart';

// Testing audio only mode 
// it is good for audio call support on flutter app 
// flutter_webrtc
void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Webrtc Audio Playground',
      debugShowCheckedModeBanner: false,
      home: WebrtcScreen(),
    );
  }
}