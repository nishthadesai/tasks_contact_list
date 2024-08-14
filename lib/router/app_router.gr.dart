// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AddContactRoute.name: (routeData) {
      final args = routeData.argsAs<AddContactRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: AddContactPage(
          contactData: args.contactData,
          id: args.id,
        ),
      );
    },
    ContactListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ContactListPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [AddContactPage]
class AddContactRoute extends PageRouteInfo<AddContactRouteArgs> {
  AddContactRoute({
    Key? key,
    required ContactData? contactData,
    int? id,
    List<PageRouteInfo>? children,
  }) : super(
          AddContactRoute.name,
          args: AddContactRouteArgs(
            key: key,
            contactData: contactData,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'AddContactRoute';

  static const PageInfo<AddContactRouteArgs> page =
      PageInfo<AddContactRouteArgs>(name);
}

class AddContactRouteArgs {
  const AddContactRouteArgs({
    this.key,
    required this.contactData,
    this.id,
  });

  final Key? key;

  final ContactData? contactData;

  final int? id;

  @override
  String toString() {
    return 'AddContactRouteArgs{key: $key, contactData: $contactData, id: $id}';
  }
}

/// generated route for
/// [ContactListPage]
class ContactListRoute extends PageRouteInfo<void> {
  const ContactListRoute({List<PageRouteInfo>? children})
      : super(
          ContactListRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SignUpPage]
class SignUpRoute extends PageRouteInfo<void> {
  const SignUpRoute({List<PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
