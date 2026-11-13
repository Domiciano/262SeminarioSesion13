import 'package:flutter/material.dart';

/// Form that keeps the sign up draft and reports it with onSignup.
class SignupForm extends StatefulWidget {
  final Function(String name, String email, String password) onSignup;

  const SignupForm({super.key, required this.onSignup});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  String _warning = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      setState(() {
        _warning = 'Llena todos los campos';
      });
      return;
    }
    if (password.length < 6) {
      setState(() {
        _warning = 'La contraseña debe tener al menos 6 caracteres';
      });
      return;
    }
    if (password != _confirmController.text) {
      setState(() {
        _warning = 'Las contraseñas no coinciden';
      });
      return;
    }
    setState(() {
      _warning = '';
    });
    widget.onSignup(name, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            labelText: 'Nombre',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
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
        const SizedBox(height: 16),
        TextField(
          controller: _confirmController,
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Repite la contraseña',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        Text(_warning, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: () => _submit(),
          child: const Text('Crear cuenta'),
        ),
      ],
    );
  }
}
