import 'package:mm_ex_rate/data/models/rate_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RateRepository {
  static var url = "https://forex.cbm.gov.mm/api/latest";
  static Future<RateModel?> getRates() async {
    http.Response resp = await http.get(Uri.parse(url));
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body);
      var timestamp = data['timestamp'];
      List<RateDetail> rates = (data['rates'] as Map<String, dynamic>)
          .entries
          .map((e) => RateDetail(name: e.key, rate: e.value))
          .toList();
      return RateModel(timestamp: timestamp, rates: rates);
    } else {
      return null;
    }
  }
}
