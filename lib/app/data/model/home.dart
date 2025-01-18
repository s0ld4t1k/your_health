class HomeModel {
  HomeModel({
    this.alerts,
    this.dynamics,
  });

  final List<Alert>? alerts;
  final List<Dynamic>? dynamics;

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      alerts: json["alerts"] == null
          ? []
          : List<Alert>.from(json["alerts"]!.map((x) => Alert.fromJson(x))),
      dynamics: json["dynamics"] == null
          ? []
          : List<Dynamic>.from(
              json["dynamics"]!.map((x) => Dynamic.fromJson(x))),
    );
  }
}

class Alert {
  Alert({
    required this.message,
    required this.resubmitLink,
  });

  final String? message;
  final bool? resubmitLink;

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      message: json["message"],
      resubmitLink: json["resubmitLink"],
    );
  }
}

class Dynamic {
  Dynamic({
    required this.date,
    required this.lab,
    required this.value,
  });

  final DateTime? date;
  final String? lab;
  final double? value;

  factory Dynamic.fromJson(Map<String, dynamic> json) {
    return Dynamic(
      date: DateTime.tryParse(json["date"] ?? ""),
      lab: json["lab"],
      value: json["value"],
    );
  }
}
