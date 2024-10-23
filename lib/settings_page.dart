import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_provider.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';

 void _secureScreen() async {
    await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  }

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    _secureScreen(); 

    return Scaffold(
      //appbar
      appBar: AppBar(title: Text('Exam52',  style: TextStyle( fontFamily: 'Raleway', // Custom font
            fontWeight: FontWeight.bold)
           ), backgroundColor: Colors.blueAccent ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: Text('Dark Mode'),
              value: provider.isDarkMode,
              onChanged: (value) {
                provider.toggleDarkMode();
              },
            ),
            SizedBox(height: 20),
            Text('Change Language'),
            RadioListTile(
              title: Text('English'),
              value: 'en',
              groupValue: provider.locale.languageCode,
              onChanged: (value) {
                provider.changeLanguage(value.toString());
              },
            ),
            RadioListTile(
              title: Text('Bahasa Indonesia'), //funsi bahasa 
              value: 'id',
              groupValue: provider.locale.languageCode,
              onChanged: (value) {
                provider.changeLanguage(value.toString());
              },
            ),
          ],
        ),
      ),
    );
  }
}
