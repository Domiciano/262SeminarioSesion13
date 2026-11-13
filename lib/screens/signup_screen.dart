import 'package:flutter/material.dart';
import 'package:track_app/components/signup_form.dart';

/// Screen to create an account and its profile.
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  Future<void> _signup(String name, String email, String password) async {
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Crear cuenta')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SignupForm(
                onSignup: (name, email, password) =>
                    _signup(name, email, password),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
