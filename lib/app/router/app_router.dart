import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:seven/app/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: NonAuthEmptyRoute.page,
          initial: true,
          children: [
            AutoRoute(
              path: 'login',
              page: LoginRoute.page,
              initial: true,
            ),
          ],
        ),
        AutoRoute(
          path: '/home',
          page: AuthEmptyRoute.page,
          children: [
            AutoRoute(
              path: 'root',
              page: RootRoute.page,
              initial: true,
              children: [
                AutoRoute(
                  path: 'rules',
                  page: RulesListRoute.page,
                  initial: true,
                ),
                AutoRoute(
                  path: 'dictionary',
                  page: DictionaryRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'rule_details',
              page: RuleDetailsRoute.page,
            ),
          ],
        ),
      ];
}

@RoutePage()
class AuthEmptyPage extends AutoRouter {
  const AuthEmptyPage({Key? key}) : super(key: key);
}

@RoutePage()
class NonAuthEmptyPage extends AutoRouter {
  const NonAuthEmptyPage({Key? key}) : super(key: key);
}
