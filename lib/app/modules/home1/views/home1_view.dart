import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home1_controller.dart';

class Home1View extends GetView<Home1Controller> {
  const Home1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home1View'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Home1View is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
