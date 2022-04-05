import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BinatangPage extends HookWidget {
  const BinatangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Binatang'),
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
                      child: const Text('Burung'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mewarna1',
                            arguments: {'kategori': 'hewan', 'nama': 'burung'});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      child: const Text('Kelinci'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mewarna1', arguments: {
                          'kategori': 'hewan',
                          'nama': 'kelinci'
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      child: const Text('Gajah'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mewarna1',
                            arguments: {'kategori': 'hewan', 'nama': 'gajah'});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      child: const Text('Monyet'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mewarna1',
                            arguments: {'kategori': 'hewan', 'nama': 'monyet'});
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      child: const Text('Singa'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/mewarna1',
                            arguments: {'kategori': 'hewan', 'nama': 'singa'});
                      },
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
