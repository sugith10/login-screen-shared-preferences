import 'package:flutter/material.dart';
import 'package:login_page/main.dart';
import 'package:login_page/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _count = 2;
  Color backgroundColor = const Color.fromARGB(255, 236, 237, 236);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                        hintText: 'Username',
                        contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _password,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          )),
                          hintText: 'Password',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0)),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        }
                      },
                      child: const Text('Login'),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _count++;
            setState(() {
              if (_count % 2 == 0) {
                backgroundColor = Color.fromARGB(255, 145, 142, 141);
              } else {
                backgroundColor = Color.fromARGB(255, 160, 187, 202);
              }
            });
          },
          child: const Icon(Icons.catching_pokemon),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final usernameController = _username.text;
    final passwordController = _password.text;

    if (usernameController == passwordController) {
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx) => const ScreenHome()));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
        content: Text('Login failed. Please check your credentials.'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(20),
      ));
    }
  }
}
