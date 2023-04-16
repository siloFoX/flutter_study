import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:video_player/video_player";
import "dart:io";
import "package:vid_player/component/custom_icon_button.dart";


class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final GestureTabCallback onNewVideoPressed;
  
  const CustomVideoPlayer({
    required this.video,
    required this.onNewVideoPressed,
    Key? key,
  }) : super(key : key);
  
  
  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}


class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;
  bool showControls = false;
  
  
  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }
  
  
  @override
  void initState() {
    super.initState();
    
    initializeController();
  }
  
  initializeController() async {
    final videoController = VideoPlayerController.file(
      File(widget.video.paht),
    );
    
    await videoController.initialize();
    
    videoController.addListener(videoControllerListener);
    
    setState(() {
      this.videoController = videoController;
    });
  }
  
  void videoControllerListener () {
    setState(() {});
  }
  
  
  @override
  void dispose () {
    videoController!.removeListener(videoControllerListener);
    super.dispose();
  }
  
  
  @override
  Widget build (BuildContext context) {
    if (videoController == null) {
      return Center(
        child : CircularProgressIndicator(),
      );
    }
    // initState 에 controller 에 관한 부분이 동작하고 있는 동시에 circular indicator 가 동작하는게 잘 이해되지 않는다.
    // search 에 대충 적어놨다. 비동기때문이다.
    
    return GestureDetecter (
      onTap : () {
        setState(() {showControls = !showControls;});
      },
      child : AspctRatio(
        aspectRatio : videoController!.value.aspectRatio,
        child : Stack(
          children : [
            VideoPlayer(
              videoController!,
            ),
            if (showControls) {
              Container(
                color : Colors.black.withOpacity(0.5),
              ),
              Align(
                alignment : Alignment.topRight,
                child : CustomIconButton(
                  onPressed : widget.onNewVideoPressed,
                  iconData : Icons.photo_camera_back,
                ),
              ),
              Align(
                alignment : Alignment.center,
                child : Row(
                  mainAxisAlignment : MainAxisAlignment.spaceEvenly,
                  children : [
                    CustomIconButton(
                      onPressed : onReversePressed,
                      iconData : Icons.rotate_left,
                    ),
                    CustomIconButton(
                      onPressed : onPlayerPressed,
                      iconData : videoController!value.isPlaying ?
                      Icons.pause : Icons.play_arrow,
                    ),
                    CustomIconButton(
                      onPressed : onForwardPressed,
                      iconData : Icons.rotate_right,
                    ),
                  ],
                ),
              ),
            }
            Positioned(
              bottom : 0,
              right : 0,
              left : 0,
              child : Padding(
                padding : EdgeInsets.symmetric(horizontal : 8.0),
                child : Row(
                  children : [
                    renderTimeTextFromDuration(
                      videoController!.value.position,
                    ),
                    Expanded(
                      child : Slider(
                
                        onChanged : (double val) {
                          videoController!.seekTo(
                            Duration(seconds : val.toInt()));
                        },
                        
                        value : videoController!.value.position.inSeconds.toDouble(),
                        min : 0,
                        max : videoController.value.duration.inSeconds.toDouble(),
                      ),
                    ),
                    renderTimeTextFromDuration(videoController!.value.duration),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  void onReversePressed () {
    final currentPosition = videoController!.value.position;
    
    Duration position = Duration();
    
    position = currentPosition.inseconds > 10 ? currentPosition - Duration(seconds : 10) : Duraion(seconds : 0)
    // 3항 연산자로 가능?
    
    videoController!.seekTo(position);
  }
  
  void onForwardPressed () {
    final maxPosition = videoController!.value.duration;
    final currentPosition videoController!.value.position;
    
    Duration position = Duration();
    
    position = maxPosition - currentPosition.inSeconds > Duration(seconds : 10) ? currentPosition + Duration(seconds : 10) : maxPosition
    
    videoController!.seekTo(postion);
  }
  
  void onPlayerPressed () {
    videoController!.value.isPlaying ? videoController!.pause(); : videoController!.play();
  }
  
  Widget renderTimeTextFromDuration(Duration durations) {
    return Text(
      "${duration.inMinutes.toString().padLeft(2, '0')}:${duration.inSeconds % 60).toString().(padLeft(2, '0')}",
      style : TextStyle(
        color : Colors.white,
      ),
    );
  }
}