import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ekam/model/booking.dart';
import 'package:ekam/network/requests/network_request.dart';
import 'package:flutter/foundation.dart';

/// This class is used to store the state of the Bookings screen
class BookingsViewModel extends ChangeNotifier {
  /// List of bookings
  List<Booking> _bookingsList = [];

  //getter
  List<Booking> get bookingsList => _bookingsList;

  /// This method is used to get the bookings from the remote server
  /// [isRefreshCache] is used to refresh the cache
  /// Returns true if the bookings are fetched successfully
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

  /// This method is used to add a new booking to the list
  /// [booking] is the new booking
  void addNewBooking(Booking booking) async {
    List<Booking> tempBookingList = [..._bookingsList];
    _bookingsList.clear();
    _bookingsList = [booking, ...tempBookingList];
  }
}
