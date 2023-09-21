import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppointmentsViewModel extends ChangeNotifier {
  String? _selectedDate;
  String? _selectedTime;
  final List<String> _timeSlots = [];

  //getter
  String? get selectedDate => _selectedDate;
  String? get selectedTime => _selectedTime;
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

  void setSelectedTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }

  String convertRangeToStartTime(String timeRange) {
    List<String> times = timeRange.split(' - ');
    if (times.length > 1) {
      return times[0];
    } else {
      throw FormatException(
          'Input should be in the format: "Start Time - End Time"');
    }
  }
}
