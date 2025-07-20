import 'package:flutter/material.dart';
import 'screens/pyq_screen.dart';
import 'screens/notes_screen.dart';
import 'screens/quiz_screen.dart';

void main() => runApp(SanitaryInspectorApp());

class SanitaryInspectorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanitary Inspector App',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/pyq': (context) => PyqScreen(),
        '/notes': (context) => NotesScreen(),
        '/quiz': (context) => QuizScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  final sections = [
    {'title': '📄 PYQ PDFs (PYQ पीडीएफ)', 'route': '/pyq'},
    {'title': '📝 Notes (नोट्स)', 'route': '/notes'},
    {'title': '❓ Quiz (प्रश्नोत्तरी)', 'route': '/quiz'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sanitary Inspector App')),
      body: ListView.builder(
        itemCount: sections.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(sections[index]['title']!),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.pushNamed(context, sections[index]['route']!);
          },
        ),
      ),
    );
  }
}
