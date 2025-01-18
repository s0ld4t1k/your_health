import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:test_fl_chart/app/data/model/home.dart';
import 'package:test_fl_chart/app/screen/home/state.dart';

class HomeController extends GetxController {
  HomeState st = HomeState();
  @override
  void onInit() {
    get();
    super.onInit();
  }

  void get() async {
    st.isload = true;
    update();
    try {
      String url = 'http://158.160.30.46:8080/health_mock';
      var res = await Dio().get(url);
      st.home = HomeModel.fromJson(res.data);
    } catch (e) {
      debugPrint('-home- $e');
    }
    st.isload = false;
    update();
  }
}
