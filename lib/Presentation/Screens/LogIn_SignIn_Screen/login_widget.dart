import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../../../firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _email.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login"),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return (Column(
                children: [
                  TextField(
                    controller: _email,
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(hintText: 'Enter your email'),
                  ),
                  TextField(
                    controller: _password,
                    //Tres propiedas que deben estar en un input de contraseña
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    //
                    decoration:
                        const InputDecoration(hintText: 'Enter your password'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final email = _email.text;
                      final password = _password.text;
                      final currentContext =
                          context; // Captura el BuildContext de manera sincrónica
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password)
                          .then((userCredential) {
                        print(userCredential);

                        // Verifica si el inicio de sesión fue exitoso
                        if (userCredential.user != null) {
                          // Navega a la ruta '/home' si el inicio de sesión fue exitoso
                          Navigator.of(currentContext).pushNamed('/home');
                        }
                      }).catchError((e) {
                        if (e is FirebaseAuthException) {
                          print(e.code);
                        }
                      });
                    },
                    child: const Text("Login"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                    child: const Text('Registrarse'),
                  )
                ],
              ));
            default:
              return const Text('Loading...');
          }
        },
      ),
    );
  }
}
