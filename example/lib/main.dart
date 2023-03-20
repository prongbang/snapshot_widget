import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:snapshot_widget/snapshots_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = SnapshotsController();
  Uint8List _image = Uint8List.fromList([]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Snapshot Widget'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: SnapshotsWidget(
                  controller: _controller,
                  child: const SmartCardWidget(),
                ),
              ),
              OutlinedButton(
                onPressed: _snapshotWidget,
                child: const Text('Snapshot'),
              ),
              const Divider(),
              if (_image.isNotEmpty) Image.memory(_image),
            ],
          ),
        ),
      ),
    );
  }

  void _snapshotWidget() async {
    final imageBytes = await _controller.value(pixelRatio: 16 / 9);
    setState(() {
      _image = imageBytes;
    });
  }
}

class SmartCardWidget extends StatelessWidget {
  const SmartCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: const Color(0xff333333),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              const FlutterLogo(size: 70),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'SNAPSHOT WIDGET',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Snapshot widget make it easy.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Row(
              children: const [
                Icon(Icons.access_time, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  '22 Jan 2022 09:00:09:000',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Icon(
                  Icons.phone_android,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  '+66 XX XXX XXXX',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Icon(Icons.alternate_email, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'xxxx@xxxx.xxx',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: const [
                Icon(Icons.web, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'https://prongbang.github.io',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
