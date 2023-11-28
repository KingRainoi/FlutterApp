import 'package:charlyn_mobile/Business_Logic/Landing_Page/landing_page_bloc.dart';
import 'package:charlyn_mobile/Presentation/Screens/Landing_Page_Screen/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Screens/LogIn_SignIn_Screen/login_widget.dart';
import '../Screens/LogIn_SignIn_Screen/signin_widget.dart';
import '../Screens/Dashboard.dart';

class RouteGenerator {
  final LandingPageBloc landingPageBloc = LandingPageBloc();

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/register':
        return MaterialPageRoute(
          builder: (_) => const RegisterView(),
        );

      case '/home':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LandingPageBloc>.value(
            value: landingPageBloc,
            child:
                LandingPage(), // Aquí usas LandingPage como la pantalla principal.
          ),
        );

      case '/login':
        return MaterialPageRoute(
          builder: (_) =>
              const LoginView(), // Aquí usas LoginView como la pantalla de inicio de sesión.
        );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
