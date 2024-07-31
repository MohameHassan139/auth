import 'package:flutter/material.dart';

class pageTile extends StatelessWidget {
   pageTile({
    super.key,
    required this.text,
  });
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      "Log in to your account",
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
