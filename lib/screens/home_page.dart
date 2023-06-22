import 'package:flutter/material.dart';
import 'package:kma_meeting_app/screens/delegate.dart';
import 'package:kma_meeting_app/screens/speaker.dart';
import 'package:kma_meeting_app/screens/support_staff.dart';
import 'package:kma_meeting_app/screens/vip.dart';
import 'package:kma_meeting_app/utils/buttons.dart';
import 'package:kma_meeting_app/utils/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu_rounded),
        title: const Text(
          "KMA Meeting App",
          style: TextStyle(
            fontFamily: "Cera Pro",
            color: Pallete.mainFontColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(right: 24.0),
                decoration: const BoxDecoration(
                  color: Pallete.firstSuggestionBoxColor,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                height: 42,
                width: 42,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/virtualAssistant.png"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Stack(
              children: [
                Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.only(right: 24.0),
                  decoration: const BoxDecoration(
                    color: Pallete.firstSuggestionBoxColor,
                    shape: BoxShape.circle,
                  ),
                ),
                Container(
                  height: 122,
                  width: 122,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/logo.png"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            margin: const EdgeInsets.symmetric(horizontal: 40).copyWith(
              top: 30,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Pallete.borderColor),
              borderRadius:
                  BorderRadius.circular(20).copyWith(topLeft: Radius.zero),
            ),
            child: const Text(
              "Welcome to The Kenya Maritime Authority Meeting Application",
              style: TextStyle(
                color: Pallete.mainFontColor,
                fontFamily: "Cera Pro",
                fontSize: 24,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(top: 10, left: 22),
              child: const Text(
                "Choose Your Category for registration below",
                style: TextStyle(
                  color: Pallete.mainFontColor,
                  fontFamily: "Cera Pro",
                ),
              ),
            ),
          ),
          ButtonsSelect(
            color: Pallete.firstSuggestionBoxColor,
            text: "Delegate",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const DelegatePage();
              }));
            },
          ),
          ButtonsSelect(
            color: Pallete.secondSuggestionBoxColor,
            text: "Support",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SupportStaffPage();
              }));
            },
          ),
          ButtonsSelect(
            color: Pallete.thirdSuggestionBoxColor,
            text: "VIP",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const VIPPage();
              }));
            },
          ),
          ButtonsSelect(
            color: Pallete.firstSuggestionBoxColor,
            text: "Speaker",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const SpeakerPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
