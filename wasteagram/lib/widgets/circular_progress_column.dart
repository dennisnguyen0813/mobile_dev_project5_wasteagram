import 'package:flutter/material.dart';

class CircularProgressColumn extends StatelessWidget {
  const CircularProgressColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(child: CircularProgressIndicator()),
      ],
    );
  }
}
