import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coming_soon_controller.dart';

class ComingSoonView extends GetView<ComingSoonController> {
  const ComingSoonView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'ComingSoon 🙏',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
