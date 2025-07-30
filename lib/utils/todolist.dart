import 'package:flutter/material.dart';

class Newitem extends StatelessWidget {
  Newitem({
    super.key,
    required this.taskName,
    required this.taskcomp,
    required this.onChanged,
  });

  final String taskName;
  final bool taskcomp;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 135, 217, 213),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(20),

        child: Row(
          children: [
            Checkbox(
              value: taskcomp,
              onChanged: onChanged,
              checkColor: Colors.white,
              fillColor: WidgetStatePropertyAll(
                const Color.fromARGB(255, 63, 176, 153),
              ),
              side: BorderSide(color: Colors.black),
            ),
            Text(
              taskName,
              style: TextStyle(
                decoration: taskcomp
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                decorationColor: Colors.white,
                decorationThickness: 2,
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
