import 'package:flutter/material.dart';
import 'package:tamagotchi_app/firebase_auth_service.dart';

class AuthPage extends StatefulWidget {
  final FirebaseAuthService authService;

  const AuthPage({Key? key, required this.authService}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

enum AuthMode { signUp, signIn }

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthMode _authMode = AuthMode.signIn;
  String _email = '';
  String _password = '';

  void _toggleAuthMode() {
    setState(() {
      _authMode =
          _authMode == AuthMode.signIn ? AuthMode.signUp : AuthMode.signIn;
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        if (_authMode == AuthMode.signIn) {
          await widget.authService.signIn(email: _email, password: _password);
        } else {
          await widget.authService.signUp(email: _email, password: _password);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Page'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) =>
                    value!.isEmpty ? 'Email is required' : null,
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) => value!.length < 6
                    ? 'Password must be at least 6 characters'
                    : null,
                onSaved: (value) => _password = value!,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _submitForm,
                child:
                    Text(_authMode == AuthMode.signIn ? 'Sign In' : 'Sign Up'),
              ),
              TextButton(
                onPressed: _toggleAuthMode,
                child: Text(_authMode == AuthMode.signIn
                    ? 'Create an account'
                    : 'Already have an account? Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
