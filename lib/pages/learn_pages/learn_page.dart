import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_kids/colors/colors.dart';

import '../../models/learan_model.dart';
import 'learn2_page.dart';

class LearnPage extends StatefulWidget {
  const LearnPage({super.key});

  @override
  State<LearnPage> createState() => _LearnPageState();
}

class _LearnPageState extends State<LearnPage> {

  final List<LearanModel> _list = [
    LearanModel(
        subtitle: "Completed 10 of 10 lessons",
        percent: 0.5,
        color:AppColors.successContent,
        locked: false,
        bgcolor: AppColors.successLight),
    LearanModel(
        subtitle: "Completed 10 of 10 lessons",
        percent: 0.3,
        color: AppColors.brandContent,
        locked: false,
        bgcolor: AppColors.brandLight),
    LearanModel(
        subtitle: "Completed 10 of 10 lessons",
        percent: 0.5,
        color: Colors.lime,
        locked: true,
        bgcolor: AppColors.limeLight),
    LearanModel(
        subtitle: "Completed 10 of 10 lessons",
        percent: 0.7,
        color: AppColors.orangeContent,
        locked: false,
        bgcolor: AppColors.orangeLight),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgLight,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24.r),
              bottomRight: Radius.circular(24.r),
            ),
            child: AppBar(
              centerTitle: true,
              title: Text(
                  'Learn',
                  style: GoogleFonts.lilitaOne(
                    fontSize: 24.sp,
                    color: AppColors.textPrimary,
                  ),
              ),
              backgroundColor: Colors.white,
              elevation: 0,
              scrolledUnderElevation: 0,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:  16.r),
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index){
            var item = _list[index];
            return
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Learn2Page(modulNumber: index,)));
                },
                child: Container(
                  margin: .only(
                    top: 16.h
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.surfacePrimary,
                      borderRadius: .circular(16.r),
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
                      )
                  ),
                  padding: .symmetric(horizontal: 16.w, vertical: 12.h),
                  width: 358.w,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: .start,
                            mainAxisSize: .min,
                            children: [
                              Text("Module ${index+1}",style: GoogleFonts.lilitaOne(
                                fontSize: 20.sp,
                                color: AppColors.textPrimary,
                              )),
                              Text(item.subtitle,style: TextStyle(
                                  fontSize: 14.sp,
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.textSecondary
                              ),),
                              SizedBox(
                                height: 16.h,
                              ),

                            ],
                          ),
                          Spacer(),
                          item.locked ? Image.asset("assets/learn/img_4.png") : SizedBox()
                        ],
                      ),
                      item.locked ? SizedBox(): Container(
                        height: 16.h,
                        decoration: BoxDecoration(
                            borderRadius: .circular(8.r)

                        ),
                        child: LinearProgressIndicator(
                          borderRadius: .circular(8.r),
                          value: item.percent,
                          backgroundColor: item.bgcolor,
                          color: item.color,
                          minHeight: 8.h,
                        ),
                      ),
                      SizedBox(height: 3.h,)
                    ],
                  ),
                ),
              );}
        ),
      ),
    );
  }
}