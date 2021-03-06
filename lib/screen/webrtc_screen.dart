import 'package:flutter/material.dart';
import 'package:flutter_webrtc/webrtc.dart';

class WebrtcScreen extends StatefulWidget {
  WebrtcScreen({Key key}) : super(key: key);

  @override
  _WebrtcScreenState createState() => _WebrtcScreenState();
}

class _WebrtcScreenState extends State<WebrtcScreen> {
  final _rtcVideoRenderer = new RTCVideoRenderer();

  
  @override
  void dispose() {
    _rtcVideoRenderer.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    initVideoRender();
    getVideoFromUser();
  }

  initVideoRender() async{
   await  _rtcVideoRenderer.initialize();
  }

  getVideoFromUser() async {
    final Map<String, dynamic> mediaConstraints = {
      'audio': true,
      'video': false,
    };

    MediaStream stream = await navigator.getUserMedia(mediaConstraints);
    _rtcVideoRenderer.srcObject = stream;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Webrtc Audio playground'),
      ),
      body: Container(
        // child:Text('Audio Playing...')
        child: Stack(
          children: [
            Positioned(
                top: 0.0,
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: new RTCVideoView(_rtcVideoRenderer))
          ],
        ),
      ),
    );
  }
}
