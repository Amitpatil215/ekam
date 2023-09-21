import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ekam/model/appoint_options.dart';
import 'package:ekam/model/booking.dart';
import 'package:ekam/network/requests/network_request.dart';
import 'package:flutter/foundation.dart';

class BookingsViewModel extends ChangeNotifier {
  List<Booking> _bookingsList = [];

  //getter
  List<Booking> get bookingsList => _bookingsList;

  Future<bool> getBookingsFromRemote({bool isRefreshCache = false}) async {
    if (_bookingsList.isNotEmpty && !isRefreshCache) {
      return true;
    }
    try {
      Response response = await RequestClient().getBookingRequest();
      if (response.statusCode == 200) {
        _bookingsList.clear();
        response.data.forEach((json) {
          Booking booking = Booking.fromJson(json);
          _bookingsList.add(booking);
        });
        notifyListeners();
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
    return false;
  }
}
