

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundedButton({Key? key,
    required this.title,
     this.loading=false,
    required this.onPress }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: loading? const CircularProgressIndicator(color: Colors.red,): Text(title));
  }
}
