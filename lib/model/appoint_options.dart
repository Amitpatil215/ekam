class AppointmentOption {
  List<String>? duration;
  List<String>? package;

  AppointmentOption({this.duration, this.package});

  AppointmentOption.fromJson(Map<String, dynamic> json) {
    duration = json['duration'].cast<String>();
    package = json['package'].cast<String>();
  }
}
