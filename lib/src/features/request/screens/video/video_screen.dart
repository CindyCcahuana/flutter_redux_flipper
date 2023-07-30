import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/border_wrapper.componet.dart';
import 'package:mnsolutions/src/common/components/camera.component.dart';
import 'package:mnsolutions/src/common/components/content_wrapper.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/video.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/features/request/components/dropdown_services.component.dart';
import 'package:mnsolutions/src/features/request/redux/service_thunk.dart';
import 'package:mnsolutions/src/redux/app_state.dart';

class VideoSceen extends StatefulWidget {
  static const String route = '/request/video';

  const VideoSceen({super.key});

  @override
  State<VideoSceen> createState() => _VideoSceenState();
}

class _VideoSceenState extends State<VideoSceen> {
  String filePath = '';
  bool isWithoutVideo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const DropdownServicesComponent(),
              Expanded(
                flex: 3,
                child: Center(
                  child: FractionallySizedBoxComponent(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: spacing[9]),
                          child: Text(
                              style: Theme.of(context).textTheme.titleLarge,
                              "Grabemos un video al problema"),
                        ),
                        if (filePath.isEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: spacing[9]),
                            child: BorderWrapperComponent(
                              child: Center(
                                child: CameraComponent(
                                  onFile: (file) {
                                    setState(() {
                                      filePath = file.path;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        if (filePath.isNotEmpty)
                          Padding(
                            padding: EdgeInsets.only(top: spacing[9]),
                            child: BorderWrapperComponent(
                              child: Stack(
                                children: [
                                  VideoComponent(
                                    aspectRatio: 1 / 1,
                                    url: filePath,
                                    autoplay: true,
                                    loop: true,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Center(
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            filePath = '';
                                          });
                                        },
                                        icon: const Icon(
                                            Icons.restart_alt_outlined),
                                        label: const Text('Volver a Grabar'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: spacing[2]),
                child: CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: const Text('Omitir grabación de video'),
                  value: isWithoutVideo,
                  onChanged: (bool? value) {
                    setState(() {
                      isWithoutVideo = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ContentWrapperComponent(
                  child: ElevatedButton(
                    onPressed: (filePath.isEmpty && !isWithoutVideo)
                        ? null
                        : () {
                            final store = StoreProvider.of<AppState>(context);
                            String? file = isWithoutVideo ? null : filePath;
                            store.dispatch(sendRequestService(file));
                          },
                    child: const Text("ENVIAR SOLICITUD DE SERVICIO"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
