import 'dart:io';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flipperkit/flutter_flipperkit.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:mnsolutions/firebase_options.dart';
import 'package:mnsolutions/src/common/screens/loading/loading_screen.dart';
import 'package:mnsolutions/src/common/themes/color_schemes.g.dart';
import 'package:mnsolutions/src/common/themes/custom_color.g.dart';
import 'package:mnsolutions/src/common/themes/custom_theme_data.dart';
import 'package:mnsolutions/src/features/address/screens/address/address_screen.dart';
import 'package:mnsolutions/src/features/address/screens/district/district_screen.dart';
import 'package:mnsolutions/src/features/address/screens/identity/identity_screen.dart';
import 'package:mnsolutions/src/features/address/screens/reference/reference_screen.dart';
import 'package:mnsolutions/src/features/checkout/redux/checkout.thunk.dart';
import 'package:mnsolutions/src/features/checkout/screens/payment/payment_screen.dart';
import 'package:mnsolutions/src/features/checkout/screens/success/success_screen.dart';
import 'package:mnsolutions/src/features/core/redux/core_thunk.dart';
import 'package:mnsolutions/src/features/core/screens/history/history_screen.dart';
import 'package:mnsolutions/src/features/core/screens/home/home_screen.dart';
import 'package:mnsolutions/src/features/core/screens/index.dart';
import 'package:mnsolutions/src/features/core/screens/profile/profile_screen.dart';
import 'package:mnsolutions/src/features/request/screens/date/date_screen.dart';
import 'package:mnsolutions/src/features/request/screens/describe/describe_screen.dart';
import 'package:mnsolutions/src/features/request/screens/request/request.screen.dart';
import 'package:mnsolutions/src/features/request/screens/result/result_screen.dart';
import 'package:mnsolutions/src/features/request/screens/video/video_screen.dart';
import 'package:mnsolutions/src/features/session/screens/sign_in/sign_in.screen.dart';
import 'package:mnsolutions/src/features/session/screens/sign_up/sign_up.screen.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:mnsolutions/src/redux/app_store.dart';
import 'package:redux/redux.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlipperClient flipperClient = FlipperClient.getDefault();
  flipperClient
      .addPlugin(FlipperNetworkPlugin(filter: (HttpClientRequest request) {
    String url = '${request.uri}';
    if (url.startsWith('https://via.placeholder.com') ||
        url.startsWith('https://gravatar.com')) {
      return false;
    }
    return true;
  }));
  flipperClient.addPlugin(FlipperReduxInspectorPlugin());
  flipperClient.addPlugin(FlipperSharedPreferencesPlugin());
  flipperClient.start();

  var store = await createStore();
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  const MyApp({
    super.key,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        lightScheme = lightColorScheme;
        darkScheme = darkColorScheme;

        store.dispatch(initializeCheckoutFlow());
        store.dispatch(initializeCoreFlow());

        bool isLogged = store.state.session?.user?.id != null;

        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: CustomThemeData(
            colorScheme: lightScheme,
            extensions: [lightCustomColors],
          ).get(),
          darkTheme: CustomThemeData(
            isDark: true,
            colorScheme: darkScheme,
            extensions: [darkCustomColors],
          ).get(),
          navigatorKey: NavigatorHolder.navigatorKey,
          routes: {
            LoadingScreen.route: (context) => const LoadingScreen(),
            SignInScreen.route: (context) => const SignInScreen(),
            SignUpScreen.route: (context) => const SignUpScreen(),
            CoreIndex.route: (context) => const CoreIndex(),
            HomeScreen.route: (context) => const CoreIndex(),
            HistoryScreen.route: (context) => const CoreIndex(initialIndex: 1),
            ProfileScreen.route: (context) => const CoreIndex(initialIndex: 2),
            DescribeScreen.route: (context) => const DescribeScreen(),
            DateScreen.route: (context) => const DateScreen(),
            VideoSceen.route: (context) => const VideoSceen(),
            ResultScreen.route: (context) => const ResultScreen(),
            PaymentScreen.route: (context) => const PaymentScreen(),
            SuccessScreen.route: (context) => const SuccessScreen(),
            DistrictScreen.route: (context) => const DistrictScreen(),
            AddressScreen.route: (context) => const AddressScreen(),
            ReferenceScreen.route: (context) => const ReferenceScreen(),
            IdentityScreen.route: (context) => const IdentityScreen(),
            RequestScreen.route: (context) => const RequestScreen(),
          },
          initialRoute: isLogged ? HomeScreen.route : SignInScreen.route,
        );
      }),
    );
  }
}
