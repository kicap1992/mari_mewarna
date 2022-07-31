// import 'dart:developer';
// import 'dart:io';
// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mewarna/widgets/ourContainer.dart';
// import 'package:path_provider/path_provider.dart';

class Tentang1 extends StatefulWidget {
  const Tentang1({Key? key}) : super(key: key);

  @override
  State<Tentang1> createState() => _Tentang1State();
}

class _Tentang1State extends State<Tentang1> {
  // Uint8List? _bytes;

  // ignore: non_constant_identifier_names
  // Future cek_image() async {
  //   final appStorage = await getApplicationDocumentsDirectory();
  //   log(Directory(appStorage.path).listSync().toString());
  //   final file = File(
  //       '${appStorage.path}/gajah51b2b453-5f5a-404f-89ab-2dcc46757319.png');
  //   if (file.existsSync()) {
  //     log("ada");
  //     Uint8List bytes = await file.readAsBytes();
  //     setState(() {
  //       _bytes = bytes;
  //     });
  //   } else {
  //     log("tidak ada");
  //   }
  // }

  @override
  void initState() {
    super.initState();
    // cek_image();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang'),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/bg.png",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.2),
            colorBlendMode: BlendMode.darken,
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: OurContainer(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // _bytes != null
                      //     ? Image.memory(
                      //         _bytes!,
                      //         fit: BoxFit.fill,
                      //         width: 100,
                      //         height: 100,
                      //       )
                      //     : Container(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.26,
                            child: const Text(
                              'Nama',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: const Text(" : "),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const Text(
                                'DEWI REZKY RAMDHANI T',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.26,
                            child: const Text(
                              'NIM',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: const Text(" : "),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const Text(
                                '217 280 140',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.26,
                            child: const Text(
                              'Pembimbing 1',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: const Text(" : "),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const Text(
                                'Ade Hastuty, ST., S. Kom., MT.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.26,
                            child: const Text(
                              'Pembimbing 2',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: const Text(" : "),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const Text(
                                'Andi Wafiah, S. Kom., M. Kom.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.26,
                            child: const Text(
                              'Judul',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05,
                            child: const Text(" : "),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: const Text(
                                'APLIKASI PENERAPAN PEMBELAJARAN INTERAKTIF BUKU MEWARNAI BERBASIS ANDROID',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
