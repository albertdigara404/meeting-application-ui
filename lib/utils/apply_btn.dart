import 'package:flutter/material.dart';
import 'package:kma_meeting_app/utils/palette.dart';

class ApplyBtn extends StatelessWidget {
  void Function() onPress;
  ApplyBtn({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: Pallete.mainFontColor,
        padding: const EdgeInsets.all(15),
      ),
      child: const Text(
        "Apply",
        style: TextStyle(
          fontFamily: "Cera Pro",
          fontSize: 20,
          color: Pallete.whiteColor,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
