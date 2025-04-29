import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: loginpage());
  }
}

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool _obscurePassword = true;
  bool _loginstate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 96, 160, 212),
            ),
            width: double.infinity,
            height: 300,
            child: Center(
              child: Text("Login Form", style: TextStyle(fontSize: 100)),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(100, 50, 100, 10),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextFormField(
                    controller: email,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter here";
                      }
                      if (!value.contains("@")) {
                        return "Email should contain @";
                      }
                      if (!value.contains("gmail.com")) {
                        return "Email should contain gmail.com";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Email"),
                      hintText: "bot@gmail.com",
                      suffixIcon: Icon(Icons.email),
                    ),
                  ),
                  SizedBox(height: 20),

                  TextFormField(
                    controller: pass,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter the password";
                      }
                      if (value.length < 8) {
                        return "Passwor should be above 6 letters";
                      }
                      if (value.contains(".")) {
                        return ". is not allowed";
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return "Password must contain at least one uppercase letter";
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return "Password must contain at least one number";
                      }
                      if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return "Password must contain at least one special character";
                      }
                      return null;
                    },
                    obscureText: _obscurePassword,

                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Password"),
                      hintText: "Enter your password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          _loginstate = true;
                        });
                        email.clear();
                        pass.clear();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Succesfully")),
                        );
                      }
                    },
                    child: Text("Login"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
