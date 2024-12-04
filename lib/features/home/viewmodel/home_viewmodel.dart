import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wiet_case_project/core/network/network_service.dart';
import 'package:wiet_case_project/features/home/dto/cat_tier_model.dart';

class HomeViewModel extends ChangeNotifier {
  final NetworkService networkService = NetworkService(dio: Dio());

  CatTierModel? catTierData;
  void init() async {
    await fetchData();
  }

  Future<void> fetchData() async {
    catTierData = await networkService.get<CatTierModel>(
      "https://portal.wietmobile.com:8443/api/test/data",
      (json) => CatTierModel.fromJson(json),
    );
    notifyListeners();
  }
}
