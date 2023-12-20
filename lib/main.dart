import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:seven/app/router/app_router.dart';
import 'package:seven/common/di/network_di_module.dart';
import 'package:seven/common/di/settings_di_module.dart';
import 'package:seven/login/presentation/di/login_di_module.dart';
import 'package:seven/rules/presentation/di/rules_di_module.dart';

void main() async {
  const isMock = false;

  const baseUrl = 'http://3.94.1.12:8000/';

  const connectionTimeout = Duration(seconds: 60);

  const receiveTimeout = Duration(seconds: 60);

  const sendTimeout = Duration(seconds: 60);

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
  );

  final router = AppRouter();

  CherryPick.openRootScope().installModules(
    [
      SettingsDiModule(
        isMock: isMock,
        baseUrl: baseUrl,
        connectionTimeout: connectionTimeout,
        receiveTimeout: receiveTimeout,
        sendTimeout: sendTimeout,
      ),
      NetworkDiModule(),
      LoginDiModule(),
      RulesDiModule(),
    ],
  );

  runApp(MyApp(router: router));
}

class MyApp extends StatelessWidget {
  final AppRouter router;

  const MyApp({required this.router, super.key});

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
        builder: (_, child) => child!,
      ),
    );
  }
}
