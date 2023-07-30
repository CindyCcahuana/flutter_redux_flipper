import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/image_description.component.dart';
import 'package:mnsolutions/src/common/components/text_input.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/common/models/service_model.dart';
import 'package:mnsolutions/src/common/models/service_request_model.dart';
import 'package:mnsolutions/src/features/checkout/screens/payment/payment_screen.dart';
import 'package:mnsolutions/src/features/core/components/carousel.component.dart';
import 'package:mnsolutions/src/features/core/components/dropdown_addresses.component.dart';
import 'package:mnsolutions/src/features/request/redux/service_action.dart';
import 'package:mnsolutions/src/features/request/screens/describe/describe_screen.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

import '../../redux/core_state.dart';

class HomeScreen extends StatefulWidget {
  static const String route = '/core/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String filter = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          FractionallySizedBoxComponent(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: spacing[2]),
                  child: TextInputComponent(
                    labelText: 'Buscar',
                    onChanged: (String string) {
                      setState(() {
                        filter = string;
                      });
                    },
                    padding: spacing[2],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: spacing[2],
                    bottom: spacing[2],
                  ),
                  child: const DropdownAddressesComponent(),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Column(children: [
                  Padding(
                    padding: EdgeInsets.only(top: spacing[2]),
                    child: const CarouselComponent(),
                  ),
                  FractionallySizedBoxComponent(
                    child: Padding(
                      padding: EdgeInsets.only(top: spacing[2]),
                      child: StoreConnector<AppState, CoreState>(
                        converter: (Store<AppState> store) => store.state.core!,
                        builder: (BuildContext context, CoreState coreState) {
                          if (coreState.servicesLoading == true) {
                            return Container();
                          }
                          if (coreState.servicesError == true) {
                            return const Text('error getting services');
                          }
                          if (coreState.services?.isNotEmpty == true) {
                            List<ServiceModel>? services = coreState.services
                                ?.where((ServiceModel serviceModel) {
                              return filter.isNotEmpty &&
                                      serviceModel.title!
                                          .toLowerCase()
                                          .contains(filter.toLowerCase()) ||
                                  serviceModel.description!
                                      .toLowerCase()
                                      .contains(filter.toLowerCase());
                            }).toList();
                            return GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: services?.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: spacing[2],
                                mainAxisSpacing: spacing[2],
                                childAspectRatio: 18 / 25,
                              ),
                              itemBuilder: (context, index) {
                                ServiceModel serviceModel = services![index];
                                return ImageDescriptionComponent(
                                  image: serviceModel.image!,
                                  title: serviceModel.title!,
                                  description: serviceModel.description!,
                                  onTap: () {
                                    final store =
                                        StoreProvider.of<AppState>(context);
                                    store.dispatch(
                                      requestServiceFormAction(
                                          ServiceRequestModel(
                                        service: serviceModel,
                                        address:
                                            store.state.session!.user!.address,
                                      )),
                                    );
                                    if (store.state.session?.user
                                            ?.numberSuscription?.isNotEmpty ==
                                        true) {
                                      Navigator.of(context)
                                          .pushNamed(DescribeScreen.route);
                                    } else {
                                      Navigator.of(context)
                                          .pushNamed(PaymentScreen.route);
                                    }
                                  },
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
