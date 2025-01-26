import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    void settingsCard() {}
    void deleteCard() {}
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Hello World',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: settingsCard,
                  icon: Icon(Icons.settings, color: Colors.grey),
                ),
                SizedBox(width: 0),
                IconButton(
                  onPressed: deleteCard,
                  icon: Icon(Icons.delete, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
