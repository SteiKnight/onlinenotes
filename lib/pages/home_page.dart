import 'package:flutter/material.dart';
import 'package:onlinenotes/models/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:Text('Notes'),),
        backgroundColor: Colors.grey[7],
        body: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return NoteCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
