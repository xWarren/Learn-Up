import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets.dart';
import '../../../core/resources/colors.dart' as colors;
import '../../../core/resources/strings.dart' as strings;
import '../../../core/resources/text_styles.dart' as styles;

class SearchPage extends StatelessWidget {
  final dynamic controller;
  const SearchPage({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Image.asset(Assets.back)),
        ),
        title: TextFormField(
          decoration: InputDecoration(
              fillColor: colors.white,
              filled: true,
              constraints: BoxConstraints.loose(const Size.fromHeight(40)),
              suffixIcon: GestureDetector(
                  onTap: () {}, child: Image.asset(Assets.search)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: colors.gray)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: colors.gray))),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Assets.notFound,
              height: 250,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            strings.notFound,
            style: styles.heading24,
          ),
          const SizedBox(height: 5),
          const Text(
            strings.trySearching,
            textAlign: TextAlign.center,
            style: styles.paragraphMedium,
          ),
        ],
      ),
    );
  }
}
