import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/avatar_account.component.dart';
import 'package:mnsolutions/src/common/components/border_wrapper.componet.dart';
import 'package:mnsolutions/src/common/components/dropdown_form.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/text_input.component.dart';
import 'package:mnsolutions/src/common/components/video.dart';
import 'package:mnsolutions/src/common/constants/services.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/common/models/address_model.dart';
import 'package:mnsolutions/src/common/models/service_request_model.dart';
import 'package:mnsolutions/src/common/models/user_model.dart';
import 'package:mnsolutions/src/features/checkout/components/dropdown_subscription_plans.component.dart';
import 'package:mnsolutions/src/features/request/components/dropdown_services.component.dart';
import 'package:mnsolutions/src/features/request/redux/service_action.dart';
import 'package:mnsolutions/src/features/request/redux/service_state.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:mnsolutions/src/redux/app_store.dart';
import 'package:redux/redux.dart';
import 'package:validatorless/validatorless.dart';

class RequestScreen extends StatelessWidget {
  static const String route = '/request/detail';

  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: StoreConnector<AppState, ServiceState>(
            converter: (Store<AppState> store) => store.state.service!,
            builder: (BuildContext context, ServiceState serviceState) {
              ServiceRequestModel serviceRequest =
                  serviceState.serviceRequestDetail!;
              UserModel client = serviceState.serviceRequestDetail!.user!;
              int? remainDays =
                  client.dateSuscription?.difference(DateTime.now()).inDays;
              AddressModel address = client.address!;
              return Center(
                child: FractionallySizedBoxComponent(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: spacing[10]),
                        child: AvatarAccountComponent(
                          image: '${client.avatar}',
                          fullname: '${client.name} ${client.lastName}',
                        ),
                      ),
                      if (remainDays != null)
                        Padding(
                          padding: EdgeInsets.only(top: spacing[5]),
                          child: TextButton.icon(
                            icon: const Icon(Icons.date_range_outlined),
                            onPressed: () {},
                            label: Text('$remainDays Dias restantes'),
                          ),
                        )
                      else
                        Padding(
                          padding: EdgeInsets.only(top: spacing[5]),
                          child: const ElevatedButton(
                            onPressed: null,
                            child: Text('SIN SUSCRIPCIÓN'),
                          ),
                        ),
                      if (serviceRequest.video?.isNotEmpty == true)
                        AspectRatio(
                          aspectRatio: 1 / 1,
                          child: BorderWrapperComponent(
                            child: VideoComponent(url: serviceRequest.video!),
                          ),
                        )
                      else
                        Padding(
                          padding: EdgeInsets.only(top: spacing[9]),
                          child: const Center(
                            child: Icon(Icons.videocam_off_outlined),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[5]),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Descripcion:',
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      Text(
                        serviceRequest.description!,
                        textAlign: TextAlign.justify,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[5]),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Desde:',
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      const ListTile(
                        selected: true,
                        leading: Icon(Icons.image_outlined),
                        title: Text('Hoy'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[5]),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Dirección:',
                            style: Theme.of(context).textTheme.titleLarge,
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ),
                      ListTile(
                        selected: true,
                        leading: const Icon(Icons.image_outlined),
                        title: Text(address.district!),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[5]),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            'Referencia: ${address.reference}',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[5]),
                        child: Row(children: [
                          Flexible(
                            child: TextInputComponent(
                              labelText: "Celular",
                              keyboardType: TextInputType.number,
                              onChanged: (string) {},
                              validator: Validatorless.required(
                                'Numero de celular requerido',
                              ),
                            ),
                          ),
                          IconButton(
                            iconSize: 30,
                            icon: const Icon(Icons.phone_outlined),
                            onPressed: () {
                              // ...
                            },
                          ),
                          IconButton(
                            iconSize: 30,
                            icon: const Icon(Icons.message),
                            onPressed: () {
                              // ...
                            },
                          ),
                        ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[3]),
                        child: const DropdownServicesComponent(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[3]),
                        child: DropdownFormComponent(
                          value: "PENDIENTE",
                          items: const [
                            "PENDIENTE",
                            "EVALUANDO",
                            "VISITANDO",
                            "COMPLETADO",
                            "EVALUACION CANCELADA",
                            "FALLO VISITANDO",
                            "DEVUELTO"
                          ].map((status) {
                            return DropdownMenuItem(
                              value: status,
                              child: Text(
                                status,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
