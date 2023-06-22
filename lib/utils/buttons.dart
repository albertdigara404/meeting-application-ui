import 'package:flutter/material.dart';
import 'package:kma_meeting_app/utils/palette.dart';

class ButtonsSelect extends StatelessWidget {
  final Color color;
  final String text;
  void Function() onTap;
  ButtonsSelect(
      {super.key,
      required this.color,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0).copyWith(
            left: 15,
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontFamily: 'Cera Pro',
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
