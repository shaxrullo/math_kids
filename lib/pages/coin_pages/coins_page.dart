import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';

import '../../models/buttun.dart';
import '../../models/store_iteam.dart';


class CoinsPage extends StatefulWidget {
  const CoinsPage({super.key});

  @override
  State<CoinsPage> createState() => _CoinsPageState();
}

class _CoinsPageState extends State<CoinsPage> {
  int selectedIndex = 0; // 0 - Coins, 1 - Packs

  List<StoreIteam> list = [
    StoreIteam(500, 1.59),
    StoreIteam(1500, 2.99),
    StoreIteam(3500, 3.59),
    StoreIteam(6500, 5.59),
  ];
  List<StoreIteam2> list2 = [
   StoreIteam2(title: "Montly Membership",
       subtitle: "Enjoy Math for Kids premium features",
       price: "\$10.99",
       image: "assets/coins/img_1.png"),
    StoreIteam2(title: "Yearly Membership",
        subtitle: "Enjoy Math for Kids premium features",
        price: "\$100.99",
        image: "assets/coins/img_2.png"),
    StoreIteam2(title: "Lifetime Membership",
        subtitle: "Enjoy Math for Kids premium features",
        price: "\$300.99",
        image: "assets/coins/img_3.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
        ),
        title: Text(
          "Store",
          style: GoogleFonts.lilitaOne(
            fontSize: 24.sp,
            color: AppColors.textPrimary,
          ),
        ),
      ),
      body: Column(
        children: [
          // Coins / Packs toggle
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            height: 52.h,
            decoration: BoxDecoration(
              color: AppColors.bgLight,
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: AppColors.borderSecondary,
                width: 2.w,
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: double.infinity,
                      margin: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: selectedIndex == 0
                            ? AppColors.brandBorder
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: selectedIndex == 0
                            ? [
                          BoxShadow(
                            color: AppColors.borderSecondary,
                            offset: Offset(0, 3.h),
                          ),
                        ]
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Coins",
                        style: GoogleFonts.lilitaOne(
                          fontSize: 18.sp,
                          color: selectedIndex == 0
                              ? Colors.white
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: double.infinity,
                      margin: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: selectedIndex == 1
                            ? AppColors.brandBorder
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: selectedIndex == 1
                            ? [
                          BoxShadow(
                            color: AppColors.borderSecondary,
                            offset: Offset(0, 3.h),
                          ),
                        ]
                            : null,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Packs",
                        style: GoogleFonts.lilitaOne(
                          fontSize: 18.sp,
                          color: selectedIndex == 1
                              ? Colors.white
                              : AppColors.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: selectedIndex == 0
                ? first_page(list: list)
                :  secondary_page(list: list2,),
          ),
        ],
      ),
    );
  }
}

class secondary_page extends StatelessWidget {
  var list;
   secondary_page({
     required this.list
    ,super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          width: 358.w,
          height: 146.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border(
              top: BorderSide(
                width: 2,
                color: AppColors.borderPrimary,
              ),
              right: BorderSide(
                width: 2,
                color: AppColors.borderPrimary,
              ),
              left: BorderSide(
                width: 2,
                color: AppColors.borderPrimary,
              ),
              bottom: BorderSide(
                width: 4,
                color: AppColors.borderPrimary,
              ),
            ),
            color: AppColors.surfacePrimary,
          ),
          child: Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(list[index].image,fit: BoxFit.contain,),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].title,
                        style: GoogleFonts.lilitaOne(
                          fontSize: 18.sp,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 3.5.h),
                      Text(
                        list[index].subtitle,
                        style: GoogleFonts.lilitaOne(
                          fontSize: 14.sp,
                          color: AppColors.textSecondary,
                        ),
                      ),
                      SizedBox(height: 11.h),
                      buttun(

                        color: AppColors.surfaceSecondary,
                        txcolor: AppColors.textPrimary,
                        text: list[index].price,
                        onTab: () {},
                        height: 38.h,
                        width: 64.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class first_page extends StatelessWidget {
  const first_page({
    super.key,
    required this.list,
  });

  final List<StoreIteam> list;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 12.h,
      ),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 173 / 210,
      ),
      itemBuilder: (context, index) {
        var item = list[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.surfacePrimary,
            borderRadius: BorderRadius.circular(12.r),
            border: Border(
              top: BorderSide(
                color: AppColors.borderSecondary,
                width: 2.w,
              ),
              right: BorderSide(
                color: AppColors.borderSecondary,
                width: 2.w,
              ),
              left: BorderSide(
                color: AppColors.borderSecondary,
                width: 2.w,
              ),
              bottom: BorderSide(
                color: AppColors.borderSecondary,
                width: 4.w,
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                SizedBox(
                  width: 149.w,
                  height: 100.h,
                  child: Image.asset(
                    "assets/coins/img.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 62.h,
                  width: 149.w,
                  child: Text(
                    "${item.piceCoion.toString()} Coins",
                    style: GoogleFonts.lilitaOne(
                      fontSize: 20.sp,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                buttun(
                  color: AppColors.surfaceSecondary,
                  txcolor: AppColors.textPrimary,
                  text: "\$${item.price}",
                  onTab: () {},
                  height: 38.h,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}