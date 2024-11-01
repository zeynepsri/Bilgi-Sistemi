import 'package:flutter/material.dart';

class AdvisorPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sekreter Bilgi Sistemi'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sekreter adı ve numarası
            Text(
              'Sekreter Adı: IMU SEKRETER ORNEK',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Sekreter Numarası: 123456',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 20), // Boşluk eklemek için

            // Butonlar
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 3 sütun
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 2, // Buton boyutunu ayarlamak için
                children: [
                  _buildButton(context, 'Duyuru'),
                  _buildButton(context, 'Öğrenci Ekle / Çıkar'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Buton oluşturma fonksiyonu
  Widget _buildButton(BuildContext context, String title) {
    return ElevatedButton(
       onPressed: () { /*
        // Butona tıklandığında yapılacak işlemler
        if (title == 'Dersler') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DuyuruPage()), // Doğru sayfa adını kontrol edin
          );
        } */
      },
      child: Text(title),
    );
  }
}

/* class DerslerPage extends StatelessWidget {
  final List<String> dersler = [
    "BIL 303 - Bilgisayar Mimarisi",
    "BIL 365 - Mobil Programlama",
    "BIL 301 - Sistem Programlama",
    "BIL 341 - Siyal İşleme",
    "BIL 461 - E-ticaret"
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
} */