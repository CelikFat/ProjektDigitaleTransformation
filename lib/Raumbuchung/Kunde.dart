import 'package:shared_preferences/shared_preferences.dart';

class Kunde {
  static Future<void> saveData(String room, DateTime selectedDay,
      String timeSlot, String name, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('room', room);
    await prefs.setString('selectedDay', selectedDay.toIso8601String());
    await prefs.setString('timeSlot', timeSlot);
    await prefs.setString('name', name);
    await prefs.setString('email', email);
  }

  static Future<Map<String, dynamic>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'room': prefs.getString('room'),
      'selectedDay': prefs.getString('selectedDay'),
      'timeSlot': prefs.getString('timeSlot'),
      'name': prefs.getString('name'),
      'email': prefs.getString('email'),
    };
  }
}
