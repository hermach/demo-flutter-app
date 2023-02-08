import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time = '';
  String seconds = '';
  String flag;
  String url;
  bool isDayTime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try {
      final response = await http
          .get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
       isDayTime = (now.hour > 6 && now.hour < 20) ? true : false;
      time = DateFormat('HH:mm').format(now);
      seconds = DateFormat('ss').format(now);
    } catch (e) {
      isDayTime = false;
      time = 'could note show time this country';
    }
  }
}
