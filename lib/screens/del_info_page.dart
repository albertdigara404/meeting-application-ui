import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kma_meeting_app/utils/palette.dart';

import '../models/delegates_models.dart';

class DelegateInfo extends StatelessWidget {
  const DelegateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final Delegate delegate = Get.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          height: 300,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            border: Border.all(color: Pallete.borderColor),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${delegate.name}'),
              Text('Email: ${delegate.email}'),
              Text('Country: ${delegate.country}'),
              Text('Passport: ${delegate.passport}'),
              Text('Position: ${delegate.position}')
            ],
          ),
        ),
      ),
    );
  }
}
