import 'package:flutter/material.dart';
import 'package:login_page/screens/splash.dart';

const SAVE_KEY_NAME = 'User logged in';
main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primaryColor: Colors.deepPurple, 
        primarySwatch: Colors.deepPurple, 
        
        scaffoldBackgroundColor:
            Colors.white, 
        cardColor: Colors.white, 
      
     
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple, 
        ),

      
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
            textStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),

        
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: ScreenSplash(),
    );
  }
}
