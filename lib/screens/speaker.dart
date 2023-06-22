import 'package:flutter/material.dart';

import '../utils/apply_btn.dart';
import '../utils/palette.dart';
import '../utils/textfields.dart';
import 'package:http/http.dart' as http;

class SpeakerPage extends StatefulWidget {
  const SpeakerPage({Key? key}) : super(key: key);

  @override
  State<SpeakerPage> createState() => _SpeakerPageState();
}

class _SpeakerPageState extends State<SpeakerPage> {

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _topiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Speaker Registration Page",
          style: TextStyle(
            fontFamily: "Cera Pro",
            color: Pallete.mainFontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
              child: const Text(
                "Welcome to the KMA Speaker Meeting application Page",
                style: TextStyle(
                  fontFamily: "Cera Pro",
                  fontSize: 20,
                  color: Pallete.mainFontColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const Center(
              child: Text(
                "*Fill in your details below*",
                style: TextStyle(
                  fontFamily: "Cera Pro",
                  color: Pallete.mainFontColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextFields(
              text: "Name",
              icon: Icons.person_2_outlined,
              controller: _nameController,
            ),
            CustomTextFields(
              text: "Email",
              icon: Icons.mail_outlined,
              controller: _emailController,
            ),
            CustomTextFields(
              text: "Country",
              icon: Icons.map,
              controller: _countryController,
            ),
            CustomTextFields(
              text: "Passport",
              icon: Icons.card_membership,
              controller: _passportController,
            ),
            CustomTextFields(
              text: "Position",
              icon: Icons.roller_shades,
              controller: _positionController,
            ),
            CustomTextFields(
              text: "Topic",
              icon: Icons.speaker,
              controller: _topiController,
            ),
            const SizedBox(
              height: 20,
            ),
            ApplyBtn(
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
