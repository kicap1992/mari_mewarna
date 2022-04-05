// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PilihKategori extends HookWidget {
  const PilihKategori({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pilih Kategori'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bg.jpg",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.2),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            // add two buttons, one named "Pilih Kategori" , the other named "Tentang"
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //make the button same width
                  SizedBox(
                    // width is half of the screen width
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      child: const Text('Binatang'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/binatang');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      child: const Text('Kendaraan'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      child: const Text('Sayur-Sayuran'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      child: const Text('Buah-Buahan'),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            // child: Text('Home Page'),
          ),
        ],
      ),
    );
  }
}
