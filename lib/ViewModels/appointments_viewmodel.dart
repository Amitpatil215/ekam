import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ekam/model/appoint_options.dart';
import 'package:ekam/model/doctor.dart';
import 'package:ekam/network/requests/network_request.dart';
import 'package:flutter/foundation.dart';

/// This class is used to store the state of the appointments screen
class AppointmentsViewModel extends ChangeNotifier {
  /// Selected doctor for the appointment
  Doctor? _selectedDoctor;

  /// Selected date for the appointment
  String? _selectedDate;

  /// Selected time for the appointment
  String? _selectedTime;

  /// Selected duration for the appointment
  String? _selectedDuration;

  /// Selected package for the appointment
  String? _selectedPackage;

  /// List of time slots for the selected date
  final List<String> _timeSlots = [];

  //getter
  Doctor? get selectedDoctor => _selectedDoctor;
  String? get selectedDate => _selectedDate;
  String? get selectedTime => _selectedTime;
  String? get selectedDuration => _selectedDuration;
  String? get selectedPackage => _selectedPackage;
  List<String> get timeSlots => _timeSlots;

  //setter
  /// Sets the selected date and corresponding time slots
  /// [date] is the selected date
  /// [timeSlots] is the list of time slots for the selected date
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

  /// Converts the time range to start time
  /// [timeRange] is the time range
  /// returns the start time
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

  /// Gets the appointment options
  /// [isRefreshCache] is used to refresh the cache
  /// returns true if the request is successful
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
