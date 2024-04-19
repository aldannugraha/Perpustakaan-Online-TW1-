import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/flash_screen_controller.dart';

class FlashScreenView extends GetView<FlashScreenController> {
  const FlashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlashScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FlashScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
