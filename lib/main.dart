import 'package:flutter/material.dart';
import 'login.dart'; //login.dart dosyasini dahil ettik

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Bilgi Sistemi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Acilis sayfasi olarak atadik
    );
  }
}
