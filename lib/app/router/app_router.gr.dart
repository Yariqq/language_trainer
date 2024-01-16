// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i10;
import 'package:seven/app/router/app_router.dart' as _i1;
import 'package:seven/dictionary/domain/entity/dictionary_category.dart' as _i9;
import 'package:seven/dictionary/presentation/pages/details/dictionary_details_page.dart'
    as _i2;
import 'package:seven/dictionary/presentation/pages/dictionary_page.dart'
    as _i3;
import 'package:seven/home/root_page.dart' as _i5;
import 'package:seven/login/presentation/login_page.dart' as _i4;
import 'package:seven/rules/presentation/pages/details/rule_details_page.dart'
    as _i6;
import 'package:seven/rules/presentation/pages/list/rules_list_page.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    AuthEmptyRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthEmptyPage(),
      );
    },
    DictionaryDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DictionaryDetailsRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DictionaryDetailsPage(
          category: args.category,
          key: args.key,
        ),
      );
    },
    DictionaryRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.DictionaryPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    NonAuthEmptyRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.NonAuthEmptyPage(),
      );
    },
    RootRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.RootPage(),
      );
    },
    RuleDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<RuleDetailsRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.RuleDetailsPage(
          title: args.title,
          ruleId: args.ruleId,
          key: args.key,
        ),
      );
    },
    RulesListRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RulesListPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthEmptyPage]
class AuthEmptyRoute extends _i8.PageRouteInfo<void> {
  const AuthEmptyRoute({List<_i8.PageRouteInfo>? children})
      : super(
          AuthEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthEmptyRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DictionaryDetailsPage]
class DictionaryDetailsRoute
    extends _i8.PageRouteInfo<DictionaryDetailsRouteArgs> {
  DictionaryDetailsRoute({
    required _i9.DictionaryCategory category,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          DictionaryDetailsRoute.name,
          args: DictionaryDetailsRouteArgs(
            category: category,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DictionaryDetailsRoute';

  static const _i8.PageInfo<DictionaryDetailsRouteArgs> page =
      _i8.PageInfo<DictionaryDetailsRouteArgs>(name);
}

class DictionaryDetailsRouteArgs {
  const DictionaryDetailsRouteArgs({
    required this.category,
    this.key,
  });

  final _i9.DictionaryCategory category;

  final _i10.Key? key;

  @override
  String toString() {
    return 'DictionaryDetailsRouteArgs{category: $category, key: $key}';
  }
}

/// generated route for
/// [_i3.DictionaryPage]
class DictionaryRoute extends _i8.PageRouteInfo<void> {
  const DictionaryRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DictionaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DictionaryRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i1.NonAuthEmptyPage]
class NonAuthEmptyRoute extends _i8.PageRouteInfo<void> {
  const NonAuthEmptyRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NonAuthEmptyRoute.name,
          initialChildren: children,
        );

  static const String name = 'NonAuthEmptyRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.RootPage]
class RootRoute extends _i8.PageRouteInfo<void> {
  const RootRoute({List<_i8.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RuleDetailsPage]
class RuleDetailsRoute extends _i8.PageRouteInfo<RuleDetailsRouteArgs> {
  RuleDetailsRoute({
    required String title,
    required int ruleId,
    _i10.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          RuleDetailsRoute.name,
          args: RuleDetailsRouteArgs(
            title: title,
            ruleId: ruleId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RuleDetailsRoute';

  static const _i8.PageInfo<RuleDetailsRouteArgs> page =
      _i8.PageInfo<RuleDetailsRouteArgs>(name);
}

class RuleDetailsRouteArgs {
  const RuleDetailsRouteArgs({
    required this.title,
    required this.ruleId,
    this.key,
  });

  final String title;

  final int ruleId;

  final _i10.Key? key;

  @override
  String toString() {
    return 'RuleDetailsRouteArgs{title: $title, ruleId: $ruleId, key: $key}';
  }
}

/// generated route for
/// [_i7.RulesListPage]
class RulesListRoute extends _i8.PageRouteInfo<void> {
  const RulesListRoute({List<_i8.PageRouteInfo>? children})
      : super(
          RulesListRoute.name,
          initialChildren: children,
        );

  static const String name = 'RulesListRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
