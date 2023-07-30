import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class CameraComponent extends StatefulWidget {
  final void Function(XFile file) onFile;

  const CameraComponent({
    super.key,
    required this.onFile,
  });

  @override
  State<CameraComponent> createState() => _CameraComponentState();
}

class _CameraComponentState extends State<CameraComponent> {
  late List<CameraDescription> _cameras;
  late CameraController controller;

  bool isRecording = false;

  startRecord() {
    controller.startVideoRecording().then((value) => {
          setState(() {
            isRecording = true;
          })
        });
  }

  stopRecord() {
    controller.stopVideoRecording().then((XFile? file) {
      setState(() {
        isRecording = false;
      });
      if (file != null) widget.onFile(file);
      debugPrint('${file?.path}');
    });
  }

  @override
  void initState() {
    super.initState();
    availableCameras().then((cameras) {
      _cameras = cameras;
      controller = CameraController(_cameras[0], ResolutionPreset.max);
      controller.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      }).catchError((Object e) {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              // Handle access errors here.
              break;
            default:
              // Handle other errors here.
              break;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio *
          MediaQuery.of(context).size.aspectRatio,
      child: CameraPreview(
        controller,
        child: SizedBox(
          width: 300,
          height: 300,
          child: Center(
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => !isRecording ? Colors.red : Colors.black,
                ),
                iconColor: MaterialStateProperty.resolveWith<Color>(
                  (states) => Colors.white,
                ),
              ),
              onPressed: () {
                debugPrint("${controller.value.isRecordingVideo}");
                if (!isRecording) {
                  startRecord();
                } else {
                  stopRecord();
                }
              },
              icon: Icon(!isRecording
                  ? Icons.camera_alt_outlined
                  : Icons.stop_circle_outlined),
              label: Text(
                !isRecording ? 'GRABAR' : 'GUARDAR',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
