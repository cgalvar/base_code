// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:base_code/features/custom_feature/presentation/pages/list_custom_feature_page.dart';
import 'package:base_code/features/custom_feature/presentation/pages/put_custom_feature_page.dart';

abstract class Routes {
  static const listCustomFeaturePage = '/';
  static const putCustomFeaturePage = '/put-custom-feature-page';
}

class Router extends RouterBase {
  //This will probably be removed in future versions
  //you should call ExtendedNavigator.ofRouter<Router>() directly
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.listCustomFeaturePage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => ListCustomFeaturePage(key: typedArgs),
          settings: settings,
        );
      case Routes.putCustomFeaturePage:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return MaterialPageRoute<dynamic>(
          builder: (_) => PutCustomFeaturePage(key: typedArgs),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Navigation helper methods extension
//***************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushListCustomFeaturePage({
    Key key,
  }) =>
      pushNamed(Routes.listCustomFeaturePage, arguments: key);
  Future pushPutCustomFeaturePage({
    Key key,
  }) =>
      pushNamed(Routes.putCustomFeaturePage, arguments: key);
}
