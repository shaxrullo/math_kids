import 'package:supabase_flutter/supabase_flutter.dart';

class StreakService {
  final supabase = Supabase.instance.client;

  Future<Map<String, dynamic>> loadStreak() async {
    final user = supabase.auth.currentUser;

    if (user == null) {
      throw Exception("User topilmadi");
    }

    final today = DateTime.now();
    final todayString = today.toIso8601String().split("T").first;

    /// users jadvalidan olish
    final userData = await supabase
        .from("users")
        .select()
        .eq("id", user.id)
        .single();

    int streak = userData["streak"] ?? 0;

    DateTime? lastLogin;

    if (userData["last_login"] != null) {
      lastLogin = DateTime.parse(userData["last_login"]);
    }

    /// Agar birinchi marta kirayotgan bo'lsa
    if (lastLogin == null) {
      streak = 1;

      await supabase.from("users").update({
        "streak": streak,
        "last_login": todayString,
      }).eq("id", user.id);
    } else {
      final diff = today.difference(lastLogin).inDays;

      if (diff == 1) {
        streak++;

        await supabase.from("users").update({
          "streak": streak,
          "last_login": todayString,
        }).eq("id", user.id);
      }

      if (diff > 1) {
        streak = 1;

        await supabase.from("users").update({
          "streak": streak,
          "last_login": todayString,
        }).eq("id", user.id);
      }
    }

    /// user_activity ga bugungi sanani qo'shish

    final exist = await supabase
        .from("user_activity")
        .select()
        .eq("user_id", user.id)
        .eq("login_date", todayString);

    if (exist.isEmpty) {
      await supabase.from("user_activity").insert({
        "user_id": user.id,
        "login_date": todayString,
      });
    }

    /// activity olish

    final activity = await supabase
        .from("user_activity")
        .select("login_date")
        .eq("user_id", user.id);

    return {
      "streak": streak,
      "activity": activity,
    };
  }
}