import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  List<Map<String, String>> tasks = [];
  TextEditingController taskController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Uygulama başlatıldığında görevleri yükle
  }

  // Görevleri shared_preferences'tan yükleme
  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksData = prefs.getString('tasks');
    if (tasksData != null) {
      setState(() {
        tasks = List<Map<String, String>>.from(json.decode(tasksData));
      });
    }
  }

  /* Görevleri shared_preferences'a kaydetme */
  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('tasks', json.encode(tasks));
  }

  // Görev eklemek için fonksiyon
  void _addTask(String task, String deadline) {
    setState(() {
      tasks.add({'task': task, 'deadline': deadline});
      taskController.clear();
      deadlineController.clear();
      _saveTasks();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Görev başarıyla eklendi!"))
      );
    });
  }

  // Görev silme işlemi
  void _deleteTask(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Görevi Sil"),
          content: Text("Bu görevi silmek istediğinizden emin misiniz?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("İptal"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  tasks.removeAt(index);
                  _saveTasks();
                });
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Görev başarıyla silindi!"))
                );
              },
              child: Text("Sil"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Görev Listesi'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(labelText: 'Görev Başlığı'),
            ),
            TextField(
              controller: deadlineController,
              decoration: InputDecoration(labelText: 'Son Tarih (yyyy-aa-gg)'),
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (taskController.text.isNotEmpty && deadlineController.text.isNotEmpty) {
                  _addTask(taskController.text, deadlineController.text);
                }
              },
              child: Text('Görev Ekle'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(tasks[index]['task']!),
                    subtitle: Text('Son Tarih: ${tasks[index]['deadline']}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      onPressed: () {
                        _deleteTask(index); // Görevi sil
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
