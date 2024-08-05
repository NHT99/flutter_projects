import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {
  const StyledButton( {super.key,required this.onPressed,required this.child,});

  final void Function() onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor:const Color.fromARGB(255, 97, 71, 32), foregroundColor: Colors.white),
        onPressed: onPressed,
        child: child);
  }
}
