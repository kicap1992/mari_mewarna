import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

class KategoriPage extends StatefulWidget {
  const KategoriPage({Key? key}) : super(key: key);

  @override
  State<KategoriPage> createState() => _KategoriPageState();
}

class _KategoriPageState extends State<KategoriPage> {
  late String _kategori;

  late List<Widget> _listKategori;
  // late List<String> _list;

  //create list of categories that contain map of category name
  //and image path
  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Binatang',
      'folder': 'binatang',
      'list': ["Burung", "Kelinci", "Gajah", "Monyet", "Singa"],
    },
    {
      'name': 'Kenderaan',
      'folder': 'kenderaan',
      'list': ["Mobil", "Motor", "Pesawat", "Bis", "Truk"],
    },
    {
      'name': 'Sayur-Sayuran',
      'folder': 'sayur',
      'list': ["Kubis", "Terong", "Tomat", "Wortel", "Cendawan"],
    },
    {
      'name': 'Buah-Buahan',
      'folder': 'buah',
      'list': ["Apel", "Alpukat", "Lemon", "Mangga", "Pisang"],
    }
  ];

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _kategori = ModalRoute.of(context)!.settings.arguments as String;
    List _list = _categories
        .firstWhere((element) => element['name'] == _kategori)['list'];
    String _folder = _categories
        .firstWhere((element) => element['name'] == _kategori)['folder'];
    // print(_categories);
    // loop the _list and create a list of widget
    _listKategori = _list.map((element) {
      return Container(
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3,
          child: ElevatedButton(
            child: Text(element),
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/mewarna1',
                arguments: {
                  'kategori': _folder,
                  'nama': element.toString().toLowerCase()
                },
              );
            },
          ),
        ),
      );
    }).toList();

    // print(_kategori);
  }

  @override
  void setState(VoidCallback fn) {
    // ignore: todo
    // TODO: implement setState
    if (mounted) {
      super.setState(fn);
    }
    // super.setState(fn);
  }

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
                  // load the _listKategori
                  ..._listKategori,

                  //make the button same width
                  // SizedBox(
                  //   // width is half of the screen width
                  //   width: MediaQuery.of(context).size.width / 3,
                  //   child: ElevatedButton(
                  //     child: const Text('Burung'),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/mewarna1',
                  //           arguments: {'kategori': 'hewan', 'nama': 'burung'});
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 3,
                  //   child: ElevatedButton(
                  //     child: const Text('Kelinci'),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/mewarna1', arguments: {
                  //         'kategori': 'hewan',
                  //         'nama': 'kelinci'
                  //       });
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 3,
                  //   child: ElevatedButton(
                  //     child: const Text('Gajah'),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/mewarna1',
                  //           arguments: {'kategori': 'hewan', 'nama': 'gajah'});
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 3,
                  //   child: ElevatedButton(
                  //     child: const Text('Monyet'),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/mewarna1',
                  //           arguments: {'kategori': 'hewan', 'nama': 'monyet'});
                  //     },
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 15,
                  // ),
                  // SizedBox(
                  //   width: MediaQuery.of(context).size.width / 3,
                  //   child: ElevatedButton(
                  //     child: const Text('Singa'),
                  //     onPressed: () {
                  //       Navigator.pushNamed(context, '/mewarna1',
                  //           arguments: {'kategori': 'hewan', 'nama': 'singa'});
                  //     },
                  //   ),
                  // ),
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
