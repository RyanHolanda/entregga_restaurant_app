import 'package:flutter/material.dart';

class MyButton1 extends StatelessWidget {
  const MyButton1({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
          height: 50,
          width: 400,
          child: MaterialButton(
            color: Theme.of(context).colorScheme.primary,
            onPressed: onPressed,
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          )),
    );
  }
}
