import 'package:flutter/material.dart';

import '../utils/apply_btn.dart';
import '../utils/palette.dart';
import '../utils/textfields.dart';
import 'package:http/http.dart' as http;

class VIPPage extends StatefulWidget {
  const VIPPage({Key? key}) : super(key: key);

  @override
  State<VIPPage> createState() => _VIPPageState();
}

class _VIPPageState extends State<VIPPage> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "VIP Registration Page",
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
                "Welcome to the KMA Delegate Meeting application Page",
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
