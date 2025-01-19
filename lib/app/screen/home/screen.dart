import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fl_chart/app/data/color.dart';
import 'package:test_fl_chart/app/screen/home/controller.dart';
import 'package:test_fl_chart/app/screen/home/widget/alert.dart';
import 'package:test_fl_chart/app/screen/home/widget/chart.dart';
import 'package:test_fl_chart/app/screen/home/widget/data_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (hc) {
          return RefreshIndicator(
            onRefresh: () async => hc.get(),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              body: hc.st.isload
                  ? const Center(child: CircularProgressIndicator.adaptive())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Dynamics',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'All Period',
                            style: TextStyle(fontSize: 16, color: textGrey),
                          ),
                          const SizedBox(height: 5),
                          HomeChart(hc: hc),
                          const SizedBox(height: 20),
                          if (hc.st.home.alerts != null)
                            HomeAlert(
                              msg: hc.st.home.alerts?[0].message ?? '',
                              isResubmit:
                                  hc.st.home.alerts?[0].resubmitLink ?? false,
                            ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Дата',
                                style: TextStyle(fontSize: 12, color: textGrey),
                              ),
                              const Spacer(),
                              Text(
                                'ME/мл',
                                style: TextStyle(fontSize: 12, color: textGrey),
                              ),
                            ],
                          ),
                          const Divider(),
                          ListView.separated(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                HomeDataItem(index: index, hc: hc),
                            separatorBuilder: (context, index) =>
                                const Divider(),
                            itemCount: hc.st.home.dynamics?.length ?? 0,
                          )
                        ],
                      ),
                    ),
            ),
          );
        });
  }
}
