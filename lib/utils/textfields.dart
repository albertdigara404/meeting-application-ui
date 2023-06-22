import 'package:flutter/material.dart';
import 'package:kma_meeting_app/utils/palette.dart';

class CustomTextFields extends StatelessWidget {
  final String text;
  final controller;
  final IconData icon;
  const CustomTextFields(
      {super.key,
      required this.text,
      required this.icon,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              fontFamily: "Cera Pro",
              fontSize: 20,
              color: Pallete.mainFontColor,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: Icon(icon),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
