import 'package:flutter/material.dart';
import 'dart:io';

class AbcCanvas extends StatefulWidget {
  final String abcString;

  const AbcCanvas._internal({super.key, required this.abcString});

  /// Construct from raw string
  factory AbcCanvas.fromString(String abc) {
    return AbcCanvas._internal(abcString: abc);
  }

  /// Construct from file path
  factory AbcCanvas.fromPath(String path) {
    final content = File(path).readAsStringSync();
    return AbcCanvas._internal(abcString: content);
  }

  @override
  State<AbcCanvas> createState() => _AbcCanvasState();
}

class _AbcCanvasState extends State<AbcCanvas> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.abcString,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

