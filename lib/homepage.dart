import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mari Mewarna'),
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
                      child: const Text('Kategori'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/pilih_kategori');
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    child: ElevatedButton(
                      child: const Text('Tentang'),
                      onPressed: () {
                        Navigator.pushNamed(context, '/tentang');
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
