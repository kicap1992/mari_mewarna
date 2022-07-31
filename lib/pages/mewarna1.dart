// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gallery_saver/gallery_saver.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

import '../controller/myCustonPainter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:uuid/uuid.dart';

import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class Mewarna1Page extends StatefulWidget {
  const Mewarna1Page({Key? key}) : super(key: key);

  @override
  State<Mewarna1Page> createState() => _Mewarna1PageState();
}

class _Mewarna1PageState extends State<Mewarna1Page> {
  // List<Offset?> points = [];
  List<DrawingArea?> points = [];
  // List<DrawingArea?> undoPoints = [];
  Color selectedColor = Colors.black.withOpacity(0.01);
  double strokeWidth = 2.0;
  // ui.Image? image;

  late Map args;
  late String _uuid;

  final GlobalKey _globalKey = GlobalKey();

  Uint8List? _bytes;
  String _ini = 'tiada';

  bool _delete = false;

  // audio player
  // AudioCache _audioCache = AudioCache();
  final _audioPlayer = AudioPlayer(); //call audio player
  bool _isPlaying = false; //check if audio is playing
  Duration _duration = Duration.zero; //set duration to 0
  // Duration _position = Duration.zero; //set position to 0

  // ignore: unused_element
  // Future _saveNetworkImage() async {
  //   // String path =
  //   //     'https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg';
  //   // GallerySaver.saveImage(path, albumName: "Download");
  // }

  Future _saveImage(Uint8List bytes, String stat) async {
    log(stat);
    final appStorage = await getApplicationDocumentsDirectory();
    final fileName = args['nama']!.toString() + _uuid + '.png';
    log(fileName);
    final file = File('${appStorage.path}/$fileName');
    log(file.toString());
    await file.writeAsBytes(bytes);

    if (stat == 'simpan') {
      await EasyLoading.show(
        status: 'Menyimpan...',
        maskType: EasyLoadingMaskType.black,
      );
      await GallerySaver.saveImage(file.path, albumName: "Download");
      await EasyLoading.dismiss();
      // create dialog box message "Foto berhasil disimpan"
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          // title: Text('Foto berhasil disimpan di'),
          content: const Text('Foto berhasil disimpan di galeri'),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }
  }

