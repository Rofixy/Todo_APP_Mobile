import 'package:cafe_api/page/welcome.dart';
import 'package:cafe_api/provider/auth_provider.dart';
import 'package:cafe_api/provider/task_provider.dart'; // Import TaskProvider
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Aktifkan Device Preview
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => LoginProvider()), // Tambahkan LoginProvider
          ChangeNotifierProvider(
              create: (_) => TaskProvider()), // Tambahkan TaskProvider
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager', // Judul aplikasi
      locale: DevicePreview.locale(context), // Mendukung multi-locale
      builder: DevicePreview.appBuilder, // Tambahkan DevicePreview builder
      theme: ThemeData(
        primarySwatch: Colors.blue, // Tema utama
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(), // Tambahkan tema gelap
      home: const WelcomePage(), // Halaman awal
    );
  }
}

class UpcomingPage extends StatelessWidget {
  const UpcomingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Tasks'),
      ),
      body: Center(
        child: Text(
          'Upcoming Tasks: ${taskProvider.tasks.length}', // Contoh tampilan data
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
