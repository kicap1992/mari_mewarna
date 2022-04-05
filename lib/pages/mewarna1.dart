import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// import 'package:flutter/services.dart';
// import 'dart:ui' as ui;

import '../controller/myCustonPainter.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

class Mewarna1Page extends StatefulWidget {
  const Mewarna1Page({Key? key}) : super(key: key);

  @override
  State<Mewarna1Page> createState() => _Mewarna1PageState();
}

class _Mewarna1PageState extends State<Mewarna1Page> {
  // List<Offset?> points = [];
  List<DrawingArea?> points = [];
  // List<DrawingArea?> undoPoints = [];
  Color selectedColor = Colors.black.withOpacity(0.08);
  double strokeWidth = 2.0;
  // ui.Image? image;

  late Map args;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // selectedColor = Colors.black;
  //   // strokeWidth = 2.0;
  //   // loadImage('assets/hewan/singa.jpg');
  //   args = ModalRoute.of(context)?.settings.arguments as Map;
  //   print(args);
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    args = ModalRoute.of(context)?.settings.arguments as Map;
    print(args);
  }

  void selectColor() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pilih warna'),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) {
              print(colorToHex(color));
              setState(() {
                selectedColor = color.withOpacity(0.08);
              });
            },
          ),
        ),
        actions: [
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    // final ValueNotifier<List<Offset>> points = useState([]);

    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(138, 35, 135, 1.0),
                    Color.fromRGBO(233, 64, 87, 1.0),
                    Color.fromRGBO(242, 113, 33, 1.0),
                  ])),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.80,
                    height: height * 0.80,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.4),
                          blurRadius: 5.0,
                          spreadRadius: 1.0,
                        )
                      ],
                      image: DecorationImage(
                        image: AssetImage("assets/" +
                            args['kategori'] +
                            "/" +
                            args['nama'] +
                            ".jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: GestureDetector(
                      onPanDown: (details) {
                        setState(() {
                          // points.add(details.localPosition);
                          // print(points);
                          points.add(
                            DrawingArea(
                              point: details.localPosition,
                              areaPaint: Paint()
                                ..strokeCap = StrokeCap.round
                                ..isAntiAlias = true
                                ..color = selectedColor
                                ..strokeWidth = strokeWidth,
                            ),
                          );
                        });
                      },
                      onPanUpdate: (details) {
                        setState(() {
                          // points.add(details.localPosition);
                          // print(points);
                          points.add(
                            DrawingArea(
                              point: details.localPosition,
                              areaPaint: Paint()
                                ..strokeCap = StrokeCap.round
                                ..isAntiAlias = true
                                ..color = selectedColor
                                ..strokeWidth = strokeWidth,
                            ),
                          );
                        });
                      },
                      onPanEnd: (details) {
                        setState(() {
                          points.add(null);
                          // print(details);
                        });
                      },
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        child: CustomPaint(
                          painter: MyCustomPainter(points: points),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: width * 0.80,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            selectColor();
                          },
                          icon: Icon(
                            Icons.color_lens,
                            color: selectedColor.withOpacity(1),
                          ),
                        ),
                        Expanded(
                          child: Slider(
                            min: 1.0,
                            max: 7.0,
                            activeColor: selectedColor.withOpacity(1),
                            value: strokeWidth,
                            onChanged: (value) {
                              setState(() {
                                strokeWidth = value;
                              });
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (points.isNotEmpty) {
                                points.removeLast();
                              }
                            });
                          },
                          onLongPress: () {
                            //remove the 10 last points
                            setState(() {
                              if (points.isNotEmpty) {
                                if (points.length > 20) {
                                  points.removeRange(
                                      points.length - 20, points.length);
                                } else {
                                  points.clear();
                                }
                              }
                            });
                          },
                          child: Icon(
                            Icons.layers_clear,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        // IconButton(
                        //   onPressed: () {
                        //     // points.clear();
                        //     // points.removeLast();

                        //     // search for undoPoints on points and remove it
                        //     setState(() {
                        //       // points.removeLast();
                        //       if (points.isNotEmpty) {
                        //         points.removeLast();
                        //       }
                        //     });
                        //   },
                        //   icon: Icon(Icons.layers_clear),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Future loadImage(String path) async {
  //   final data = await rootBundle.load(path);
  //   final bytes = data.buffer.asUint8List();
  //   final image = await decodeImageFromList(bytes);
  //   setState(() {
  //     this.image = image;
  //   });
  // }

  Future<bool> _onWillPopScope() async {
    // return false;
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Berhenti Mewarna'),
            content: const Text('Apakah anda yakin ingin berhenti mewarna?'),
            actions: [
              ElevatedButton(
                child: const Text('Tidak'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              ElevatedButton(
                child: const Text('Ya'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  // backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ) ??
        false;
  }
}
