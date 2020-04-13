import 'package:flutter/material.dart';
import 'auth.dart';
import 'root_page.dart';
import 'auth_provider.dart';
import 'main_screen.dart';
import 'home_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthProvider(
      auth: Auth(),
      child: MaterialApp(
        title: 'Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainScreen(),
          
        
      ),
    );
  }
}
