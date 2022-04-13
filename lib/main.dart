import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:mewarna/homepage.dart';
// import 'package:mewarna/pages/mewarna.dart';
import 'package:mewarna/pages/pilihKategori.dart';
// import 'package:mewarna/pages/tentang.dart';
import 'package:mewarna/pages/tentang1.dart';

import 'model/model_data.dart';
import 'pages/kategori.dart';
import 'pages/mewarna1.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(ModelAdapter());
  await Hive.openBox<Model>('model');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      //add the routes
      routes: {
        '/': (context) => const HomePage(),
        '/pilih_kategori': (context) => const PilihKategori(),
        // '/tentang': (context) => const Tentang(),
        '/tentang': (context) => const Tentang1(),
        '/kategori': (context) => const KategoriPage(),
        // '/mewarna': (context) => const MewarnaPage(),
        '/mewarna1': (context) => const Mewarna1Page(),
      },
      initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
    );
  }
}
