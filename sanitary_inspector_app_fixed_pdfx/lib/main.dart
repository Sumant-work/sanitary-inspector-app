
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanitary Inspector Study Hub',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomeScreen(),
      routes: {
        '/pyq': (context) => PDFScreen(title: "PYQ", url: "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf"),
        '/notes': (context) => PDFScreen(title: "Notes", url: "https://www.africau.edu/images/default/sample.pdf"),
        '/quiz': (context) => QuizScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sanitary Inspector Study Hub")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/pyq'), child: Text("📘 PYQs")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/notes'), child: Text("📝 Notes")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/quiz'), child: Text("🧠 Quiz")),
          ],
        ),
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  final String title;
  final String url;

  PDFScreen({required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: WebView(
        initialUrl: "https://docs.google.com/gview?embedded=true&url=" + url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;

  final questions = [
    {
      'question': 'First step in public health?',
      'options': ['Planning', 'Cleaning', 'Survey', 'Monitoring'],
      'answer': 0
    },
    {
      'question': 'Color for biomedical waste bin?',
      'options': ['Green', 'Yellow', 'Blue', 'Red'],
      'answer': 1
    },
    {
      'question': 'Cause of Malaria?',
      'options': ['Bacteria', 'Virus', 'Parasite', 'Fungus'],
      'answer': 2
    },
  ];

  void answerQuestion(int index) {
    if (index == questions[currentQuestion]['answer']) {
      score++;
    }
    setState(() {
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestion >= questions.length) {
      return Scaffold(
        appBar: AppBar(title: Text("Quiz Completed")),
        body: Center(child: Text("Your Score: $score/${questions.length}")),
      );
    }

    final q = questions[currentQuestion];
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(q['question'].toString(), style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          ...List.generate(q['options']!.length, (i) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () => answerQuestion(i),
                child: Text(q['options']![i]),
              ),
            );
          }),
        ],
      ),
    );
  }
}
