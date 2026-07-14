import 'dart:ui';

class LearanModel {
  String subtitle;
  double percent;
  Color color;
  Color bgcolor;
  bool locked;

  LearanModel({
    required  this.subtitle,
    required  this.percent,
    required  this.color,
    required  this.bgcolor,
    required  this.locked
  });
}
class LearanModel2 {
  bool theend;      // lesson tugallanganmi (yulduz uchun)
  bool isUnlocked;  // lesson ochiqmi (qulf uchun)

  LearanModel2({
    required this.theend,
    required this.isUnlocked,
  });
}