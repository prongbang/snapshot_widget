# snapshot_widget

[![pub package](https://img.shields.io/pub/v/snapshot_widget.svg)](https://pub.dartlang.org/packages/snapshot_widget)

A Flutter library to Snapshot Widget to Uint8List image.

## Features

- Snapshot Widget

```dart
final _controller = SnapshotController();

SnapshotWidget(
  controller: _controller,
  child: Container(),
)
```

- Snapshot widget to Uint8List

```dart
final imageBytes = await _controller.value(pixelRatio: 16 / 9);
```

## Getting started

It is really easy to use! You should ensure that you add the `snapshot_widget` as a dependency in your flutter project.

```yaml
snapshot_widget: "^1.0.0"
```

## Usage

```dart
class _MyAppState extends State<MyApp> {
  final _controller = SnapshotController();
  Uint8List _image = Uint8List.fromList([]);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SnapshotWidget(
          controller: _controller,
          child: const SmartCardWidget(),
        ),
        OutlinedButton(
          onPressed: _snapshotWidget,
          child: const Text('Snapshot'),
        ),
        const Divider(),
        if (_image.isNotEmpty)
          Image.memory(_image),
      ],
    );
  }

  void _snapshotWidget() async {
    final imageBytes = await _controller.value(pixelRatio: 16 / 9);
    setState(() {
      _image = imageBytes;
    });
  }
}
```