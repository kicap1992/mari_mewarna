import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../model/model_data.dart';

class Tentang extends StatefulWidget {
  const Tentang({Key? key}) : super(key: key);

  @override
  _TentangState createState() => _TentangState();
}

class _TentangState extends State<Tentang> {
  // late var box;

  Future<Box<Model>> _openBox() async {
    return await Hive.openBox<Model>('model');
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _openBox();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Tentang'),
              onPressed: () {
                tambah_data();
              },
            ),
            FutureBuilder(
              future: _openBox(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ValueListenableBuilder<Box<Model>>(
                    valueListenable: Hive.box<Model>('model').listenable(),
                    builder: (context, box, _) {
                      final model = box.values.toList().cast<Model>();
                      // ignore: avoid_print
                      print(model);
                      // create widget of list
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: model.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(model[index].datanya),
                                subtitle:
                                    Text(model[index].createdDate.toString()),
                                trailing: ElevatedButton(
                                    onPressed: () {
                                      box.deleteAt(index);
                                    },
                                    child: const Text('Hapus')),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return const Text('Loading...');
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future tambah_data() async {
    // final box = await Hive.openBox<Model>('model');
    final model = Model()
      ..createdDate = DateTime.now()
      ..datanya = 'Tentang1';

    final box = await Hive.openBox<Model>('model');
    box.add(model);
    // box.add(model);
  }
}

// class Boxes {
//   static Box<Model> getData() {
//     Hive.openBox<Model>('model');
//     return Hive.box<Model>('model');
//   }
// }
