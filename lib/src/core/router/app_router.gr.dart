// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:history_hub/src/features/forgot_password/presentation/forgot_password_screen.dart'
    as _i2;
import 'package:history_hub/src/features/home/presentation/home_screen.dart'
    as _i3;
import 'package:history_hub/src/features/login/presentation/login_screen.dart'
    as _i4;
import 'package:history_hub/src/features/navigation/presentation/navigation_screen.dart'
    as _i5;
import 'package:history_hub/src/features/photo_editor/presentation/photo_editor_screen.dart'
    as _i6;
import 'package:history_hub/src/features/post/presentation/create_post_screen.dart'
    as _i1;
import 'package:history_hub/src/features/register/presentation/register_screen.dart'
    as _i7;
import 'package:history_hub/src/features/register/presentation/select_address_screen.dart'
    as _i8;
import 'package:history_hub/src/features/starter/presentation/splash_screen.dart'
    as _i9;
import 'package:history_hub/src/features/transaction/presentation/transaction_screen.dart'
    as _i10;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    CreatePostRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreatePostScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginScreen(),
      );
    },
    NavigationRoute.name: (routeData) {
      final args = routeData.argsAs<NavigationRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.NavigationScreen(
          key: args.key,
          body: args.body,
        ),
      );
    },
    PhotoEditorRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.PhotoEditorScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.RegisterScreen(),
      );
    },
    SelectAddressRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SelectAddressScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashScreen(),
      );
    },
    TransactionRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TransactionScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CreatePostScreen]
class CreatePostRoute extends _i11.PageRouteInfo<void> {
  const CreatePostRoute({List<_i11.PageRouteInfo>? children})
      : super(
          CreatePostRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePostRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i11.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i11.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.NavigationScreen]
class NavigationRoute extends _i11.PageRouteInfo<NavigationRouteArgs> {
  NavigationRoute({
    _i12.Key? key,
    required _i12.Widget? body,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          NavigationRoute.name,
          args: NavigationRouteArgs(
            key: key,
            body: body,
          ),
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i11.PageInfo<NavigationRouteArgs> page =
      _i11.PageInfo<NavigationRouteArgs>(name);
}

class NavigationRouteArgs {
  const NavigationRouteArgs({
    this.key,
    required this.body,
  });

  final _i12.Key? key;

  final _i12.Widget? body;

  @override
  String toString() {
    return 'NavigationRouteArgs{key: $key, body: $body}';
  }
}

/// generated route for
/// [_i6.PhotoEditorScreen]
class PhotoEditorRoute extends _i11.PageRouteInfo<void> {
  const PhotoEditorRoute({List<_i11.PageRouteInfo>? children})
      : super(
          PhotoEditorRoute.name,
          initialChildren: children,
        );

  static const String name = 'PhotoEditorRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SelectAddressScreen]
class SelectAddressRoute extends _i11.PageRouteInfo<void> {
  const SelectAddressRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SelectAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectAddressRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TransactionScreen]
class TransactionRoute extends _i11.PageRouteInfo<void> {
  const TransactionRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TransactionRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
