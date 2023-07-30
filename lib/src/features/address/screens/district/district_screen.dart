import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/common/models/address_model.dart';
import 'package:mnsolutions/src/features/address/redux/addres.action.dart';
import 'package:mnsolutions/src/features/address/screens/address/address_screen.dart';
import 'package:mnsolutions/src/redux/app_state.dart';

class DistrictScreen extends StatelessWidget {
  static const String route = '/address/district';

  const DistrictScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    const List<Map<String, dynamic>> items = [
      {
        "icon": Icons.image_outlined,
        "title": 'Surco',
      },
      {
        "icon": Icons.image_outlined,
        "title": 'San Miguel',
      },
      {
        "icon": Icons.image_outlined,
        "title": 'Miraflores',
      },
      {
        "icon": Icons.image_outlined,
        "title": 'Callao',
      },
    ];
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Center(
                    child: FractionallySizedBoxComponent(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              style: Theme.of(context).textTheme.titleLarge,
                              "¿ En que distrito vives ?"),
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
                                      store.dispatch(
                                        addressFormAction(AddressModel(
                                            district: item['title'])),
                                      );
                                      Navigator.of(context)
                                          .pushNamed(AddressScreen.route);
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
