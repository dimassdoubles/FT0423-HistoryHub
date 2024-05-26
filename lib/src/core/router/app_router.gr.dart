// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:history_hub/src/features/create_event/presentation/new_event_screen.dart'
    as _i5;
import 'package:history_hub/src/features/forgot_password/presentation/forgot_password_screen.dart'
    as _i2;
import 'package:history_hub/src/features/login/presentation/login_screen.dart'
    as _i3;
import 'package:history_hub/src/features/navigation/presentation/navigation_screen.dart'
    as _i4;
import 'package:history_hub/src/features/post/presentation/create_post_screen.dart'
    as _i1;
import 'package:history_hub/src/features/register/presentation/register_screen.dart'
    as _i6;
import 'package:history_hub/src/features/register/presentation/select_address_screen.dart'
    as _i7;
import 'package:history_hub/src/features/starter/presentation/splash_screen.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    CreatePostRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CreatePostScreen(),
      );
    },
    ForgotPasswordRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ForgotPasswordScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    NavigationRoute.name: (routeData) {
      final args = routeData.argsAs<NavigationRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.NavigationScreen(
          key: args.key,
          body: args.body,
        ),
      );
    },
    NewEventRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewEventScreen(),
      );
    },
    RegisterRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.RegisterScreen(),
      );
    },
    SelectAddressRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SelectAddressScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.CreatePostScreen]
class CreatePostRoute extends _i9.PageRouteInfo<void> {
  const CreatePostRoute({List<_i9.PageRouteInfo>? children})
      : super(
          CreatePostRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePostRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ForgotPasswordScreen]
class ForgotPasswordRoute extends _i9.PageRouteInfo<void> {
  const ForgotPasswordRoute({List<_i9.PageRouteInfo>? children})
      : super(
          ForgotPasswordRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i9.PageRouteInfo<void> {
  const LoginRoute({List<_i9.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NavigationScreen]
class NavigationRoute extends _i9.PageRouteInfo<NavigationRouteArgs> {
  NavigationRoute({
    _i10.Key? key,
    required _i10.Widget? body,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          NavigationRoute.name,
          args: NavigationRouteArgs(
            key: key,
            body: body,
          ),
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';

  static const _i9.PageInfo<NavigationRouteArgs> page =
      _i9.PageInfo<NavigationRouteArgs>(name);
}

class NavigationRouteArgs {
  const NavigationRouteArgs({
    this.key,
    required this.body,
  });

  final _i10.Key? key;

  final _i10.Widget? body;

  @override
  String toString() {
    return 'NavigationRouteArgs{key: $key, body: $body}';
  }
}

/// generated route for
/// [_i5.NewEventScreen]
class NewEventRoute extends _i9.PageRouteInfo<void> {
  const NewEventRoute({List<_i9.PageRouteInfo>? children})
      : super(
          NewEventRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewEventRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.RegisterScreen]
class RegisterRoute extends _i9.PageRouteInfo<void> {
  const RegisterRoute({List<_i9.PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SelectAddressScreen]
class SelectAddressRoute extends _i9.PageRouteInfo<void> {
  const SelectAddressRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SelectAddressRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectAddressRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SplashScreen]
class SplashRoute extends _i9.PageRouteInfo<void> {
  const SplashRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
