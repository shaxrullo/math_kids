import 'package:flutter/material.dart';
import 'package:math_kids/colors/colors.dart';
import 'package:math_kids/pages/admin/kkli.dart';
import 'package:math_kids/pages/homepage/homepage.dart';
import 'package:math_kids/pages/homepage/profile/profile.dart';

class Allpages extends StatefulWidget {
  const Allpages({super.key});

  @override
  State<Allpages> createState() => _AllpagesState();
}

class _AllpagesState extends State<Allpages> {
  int index = 0;

  final List<Widget> pages = const [Homepage(), Kkli(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        selectedItemColor: AppColors.textBrand,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: "Learn",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
