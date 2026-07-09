import 'package:flutter/material.dart';

class Homepagemodel {
  String title;
  String level;
  String image;
  Color color;
  Color elevatedColor;
  VoidCallback navigator;

  Homepagemodel({
    required this.level,
    required this.image,
    required this.color,
    required this.elevatedColor,
    required this.navigator,
    required this.title,
  });
}

List<Homepagemodel> list = [
  Homepagemodel(
    image: "assets/homepage_image/math.png",
    level: "1",
    elevatedColor: Color(0xff00BCFF),
    color: Color(0xff74D4FF),
    navigator: () {},
    title: "Addition",
  ),
  Homepagemodel(
    image: "assets/homepage_image/math (1).png",
    level: "2",
    elevatedColor: Color(0xffBBF451),
    color: Color(0xffD8F999),
    navigator: () {},
    title: "Subtraction",
  ),
  Homepagemodel(
    level: "3",
    image: "assets/homepage_image/math (2).png",
    elevatedColor: Color(0xffF4A8FF),
    color: Color(0xffF6CFFF),
    navigator: () {},
    title: "Multiplication",
  ),
  Homepagemodel(
    image: "assets/homepage_image/math (3).png",
    level: "4",
    color: Color(0xffFFD6A8),
    elevatedColor: Color(0xffFFB86A),
    navigator: () {},
    title: "Division",
  ),
];
