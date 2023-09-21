import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ekam/model/doctor.dart';
import 'package:ekam/network/requests/doc_info_request.dart';
import 'package:flutter/foundation.dart';

class DocDetailsViewModel extends ChangeNotifier {
  List<Doctor> _doctorsList = [];

  //getter
  List<Doctor> get doctorsList => _doctorsList;

  Future<bool> getDoctors({bool isRefreshCache = false}) async {
    if (_doctorsList.isNotEmpty && !isRefreshCache) {
      return true;
    }
    try {
      Response response = await DocInfoRequestClient().getDoctorsRequest();
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

  // get doctor by Doctor Name
  Doctor getDoctorByName(String docName) {
    return _doctorsList.firstWhere((element) => element.doctorName == docName);
  }
}
