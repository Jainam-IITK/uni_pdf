import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
//import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:uni_pdf/uni_pdf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _uniPdfPlugin = UniPdf();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _uniPdfPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: HomePage(),
      ),
    );
  }
}

// class PdfView extends StatefulWidget {
//   final String filePath;
//   final String password;
//   const PdfView({
//     Key? key,
//     required this.filePath,
//     required this.password,
//   }) : super(key: key);

//   @override
//   _PdfViewState createState() => _PdfViewState();
// }

// class _PdfViewState extends State<PdfView> {
//   _PdfViewState();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('PDF View'),
//       ),
//       body: PDF(password: widget.password).fromPath(widget.filePath),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool? _isEncrypted;
  bool? _isPasswordCorrect;
  String? _filePath;
  String? _password;
  final _pdfPasswordPlugin = UniPdf();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: const Text('Select file'),
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles();
            if (result == null) {
              log("No file selected");
            } else {
              _filePath = result.files.first.path;
              _isEncrypted = (await _pdfPasswordPlugin.isEncrypted(_filePath!))!;
              log("File selected: ${result.files.first.name}");
            }
            setState(() {
              _isEncrypted = _isEncrypted;
            });

            log(result.toString());
          },
        ),
        Text('Is file encrypted - $_isEncrypted\n'),
        TextField(
          enabled: (_filePath != null),
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
          onSubmitted: (value) async {
            _isPasswordCorrect = (await _pdfPasswordPlugin.isPasswordCorrect(_filePath!, value))!;
            setState(() {
              _isPasswordCorrect = _isPasswordCorrect;
              if (_isPasswordCorrect!) {
                _password = value;
              }
            });
          },
        ),
        Text('Is password correct - $_isPasswordCorrect\n'),
        // ElevatedButton(
        //   onPressed: () => Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => PdfView(filePath: _filePath!, password: _password!),
        //     ),
        //   ),
        //   child: const Text('Open file'),
        // ),
      ],
    );
  }
}
