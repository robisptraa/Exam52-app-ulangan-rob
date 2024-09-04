import 'package:examPI52/webview.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? qrText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(title: Text('Exam52',  style: TextStyle( fontFamily: 'Raleway', // Custom font
            fontWeight: FontWeight.bold)
           ), backgroundColor: Colors.blueAccent ),
     
      body: Stack(
        children: <Widget>[
          _buildQrView(context),
          _buildControlOverlay(),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.blueAccent,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.7,
      ),
    );
  }

  Widget _buildControlOverlay() {
    return Positioned(
      bottom: 20,
      left: 20,
      right: 20,
      child: Center(
        child: (qrText != null)
            ? ElevatedButton(
                onPressed: () {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebviewPage(url: qrText ?? "",), //fungsi input url 
                    ),
                  );
                },
                child: Text('Run Learn'),
              )
            : Text(
                'Scan a QR code',
                style: TextStyle(color: Colors.blueAccent, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
              ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (qrText != scanData.code) {
        print("data : ${scanData.code}"); //baca data dari qr 
        setState(() {
          qrText = scanData.code;
        });
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}


