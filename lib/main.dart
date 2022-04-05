import 'package:flutter/material.dart';
import 'package:mewarna/homepage.dart';
import 'package:mewarna/pages/mewarna.dart';
import 'package:mewarna/pages/pilihKategori.dart';
import 'package:mewarna/pages/tentang.dart';

import 'pages/binatang.dart';
import 'pages/mewarna1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //add the routes
      routes: {
        '/': (context) => const HomePage(),
        '/pilih_kategori': (context) => const PilihKategori(),
        '/tentang': (context) => const Tentang(),
        '/binatang': (context) => const BinatangPage(),
        '/mewarna': (context) => const MewarnaPage(),
        '/mewarna1': (context) => const Mewarna1Page(),
      },
      initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
