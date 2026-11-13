import 'package:flutter/material.dart';

/// Form that keeps the email and password draft and reports it with onLogin.
class LoginForm extends StatefulWidget {
  final Function(String email, String password) onLogin;

  const LoginForm({super.key, required this.onLogin});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _warning = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _warning = 'Escribe tu correo y tu contraseña';
      });
      return;
    }
    setState(() {
      _warning = '';
    });
    widget.onLogin(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            labelText: 'Correo',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Contraseña',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        Text(_warning, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 16),
        FilledButton(onPressed: () => _submit(), child: const Text('Entrar')),
      ],
    );
  }
}
