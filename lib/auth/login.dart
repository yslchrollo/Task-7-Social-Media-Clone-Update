import 'package:flutter/material.dart';
import 'package:flutter_application_7/socialmedia.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late String errormessage;
  late bool isError;

  @override
  void initState() {
    errormessage = "This is an errormessage";
    isError = false;
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void checkLogin(String username, String password) {
    setState(() {
      if (username == "") {
        errormessage = "Please input your username!";
        isError = true;
      } else if (password == "") {
        errormessage = "Please input your password!";
        isError = true;
      } else if (username != "Gab" || password != "1234") {
        errormessage = "Invalid username or password!";
        isError = true;
      } else {
        errormessage = "";
        isError = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/tiktok_logo.png',
                      height: 40,
                      width: 40,
                    ),
                  ), // Image.asset
                  const SizedBox(width: 10),
                  Text('TIKTOK', style: txtstyle),
                ],
              ), // Row
              const SizedBox(height: 25),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter Username',
                  prefixIcon: const Icon(Icons.person),
                ), // InputDecoration
              ), // TextField
              const SizedBox(height: 15),
              TextField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter Password',
                  prefixIcon: const Icon(Icons.more_horiz),
                ), // InputDecoration
              ), // TextField
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: const Color(0xFF2196F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  checkLogin(usernameController.text, passwordController.text);
                  if (!isError) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Socialmedia()),
                    );
                  }
                },
                child: Text('LOGIN', style: txtstyle2),
              ), // ElevatedButton
              const SizedBox(height: 12),
              if (isError)
                Text(errormessage, style: errortxtstyle),
            ],
          ), // Column
        ), // Container
      ), // Center
    ); // Scaffold
  }
}

var txtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 3,
  fontSize: 22,
);

var registertxtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  fontSize: 14,
);

var errortxtstyle = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
  fontSize: 14,
  color: Colors.red,
);

var txtstyle2 = const TextStyle(
  fontWeight: FontWeight.bold,
  letterSpacing: 2,
  fontSize: 24,
  color: Colors.white,
);

