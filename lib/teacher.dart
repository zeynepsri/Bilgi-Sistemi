import 'package:flutter/material.dart';
import 'notgirisi.dart';

class TeacherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğretmen Bilgi Sistemi'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Öğretmenin adı ve numarası
            Text(
              'Öğretmen Adı: IMU HOCA ORNEK',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Öğretmen Numarası: 123456',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20), // Boşluk eklemek için

            // Butonlar
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // 3 sütun
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2, // Buton boyutunu ayarlamak için
                children: [
                  _buildButton(context, 'Dersler'),
                  _buildButton(context, 'Not Girişi'),
                  _buildButton(context, 'Takvim'),
                  _buildButton(context, 'Belge Talebi'),
                  _buildButton(context, 'Ders Programı'),
                  _buildButton(context, 'Özgeçmiş'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title) {
    return ElevatedButton(
      onPressed: () {
        // Butona tıklandığında yapılacak işlemler
        if (title == 'Not Girişi') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NotGirmePage()), // Doğru sayfa adını kontrol edin
          );
        }
        else if (title == 'Dersler') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DerslerPage()), // Doğru sayfa adını kontrol edin
          );
        }
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.teal, // Buton üzerindeki yazı rengi
      ),
      child: Text(title),
    );
  }
}

//Dersler butonuna tıklandığında DerslerPage'ine gidecek. Bu sayfada öğretmenin verdiği dersler gözüküyor.
class DerslerPage extends StatelessWidget {
  final List<String> dersler = [
    "BIL 303 - Bilgisayar Mimarisi",
    "BIL 365 - Mobil Programlama",
    "BIL 301 - Sistem Programlama",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dersler'),
        backgroundColor: Colors.teal,  // AppBar rengini teal olarak ayarladık.
      ),
      body: ListView.builder(
        itemCount: dersler.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),  // Dersleri içeriye doğru itmek için padding ekledik.
            child: ListTile(
              title: Text(dersler[index]),
            ),
          );
        },
      ),
    );
  }
}


