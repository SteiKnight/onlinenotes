import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  void Function()? edit;
  void Function()? delete;
  final String text;
  NoteCard({
    super.key,
    required this.text,
    required this.edit,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 25,
        right: 25,
        bottom: 10,
      ),
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
              text,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: edit,
                  icon: Icon(Icons.settings, color: Colors.grey),
                ),
                SizedBox(width: 0),
                IconButton(
                  onPressed: delete,
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
