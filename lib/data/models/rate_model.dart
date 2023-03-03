class RateModel {
  String timestamp;
  List<RateDetail> rates;

  RateModel({required this.timestamp, required this.rates});
}

class RateDetail {
  String name;
  String rate;
  RateDetail({required this.name, required this.rate});
}
