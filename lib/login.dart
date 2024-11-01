import 'package:flutter/material.dart';
import 'teacher.dart'; 
import 'student.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal, //Arkaplan rengi
      appBar: AppBar(
        title: Text('OBS'), //AppBar ile ilgili görsel ayarlamalar
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      // Sayfada yer alan kullanıcı adı, şifre kutularının görsel ayarlamaları
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 250, 
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Kullanıcı Adı',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  width: 250, 
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Şifre',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 24.0),
                Container(
                  width: 250, 
                  child: ElevatedButton(
                    onPressed: () {
                    String username = _usernameController.text;
                     //Giriş Yap butonuna tıklandığında Kullanıcı Adı'nı kontrol edecek ve ona göre sayfaya yönlendirecek.

                     if (username == 'Öğrenci' || username == 'Ogrenci' || username == 'ogrenci' ) {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StudentPage()),
                        );
                    } else if (username == 'Öğretmen'|| username == 'Ogretmen' || username == 'ogretmen') {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeacherPage()),
                       );
                    } else {
                     // Kullanıcı adı geçersizse hata mesajı göster
                       ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text('Geçersiz kullanıcı adı')),
                       );
                    }
                    },

                    child: Text('Giriş Yap'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
