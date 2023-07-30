import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/components/Ink_Well.component.dart';
import 'package:video_player/video_player.dart';

class VideoComponent extends StatefulWidget {
  final String url;
  final double? aspectRatio;
  final bool? isLocal;
  final bool? autoplay;
  final bool? loop;

  const VideoComponent({
    super.key,
    required this.url,
    this.aspectRatio,
    this.isLocal,
    this.autoplay,
    this.loop,
  });

  @override
  State<VideoComponent> createState() => _VideoComponentState();
}

class _VideoComponentState extends State<VideoComponent> {
  late VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    super.initState();
    if (widget.isLocal == true) {
      videoPlayerController = VideoPlayerController.asset(widget.url)
        ..initialize().then((_) {
          setState(() {});
          if (widget.autoplay == true) videoPlayerController?.play();
          if (widget.loop == true) videoPlayerController?.setLooping(true);
        });
    } else {
      videoPlayerController = VideoPlayerController.network(widget.url)
        ..initialize().then((_) {
          setState(() {});
          if (widget.autoplay == true) videoPlayerController?.play();
          if (widget.loop == true) videoPlayerController?.setLooping(true);
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWellComponent(
      onTap: () {
        setState(() {
          videoPlayerController!.value.isPlaying
              ? videoPlayerController!.pause()
              : videoPlayerController!.play();
        });
      },
      child: Center(
        child: videoPlayerController != null &&
                videoPlayerController!.value.isInitialized
            ? AspectRatio(
                aspectRatio: widget.aspectRatio ??
                    videoPlayerController!.value.aspectRatio,
                child: VideoPlayer(videoPlayerController!),
              )
            : Container(),
      ),
    );
  }
}
