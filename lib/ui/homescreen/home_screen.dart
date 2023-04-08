import 'dart:developer';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isStoryOn = false;
  int counter = 0;
  final List<String> images = [
    'assets/p1.jpg',
    'assets/p2.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    log("Counter: $counter");
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: isStoryOn
          ? GestureDetector(
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity!.isNegative &&
                    (counter < (images.length - 1))) {
                  counter++;
                  setState(() {});
                } else {
                  if (counter != 0) {
                    counter--;
                    setState(() {});
                  }
                }
              },
              onVerticalDragEnd: (details) {
                setState(() {
                  isStoryOn = false;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                width: mq.width,
                height: mq.height,
                child: Image.asset(
                  images[counter],
                  fit: BoxFit.cover,
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                setState(() {
                  isStoryOn = true;
                });
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: mq.width * 0.2,
                  height: mq.height * 0.1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: Image.asset(
                      'assets/p1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
