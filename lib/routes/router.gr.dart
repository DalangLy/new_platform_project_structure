// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../features/dashboard/dashboard_export.dart' as _i3;
import '../features/home/home_export.dart' as _i2;
import '../features/language/language_export.dart' as _i4;
import '../features/login/login_export.dart' as _i1;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginPage());
    },
    HomeWrapperRoute.name: (routeData) {
      return _i5.CustomPage<dynamic>(
          routeData: routeData,
          child: const _i2.HomeWrapperPage(),
          transitionsBuilder: _i5.TransitionsBuilders.zoomIn,
          opaque: true,
          barrierDismissible: false);
    },
    DashboardWrapperRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DashboardWrapperPage());
    },
    LanguageWrapperRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LanguageWrapperPage());
    },
    LanguageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.LanguagePage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(LoginRoute.name, path: '/login'),
        _i5.RouteConfig(HomeWrapperRoute.name, path: '/', children: [
          _i5.RouteConfig(DashboardWrapperRoute.name,
              path: '', parent: HomeWrapperRoute.name),
          _i5.RouteConfig(LanguageWrapperRoute.name,
              path: 'language',
              parent: HomeWrapperRoute.name,
              children: [
                _i5.RouteConfig(LanguageRoute.name,
                    path: '', parent: LanguageWrapperRoute.name)
              ])
        ])
      ];
}

/// generated route for
/// [_i1.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i2.HomeWrapperPage]
class HomeWrapperRoute extends _i5.PageRouteInfo<void> {
  const HomeWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeWrapperRoute.name, path: '/', initialChildren: children);

  static const String name = 'HomeWrapperRoute';
}

/// generated route for
/// [_i3.DashboardWrapperPage]
class DashboardWrapperRoute extends _i5.PageRouteInfo<void> {
  const DashboardWrapperRoute() : super(DashboardWrapperRoute.name, path: '');

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i4.LanguageWrapperPage]
class LanguageWrapperRoute extends _i5.PageRouteInfo<void> {
  const LanguageWrapperRoute({List<_i5.PageRouteInfo>? children})
      : super(LanguageWrapperRoute.name,
            path: 'language', initialChildren: children);

  static const String name = 'LanguageWrapperRoute';
}

/// generated route for
/// [_i4.LanguagePage]
class LanguageRoute extends _i5.PageRouteInfo<void> {
  const LanguageRoute() : super(LanguageRoute.name, path: '');

  static const String name = 'LanguageRoute';
}
