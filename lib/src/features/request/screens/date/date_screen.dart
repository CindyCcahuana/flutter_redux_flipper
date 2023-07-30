import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/common/models/service_request_model.dart';
import 'package:mnsolutions/src/features/request/components/dropdown_services.component.dart';
import 'package:mnsolutions/src/features/request/redux/service_action.dart';
import 'package:mnsolutions/src/features/request/screens/video/video_screen.dart';
import 'package:mnsolutions/src/redux/app_state.dart';

class DateScreen extends StatelessWidget {
  static const String route = '/request/date';

  const DateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    const List<Map<String, dynamic>> items = [
      {
        "icon": Icons.today_outlined,
        "title": 'Hoy',
        "duration": Duration(),
      },
      {
        "icon": Icons.image_outlined,
        "title": 'Ayer',
        "duration": Duration(days: 1),
      },
      {
        "icon": Icons.image_outlined,
        "title": 'Hace 3 dias',
        "duration": Duration(days: 3),
      },
      {
        "icon": Icons.image_outlined,
        "title": 'Hace mas de 1 semana',
        "duration": Duration(days: 7),
      },
    ];
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
                          Text(
                              style: Theme.of(context).textTheme.titleLarge,
                              "¿ Desde cuando ?"),
                          Padding(
                            padding: EdgeInsets.only(top: spacing[9]),
                            child: SizedBox(
                              height: 300,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: items.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var item = items[index];
                                  return ListTile(
                                    onTap: () {
                                      DateTime date = DateTime.now()
                                          .subtract(item['duration']);
                                      store.dispatch(
                                        requestServiceFormAction(
                                            ServiceRequestModel(
                                          dateIncident: date.toString(),
                                        )),
                                      );
                                      Navigator.of(context)
                                          .pushNamed(VideoSceen.route);
                                    },
                                    leading: Icon(item['icon']),
                                    title: Text(item['title']),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
