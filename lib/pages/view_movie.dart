import 'package:flutter/material.dart';


class ViewMovie extends StatelessWidget {
  const ViewMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(
          children: [
            Text(
              "Filme",
              style: TextStyle(fontSize: 40),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}
