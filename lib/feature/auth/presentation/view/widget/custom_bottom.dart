import 'package:auth/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  CustomBottom({super.key, required this.onTap, this.color,required this.text,});
  VoidCallback onTap;
  Color? color;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: MaterialButton(
        onPressed: onTap,
        minWidth: double.infinity,
        color: color ?? Theme.of(context).primaryColor,
        height: 48,
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.KwhiteColor,
              ),
        ),
      ),
    );
  }
}
