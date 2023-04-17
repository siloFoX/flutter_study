import "package:flutter/material.dart";
import "package:permission_handler/permission_handler.dart";


class CamScreen extends StatefulWidget {
  const CamScreen({Key? key}) : super(key : key);
  
  @override
  _CamScreenState createState() => _CamScreenState();
}


class _CamScreenState extends State<CamScreen> {
  RtcEngine? engine;
  int? uid;
  int? otherUid;
  
  Future<bool> init() async {
    final resp = await [Permission.camera, Permission.microphone].request();
    
    final cameraPermission = resp[Permission.camera];
    final micPermission = resp[Permission.microphone];
    
    if (cameraPermission != PermissionStatus.granted || micPermission != PermissionStatus.granted)
    throw "There is no Permission to Camer or Mic";
    
    // 필요없는 내용이 너무 많아서 생략함
    if (engine == null) {
      engine = createAgoraRtcEngine();
      
      await engine!.initialize(
        RtcEngineContext(
          appId : APP_ID,
          channelProfile : ChannelProfileType.channelProfileLiveBroadcasting,
        ),
      );
      
      // engine!.registerEventHandler(
      //   RtcEngineEventHandler(
      //     onJoinChannelSuccess : (
      //       )))
    }
    
    return true;
  }
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text("LIVE"),
      ),
      body : FutureBuilder(
        future : init(),
        builder : (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child : Text(
                snapshot.error.toString(),
              ),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child : CircularProgressIndicator(),
            );
          }
          
          return Center(
            child : Text("All Auth is fine"),
          );
        }
      ),
    );
  }
}