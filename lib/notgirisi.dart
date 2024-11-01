import 'package:flutter/material.dart';

class NotGirmePage extends StatefulWidget {
  @override
  _NotGirmePageState createState() => _NotGirmePageState();
}

class _NotGirmePageState extends State<NotGirmePage> {
  final List<String> dersler = [
    "BIL 303 - Bilgisayar Mimarisi",
    "BIL 365 - Mobil Programlama",
    "BIL 301 - Sistem Programlama",
  ];
 /* Derse göre dersi alan öğrenci listeleri */
  final List<String> ogrencilerBM = [
    "Ali",
    "Ayşe",
    "Fatma",
    "Mehmet",
    "Zeynep",
    "Ahmet",
    "Elif",
    "Can",
    "Emre",
    "Derya",
  ];

  final List<String> ogrencilerMP = [
    "Sude",
    "Yaren",
    "Ali",
    "Mehmet",
    "Zeynep",
    "Ahmet",
    "Elif",
    "Can",
    "Emre",
    "Derya",
  ];

  final List<String> ogrencilerSP = [
    "Begüm",
    "Hilal",
    "Ali",
    "Mehmet",
    "Zeynep",
    "Fatma",
    "Elif",
    "Can",
    "Emre",
    "Derya",
  ];

  String? selectedDers;
  Map<String, Map<String, Map<String, double>>> notlar = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Girişi'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ders Seçin:',
              style: TextStyle(fontSize: 18),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: selectedDers,
              hint: Text('Ders Seçin'),
              items: dersler.map((String ders) {
                return DropdownMenuItem<String>(
                  value: ders,
                  child: Text(ders),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedDers = newValue;
                  if (selectedDers != null && !notlar.containsKey(selectedDers)) {
                    notlar[selectedDers!] = {};
                  }
                });
              },
            ),
            SizedBox(height: 20),
            /* Seçilen ders'e göre o dersle ilgili bilgilere ulaşılıyor. */
            if (selectedDers ==  'BIL 303 - Bilgisayar Mimarisi') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Öğrenci', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Vize', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Ödev', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Final', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: ogrencilerBM.length,
                  itemBuilder: (context, index) {
                    String ogrenci = ogrencilerBM[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(ogrenci),
                            _buildNotInputField(ogrenci, '  '),
                            _buildNotInputField(ogrenci, '  '),
                            _buildNotInputField(ogrenci, '  '),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _saveNotlar,
                child: Text('Kaydet'),
              ),
            ],

            if (selectedDers == 'BIL 365 - Mobil Programlama') ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Öğrenci', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Vize', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Ödev', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Final', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: ogrencilerMP.length,
                  itemBuilder: (context, index) {
                    String ogrenci = ogrencilerMP[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(ogrenci),
                            _buildNotInputField(ogrenci, '  '),
                            _buildNotInputField(ogrenci, '  '),
                            _buildNotInputField(ogrenci, '  '),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _saveNotlar,
                child: Text('Kaydet'),
              ),
            ],
            if (selectedDers == 'BIL 301 - Sistem Programlama' ) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Öğrenci', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Vize', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Ödev', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text('Final', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: ogrencilerSP.length,
                  itemBuilder: (context, index) {
                    String ogrenci = ogrencilerSP[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(ogrenci),
                            _buildNotInputField(ogrenci, '  '),
                            _buildNotInputField(ogrenci, '  '),
                            _buildNotInputField(ogrenci, '  '),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: _saveNotlar,
                child: Text('Kaydet'),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNotInputField(String ogrenci, String notTuru) {
    double? mevcutNot = notlar[selectedDers]?[ogrenci]?[notTuru];
    return SizedBox(
      width: 60,
      child: TextField(
        decoration: InputDecoration(
          labelText: notTuru,
          border: OutlineInputBorder(),
        ),
        controller: TextEditingController(
          text: mevcutNot != null ? mevcutNot.toString() : '',
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.isNotEmpty) {
            notlar[selectedDers!] ??= {};
            notlar[selectedDers!]![ogrenci] ??= {};
            notlar[selectedDers!]![ogrenci]![notTuru] = double.tryParse(value) ?? 0;
          }
        },
      ),
    );
  }

  void _saveNotlar() {
    print('Notlar Kaydedildi: $notlar');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Notlar başarıyla kaydedildi!'),
      ),
    );
  }
}

