import 'package:cherrypick/cherrypick.dart';

class SettingsDiModule extends Module {
  final bool isMock;
  final String baseUrl;
  final Duration connectionTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;

  SettingsDiModule({
    required this.isMock,
    required this.baseUrl,
    required this.connectionTimeout,
    required this.receiveTimeout,
    required this.sendTimeout,
  });

  @override
  void builder(Scope currentScope) {
    bind<bool>().toInstance(isMock).withName('isMock');

    bind<String>().withName('baseUrl').toInstance(baseUrl);

    bind<Duration>()
        .withName('connectionTimeout')
        .toInstance(connectionTimeout);

    bind<Duration>().withName('receiveTimeout').toInstance(receiveTimeout);

    bind<Duration>().withName('sendTimeout').toInstance(sendTimeout);
  }
}
