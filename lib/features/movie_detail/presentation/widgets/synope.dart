import 'package:flutter/material.dart';

class Synope extends StatelessWidget {
  final String synope;
  const Synope({Key? key, required this.synope}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
          child: Text(
            "Summary",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            synope,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
