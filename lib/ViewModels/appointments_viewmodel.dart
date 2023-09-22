import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ekam/model/appoint_options.dart';
import 'package:ekam/model/doctor.dart';
import 'package:ekam/network/requests/network_request.dart';
import 'package:flutter/foundation.dart';

class AppointmentsViewModel extends ChangeNotifier {
  Doctor? _selectedDoctor;
  String? _selectedDate;
  String? _selectedTime;
  String? _selectedDuration;
  String? _selectedPackage;
  final List<String> _timeSlots = [];

  //getter
  Doctor? get selectedDoctor => _selectedDoctor;
  String? get selectedDate => _selectedDate;
  String? get selectedTime => _selectedTime;
  String? get selectedDuration => _selectedDuration;
  String? get selectedPackage => _selectedPackage;
  List<String> get timeSlots => _timeSlots;

  //setter
  void setSelectedDateAndCurrspondingTime(
      String date, List<dynamic>? timeSlots) {
    _timeSlots.clear();
    _selectedDate = date;
    timeSlots?.forEach((slot) {
      _timeSlots.add(convertRangeToStartTime(slot));
    });

    notifyListeners();
  }

  void setSelectedTime(String? time) {
    _selectedTime = time;
    notifyListeners();
  }

  void setSelectedDoctor(Doctor doctor) {
    _selectedDoctor = doctor;
    notifyListeners();
  }

  void setSelectedDuration(String? duration) {
    _selectedDuration = duration;
    notifyListeners();
  }

  void setSelectedPackage(String? package) {
    _selectedPackage = package;
    notifyListeners();
  }

  //reset package and duration
  void resetPackageAndDuration() {
    _selectedPackage = null;
    _selectedDuration = null;
  }

  //reset time and date
  void resetTimeAndDate() {
    _selectedTime = null;
    _selectedDate = null;
    _timeSlots.clear();
  }

  String convertRangeToStartTime(String timeRange) {
    List<String> times = timeRange.split(' - ');
    if (times.length > 1) {
      return times[0];
    } else {
      return timeRange;
    }
  }

  AppointmentOption? _appointmentOption;
  //getter
  AppointmentOption? get appointmentOption => _appointmentOption;

  Future<bool> getAppointmentOptions({bool isRefreshCache = false}) async {
    if (_appointmentOption != null && !isRefreshCache) {
      return true;
    }
    try {
      Response response = await RequestClient().getPackageRequest();
      if (response.statusCode == 200) {
        _appointmentOption = AppointmentOption.fromJson(response.data);
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
