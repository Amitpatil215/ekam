import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ekam/model/doctor.dart';
import 'package:ekam/network/requests/network_request.dart';
import 'package:flutter/foundation.dart';

/// This class is used to store the state of the DocDetails screen
class DocDetailsViewModel extends ChangeNotifier {
  /// List of doctors
  /// This list is used to store the list of doctors fetched from the remote server
  final List<Doctor> _doctorsList = [];

  //getter
  List<Doctor> get doctorsList => _doctorsList;

  /// This method is used to get the doctors from the remote server
  /// [isRefreshCache] is used to refresh the cache
  /// Returns true if the doctors are fetched successfully
  Future<bool> getDoctors({bool isRefreshCache = false}) async {
    if (_doctorsList.isNotEmpty && !isRefreshCache) {
      return true;
    }
    try {
      Response response = await RequestClient().getDoctorsRequest();
      if (response.statusCode == 200) {
        _doctorsList.clear();
        response.data.forEach((json) {
          Doctor client = Doctor.fromJson(json);
          _doctorsList.add(client);
        });
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

  /// get doctor by Doctor Name
  /// [docName] is the name of the doctor
  /// Returns the doctor object
  Doctor getDoctorByName(String docName) {
    return _doctorsList.firstWhere((element) => element.doctorName == docName);
  }
}
