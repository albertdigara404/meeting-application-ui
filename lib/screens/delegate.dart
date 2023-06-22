import 'package:flutter/material.dart';
import 'package:kma_meeting_app/helper/sql_lite.dart';
import 'package:kma_meeting_app/models/delegates_models.dart';
import 'package:kma_meeting_app/screens/del_info_page.dart';
import 'package:kma_meeting_app/utils/apply_btn.dart';
import 'package:kma_meeting_app/utils/textfields.dart';
import 'package:get/get.dart';

import '../utils/palette.dart';

class DelegatePage extends StatefulWidget {
  const DelegatePage({Key? key}) : super(key: key);

  @override
  State<DelegatePage> createState() => _DelegatePageState();
}

class _DelegatePageState extends State<DelegatePage> {
  List<Map<String, dynamic>> _users = [];

  bool _isloading = true;

  void _refreshUsers() async {
    final data = await SQLHelper.getUsers();
    setState(() {
      _users = data;
      _isloading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshUsers();
    print("number of users ${_users.length}");
  }

  void _showDetails(int? id) {
    if (id != null) {
      final existingUser = _users.firstWhere((element) => element['id'] == id);
      _nameController.text = existingUser['name'];
      _emailController.text = existingUser['email'];
      _countryController.text = existingUser['country'];
      _passportController.text = existingUser['passport'];
      _positionController.text = existingUser['position'];
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();

  Future<void> _addUser() async {
    await SQLHelper.createUser(
        _nameController.text,
        _emailController.text,
        _passportController.text,
        _countryController.text,
        _positionController.text);
    _refreshUsers();
    print("number of users ${_users.length}");
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _countryController.dispose();
    _passportController.dispose();
    _positionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Delegate Registration Page",
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
            CustomTextFields(
              text: "Position",
              icon: Icons.roller_shades,
              controller: _positionController,
            ),
            const SizedBox(
              height: 20,
            ),
            ApplyBtn(
              onPress: () {
                final String name = _nameController.text;
                final String email = _emailController.text;
                final String country = _countryController.text;
                final String passport = _passportController.text;
                final String position = _positionController.text;

                final Delegate delegate = Delegate(
                  name: name,
                  email: email,
                  country: country,
                  passport: passport,
                  position: position,
                );
                _addUser();
                Get.to(const DelegateInfo(), arguments: delegate);
              },
            ),
          ],
        ),
      ),
    );
  }
}
