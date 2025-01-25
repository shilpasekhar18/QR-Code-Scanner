
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRCode extends StatefulWidget {
  const GenerateQRCode({super.key});

  @override
  State<GenerateQRCode> createState() => _GenerateQRCodeState();
}

class _GenerateQRCodeState extends State<GenerateQRCode> {
  final TextEditingController urlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Add a listener to rebuild when the text changes
    urlController.addListener(() {
      setState(() {}); // Rebuilds the widget when the text field changes
    });
  }

  @override
  void dispose() {
    // Dispose of the controller to avoid memory leaks
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QR Code'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: QrImageView(
                  data: urlController.text,
                  version: QrVersions.auto,
                  size: 200.0,
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: urlController,
                  decoration: InputDecoration(
                    hintText: 'Enter your data',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: 'Enter your data',
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Calling setState to force QR code regeneration
                  setState(() {
                  }
                  );
                },
                child: const Text('Generate QR Code'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}