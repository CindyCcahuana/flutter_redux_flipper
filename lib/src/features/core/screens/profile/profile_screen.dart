import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';
import 'package:mnsolutions/src/features/core/components/pay_subscription.component.dart';
import 'package:mnsolutions/src/features/core/components/user_profile.component.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = '/core/profile';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> items = [
      {
        "icon": Icons.account_circle_outlined,
        "title": 'Mis datos',
      },
      {
        "icon": Icons.home_outlined,
        "title": 'Direcciones',
      },
      {
        "icon": Icons.credit_card_outlined,
        "title": 'Tarjeta',
      },
      {
        "icon": Icons.dark_mode_outlined,
        "title": 'Tema',
      },
      {
        "icon": Icons.payments_outlined,
        "title": 'Historial de pagos',
      },
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: spacing[10]),
              child: const UserProfileComponent(),
            ),
            Padding(
              padding: EdgeInsets.only(top: spacing[2]),
              child: const PaySubscriptionComponent(),
            ),
            Padding(
              padding: EdgeInsets.only(top: spacing[10]),
              child: SizedBox(
                height: 350,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(items[index]['icon']),
                      title: Text(items[index]['title']),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.logout_outlined),
              label: const Text('CERRAR SESSION'),
            ),
          ],
        ),
      ),
    );
  }
}
