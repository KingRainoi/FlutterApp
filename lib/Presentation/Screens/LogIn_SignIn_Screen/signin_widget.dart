import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
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
        title: const Text("Register"),
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
                  // TextButton(
                  //   onPressed: () async {
                  //     final email = _email.text;
                  //     final password = _password.text;
                  //     try {
                  //       // ignore: unused_local_variable
                  //       final userCredential = await FirebaseAuth.instance
                  //           .createUserWithEmailAndPassword(
                  //               email: email, password: password);
                  //     } on FirebaseAuthException catch (e) {
                  //       if (e.code == 'weak-password') {
                  //       } else if (e.code == 'email-already-in-use') {
                  //       } else if (e.code == 'invalid-emial') {}
                  //     }
                  //   },
                  //   child: const Text("Register"),
                  // ),
                  ElevatedButton(
                    onPressed: () async {
                      final email = _email.text;
                      final password = _password.text;
                      try {
                        final userCredential = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);
                        print(userCredential);

                        // Verifica si el inicio de sesión fue exitoso
                        if (userCredential.user != null) {
                          // Navega a la ruta '/home' si el inicio de sesión fue exitoso
                          Navigator.of(context).pushNamed('/home');
                        }
                      } on FirebaseAuthException catch (e) {
                        print(e.code);
                      }
                    },
                    child: const Text("Login"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                          context); // Esto cerrará la vista actual y volverá a la vista anterior (LoginView).
                    },
                    child: const Text('Volver a Login'),
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
