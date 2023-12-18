// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:seven/app/router/app_router.dart' as _i1;
import 'package:seven/dictionary/presentation/dictionary_page.dart' as _i2;
import 'package:seven/home/root_page.dart' as _i4;
import 'package:seven/login/presentation/login_page.dart' as _i3;
import 'package:seven/rules/presentation/pages/details/rule_details_page.dart'
    as _i5;
import 'package:seven/rules/presentation/pages/list/rules_list_page.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AuthEmptyRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthEmptyPage(),
      );
    },
    DictionaryRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.DictionaryPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    NonAuthEmptyRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.NonAuthEmptyPage(),
      );
    },
    RootRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.RootPage(),
      );
    },
    RuleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RuleDetailsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.RuleDetailsPage(
          title: args.title,
          key: args.key,
        ),
      );
    },
    RulesListRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RulesListPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthEmptyPage]
class AuthEmptyRoute extends _i7.PageRouteInfo<void> {
  const AuthEmptyRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthEmptyRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DictionaryPage]
class DictionaryRoute extends _i7.PageRouteInfo<void> {
  const DictionaryRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DictionaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DictionaryRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i1.NonAuthEmptyPage]
class NonAuthEmptyRoute extends _i7.PageRouteInfo<void> {
  const NonAuthEmptyRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NonAuthEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'NonAuthEmptyRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.RootPage]
class RootRoute extends _i7.PageRouteInfo<void> {
  const RootRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RuleDetailsPage]
class RuleDetailsRoute extends _i7.PageRouteInfo<RuleDetailsRouteArgs> {
  RuleDetailsRoute({
    required String title,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          RuleDetailsRoute.name,
          args: RuleDetailsRouteArgs(
            title: title,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RuleDetailsRoute';

  static const _i7.PageInfo<RuleDetailsRouteArgs> page =
      _i7.PageInfo<RuleDetailsRouteArgs>(name);
}

class RuleDetailsRouteArgs {
  const RuleDetailsRouteArgs({
    required this.title,
    this.key,
  });

  final String title;

  final _i8.Key? key;

  @override
  String toString() {
    return 'RuleDetailsRouteArgs{title: $title, key: $key}';
  }
}

/// generated route for
/// [_i6.RulesListPage]
class RulesListRoute extends _i7.PageRouteInfo<void> {
  const RulesListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RulesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'RulesListRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
