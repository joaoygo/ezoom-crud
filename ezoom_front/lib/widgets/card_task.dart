import 'package:flutter/material.dart';

class CardTask extends StatelessWidget {
  final String title;
  final Widget checkbox;
  final Function()? delete;
  final Function()? edit;
  const CardTask(
      {super.key,
      required this.title,
      this.delete,
      this.edit,
      required this.checkbox});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                checkbox,
                const Text(
                  'Finalizado',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: edit,
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: delete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
