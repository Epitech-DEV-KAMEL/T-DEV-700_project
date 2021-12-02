
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:terminal_app/core/themes/color_theme.dart';

class QRCodeWindows extends StatefulWidget {
  const QRCodeWindows({ Key? key }) : super(key: key);

  @override
  _QRCodeWindowsState createState() => _QRCodeWindowsState();
}

class _QRCodeWindowsState extends State<QRCodeWindows> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scannedData) {
      controller.pauseCamera();
      Navigator.pop(context, scannedData);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey, 
              onQRViewCreated: onQRViewCreated
            ),
          ),
          Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14.0),
                    primary: ColorTheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                    )
                  ),
                  onPressed: () {
                    Navigator.pop(context, null);
                  }, 
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}