  Future<Uint8List> _capturePng(String stat) async {
    // try {
    await EasyLoading.show(
      status: 'loading...',
      maskType: EasyLoadingMaskType.black,
    );
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    var pngBytes = byteData!.buffer.asUint8List();
    var bs64 = base64Encode(pngBytes);

    setState(() {
      _bytes = base64Decode(bs64);
      _ini = 'ada';
      points.clear();
    });
    await _saveImage(base64Decode(bs64), stat);
    // await _saveNetworkImage();

    await EasyLoading.dismiss();

    // if (stat == 'simpan') {
    //   // log('simpan');
    //   await EasyLoading.show(
    //     status: 'Menyimpan Ke  Galeri',
    //     maskType: EasyLoadingMaskType.black,
    //   );
    //   await ImageGallerySaver.saveImage(Uint8List.fromList(pngBytes),
    //       quality: 100, name: args['nama']!.toString() + _uuid);
    //   await EasyLoading.dismiss();
    //   // create alert dialog
    //   showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: const Text('Tersimpan'),
    //         content: const Text('Gambar telah disimpan di galeri'),
    //         actions: <Widget>[
    //           ElevatedButton(
    //             child: const Text('OK'),
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //           ),
    //         ],
    //       );
    //     },
    //   );
    // }

    return pngBytes;
    // } catch (e) {
    //   print(e);
    //   return null;
    // }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _uuid = const Uuid().v4();
    // print(_uuid);
    // setAudio('burung', 'binatang');
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state == PlayerState.PLAYING;
        });
      }
    });

    _audioPlayer.onDurationChanged.listen((duration) {
      if (mounted) {
        setState(() {
          _duration = duration;
        });
      }
    });

    _audioPlayer.onAudioPositionChanged.listen((position) {
      // if
      if (mounted) {
        log('position: $position');
        if (position.inMilliseconds > _duration.inMilliseconds) {
          _audioPlayer.stop();
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    // ignore: todo
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    args = ModalRoute.of(context)?.settings.arguments as Map;
    log(args['nama'].toString());
    log(args['kategori'].toString());
    setAudio(args['nama'].toString(), args['kategori'].toString());
  }

  @override
  void dispose() {
    _audioPlayer.dispose();

    super.dispose();
  }

  Future setAudio(String? nama, String? folder) async {
    // repeat audio
    // _audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    // load audio from asset (assets/binatang/burung.mp3)
    final player = AudioCache(prefix: 'assets/' + folder! + '/');
    final url = await player.load(nama! + '.mp3');
    _audioPlayer.setUrl(url.path, isLocal: true);
    _audioPlayer.resume();
    setState(() {
      _isPlaying = true;
    });
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
              // print(colorToHex(color));
              setState(() {
                selectedColor = color.withOpacity(0.01);
                // selectedColor = color.withOpacity(0.5);
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
        appBar: AppBar(
          title: Text(toBeginningOfSentenceCase(args['nama']?.toString()) ??
              'Mewarna 1'),
          actions: [
            IconButton(
              icon: _isPlaying
                  ? const Icon(Icons.stop)
                  : const Icon(Icons.play_arrow),
              onPressed: () async {
                if (_isPlaying) {
                  await _audioPlayer.stop();
                  setState(() {
                    _isPlaying = false;
                  });
                } else {
                  await _audioPlayer.resume();
                }
              },
            ),
            Ink(
              decoration: ShapeDecoration(
                color: _delete ? Colors.red : Colors.transparent,
                shape: const CircleBorder(),
              ),
              child: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    _delete = !_delete;
                  });
                },
              ),
            ),
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _capturePng('simpan');
              },
            ),
          ],
        ),
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
                  ],
                ),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RepaintBoundary(
                    key: _globalKey,
                    child: Container(
                      width: width * 0.80,
                      height: height * 0.70,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          )
                        ],
                        image: _ini == 'tiada'
                            ? DecorationImage(
                                image: AssetImage("assets/" +
                                    args['kategori'] +
                                    "/" +
                                    args['nama'] +
                                    ".jpg"),
                                fit: BoxFit.fill,
                              )
                            : DecorationImage(
                                image: MemoryImage(_bytes!),
                                fit: BoxFit.cover,
                              ),
                      ),
                      child: GestureDetector(
                        onPanDown: (details) {
                          if (_delete) {
                            setState(() {
                              points.add(
                                DrawingArea(
                                  point: details.localPosition,
                                  areaPaint: Paint()
                                    ..strokeCap = StrokeCap.round
                                    ..isAntiAlias = true
                                    ..color = Colors.white.withOpacity(0.07)
                                    ..strokeWidth = strokeWidth,
                                ),
                              );
                            });
                          } else {
                            setState(() {
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
                          }
                        },
                        onPanUpdate: (details) {
                          if (_delete) {
                            setState(() {
                              points.add(
                                DrawingArea(
                                  point: details.localPosition,
                                  areaPaint: Paint()
                                    ..strokeCap = StrokeCap.round
                                    ..isAntiAlias = true
                                    ..color = Colors.white.withOpacity(0.07)
                                    ..strokeWidth = strokeWidth,
                                ),
                              );
                            });
                          } else {
                            setState(() {
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
                          }
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
                  ),
                  const SizedBox(height: 5),
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
                            max: 20.0,
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
                                if (points.length > 200) {
                                  points.removeRange(
                                      points.length - 200, points.length);
                                } else {
                                  points.clear();
                                }
                              }
                            });
                          },
                          child: const Icon(
                            Icons.layers_clear,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          onPressed: () async {
                            _capturePng('tidak_simpan');
                            log("sini untuk simpan");
                            // String path =
                            //     'https://image.shutterstock.com/image-photo/montreal-canada-july-11-2019-600w-1450023539.jpg';
                            // await GallerySaver.saveImage(path);
                          },
                          icon: const Icon(Icons.save_alt_outlined),
                        ),
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

  Future<bool> _onWillPopScope() async {
    // return false;
    return await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(
              'Berhenti Mewarna',
              textAlign: TextAlign.center,
            ),
            content: const Text(
              'Apakah anda yakin ingin berhenti mewarna? \n Semua yang telah dibuat akan hilang',
              textAlign: TextAlign.center,
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
            ],
          ),
        ) ??
        false;
  }
}
