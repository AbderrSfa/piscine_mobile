import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final String buttonText;
  final void Function()? buttonTapped;

  const MyButton(
      {this.color,
      this.textColor,
      this.buttonText = '',
      this.buttonTapped,
      super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyLarge!
        .copyWith(color: textColor, fontWeight: FontWeight.w500);

    return GestureDetector(
      onTap: () {
        print(buttonText);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(child: Text(buttonText, style: textStyle)),
          ),
        ),
      ),
    );
  }
}
