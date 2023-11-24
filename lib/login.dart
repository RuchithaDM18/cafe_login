import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafe Registration',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RegistrationForm(),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/cfe.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Center(
              child: FractionallySizedBox(
                heightFactor: 0.5,
                widthFactor: 0.9,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Login',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Password',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8),
                              Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: TextFormField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter a password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16),
                          InkWell(
                            onTap: () {

                            },
                            child: Text(
                              "New user? Create account",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.blue, fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Checkbox(
                                value: rememberMe,
                                onChanged: (value) {
                                  setState(() {
                                    rememberMe = value ?? false;
                                  });
                                },
                              ),
                              Text('Remember me'),
                            ],
                          ),
                          SizedBox(height: 16),
                          Container(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  // Form is valid, handle login
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
                                shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                              ),
                              child: Text('Next'),
                            ),
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
