import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class AppointmentsViewModel extends ChangeNotifier {
  // Future<bool> getClients({bool isRefreshCache = false}) async {
  //   if (_clientsList.isNotEmpty && !isRefreshCache) {
  //     return true;
  //   }
  //   try {
  //     Response response = await ConstantsRequestClient().getClientsRequest();
  //     if (response.statusCode == 200) {
  //       _clientsList.clear();
  //       response.data.forEach((json) {
  //         ClientsModel client = ClientsModel.fromJson(json);
  //         _clientsList.add(client);
  //       });
  //       notifyListeners();
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return false;
  //   }
  // }
}
