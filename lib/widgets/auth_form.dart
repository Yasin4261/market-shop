import 'package:flutter/material.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../views/home_page.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthViewModel _authViewModel = AuthViewModel();
  String _errorMessage = '';
  Color _errorColor = Colors.transparent; // Başlangıçta hata rengi boş olacak

  Future<void> _register() async {
    try {
      await _authViewModel.register(
        _emailController.text,
        _passwordController.text,
      );
      setState(() {
        _errorMessage = 'Registration successful';
        _errorColor = Colors.green;
      });
      _navigateToHome();
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _errorColor = Colors.red;
      });
    }
  }

  Future<void> _login() async {
    try {
      await _authViewModel.login(
        _emailController.text,
        _passwordController.text,
      );
      setState(() {
        _errorMessage = 'Login successful';
        _errorColor = Colors.green;
      });
      _navigateToHome();
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
        _errorColor = Colors.red;
      });
    }
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.blue, // istediğiniz renk
                  width: 2.0, // istediğiniz kalınlık
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Colors.blue, // istediğiniz renk
                  width: 2.0, // istediğiniz kalınlık
                ),
              ),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _register,
                child: const Text('Register'),
              ),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Login'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            _errorMessage,
            style: TextStyle(color: _errorColor),
          ),
        ],
      ),
    );
  }
}
