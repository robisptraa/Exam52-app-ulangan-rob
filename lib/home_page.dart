import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';


 void _secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

class HomePage extends StatelessWidget {
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _secureScreen(); 
    return Scaffold(
      //appbar
      appBar: AppBar(title: Text('Exam52',  style: TextStyle( fontFamily: 'Raleway', // Custom font
            fontWeight: FontWeight.bold)
           ), backgroundColor: Colors.blueAccent ),
     
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/logo_pi.png'),
              ),

              SizedBox(height: 40), // fungsi tempat url
              // tempat URL
              Container(
                width: 350, // ukuran kolom
                child: TextField(
                  controller: _urlController,
                  decoration: InputDecoration(labelText: 'Enter URL'),
                  keyboardType: TextInputType.url,
                ),
              ),

                SizedBox(height: 20), // Menambahkan jarak antara kolom URL dan tombol
            ElevatedButton(
              onPressed: () {
                if (_urlController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebViewPage(url: _urlController.text),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent, // Warna teks tombol
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Border radius
                ),
                elevation: 5, // Shadow
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class WebViewPage extends StatelessWidget {
  final String url;

  WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exam52'),backgroundColor: Colors.blueAccent,
      ),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..loadRequest(Uri.parse(url)),
      ),
    );
  }
}
