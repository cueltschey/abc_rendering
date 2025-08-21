import 'package:flutter/material.dart';
import 'package:abc_rendering/abc_rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const AbcRenderDemoPage(title: 'ABC Rendering Demo'),
    );
  }
}

class AbcRenderDemoPage extends StatefulWidget {
  const AbcRenderDemoPage({super.key, required this.title});
  final String title;

  @override
  State<AbcRenderDemoPage> createState() => _AbcRenderDemoPageState();
}

class _AbcRenderDemoPageState extends State<AbcRenderDemoPage> {
  static const _demoAbcString = """
X: 1
T: The Bucks Of Oranmore
R: reel
M: 4/4
L: 1/8
K: Dmaj
A2FA A2dB|A2FA BEE2|A2FA A2Bd|egfd edBd|
A2FA A2dB|A2FA BEE2|DEFG AFAB|defd edBd||
ADFD A2dB|ADFD BEE2|ADFD A2Bd|egfd edBd|
ADFD A2dB|ADFD BEE2|DEFG AFAB|defd efge||
a2fd edef|a2fd ed B2|a2fd edef|gefd edB2|
a2fd edef|a2fd edB2|faaf bfaf|defd edBd||
f2df e2de|f2df edBd|f2df e2de|gefd edBd|
f2df e2de|f2df edBd|faaf bfaf|defd edBd||
Adfd edfd|Adfd edBd|Adfd edfd|gefd edBd|
Adfd edfd|Adfd edB2|faaf bfaf|defd edBd||
""";

  late final AbcCanvas _abcCanvas;
  late final AbcCanvas _abcCanvasB;

  @override
  void initState() {
    super.initState();
    _abcCanvas = AbcCanvas.fromString(_demoAbcString);
    _abcCanvasB = AbcCanvas.fromPath("./demo.abc");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(children: [Center(child: _abcCanvas),Center(child: _abcCanvasB)])
    );
  }
}

