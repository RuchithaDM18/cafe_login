import 'package:flutter/material.dart';
import 'login.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool isButtonEnabled = false;

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one digit';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forgot Password',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/snack.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Card(
              color: Colors.white.withOpacity(0.4),
              elevation: 8.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 40),
                    TextField(
                      controller: _newPasswordController,
                      decoration: InputDecoration(
                        labelText: 'New Password',
                        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        errorText: _validatePassword(_newPasswordController.text),
                      ),
                      obscureText: true,
                      onChanged: (_) => checkPasswordMatch(),
                    ),
                    TextField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        errorText: _validatePassword(_confirmPasswordController.text),
                      ),
                      obscureText: true,
                      onChanged: (_) => checkPasswordMatch(),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: isButtonEnabled
                          ? () {
                        if (_newPasswordController.text == _confirmPasswordController.text) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => LoginForm(),
                            ),
                          );
                        }
                      }
                          : null,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void checkPasswordMatch() {
    setState(() {
      if (_newPasswordController.text.length >= 4 &&
          _confirmPasswordController.text.length >= 4 &&
          _validatePassword(_newPasswordController.text) == null &&
          _validatePassword(_confirmPasswordController.text) == null) {
        isButtonEnabled = _newPasswordController.text == _confirmPasswordController.text;
      } else {
        isButtonEnabled = false;
      }
    });
  }
}
