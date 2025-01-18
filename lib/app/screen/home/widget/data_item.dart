import 'package:flutter/material.dart';
import 'package:test_fl_chart/app/data/color.dart';
import 'package:test_fl_chart/app/screen/home/controller.dart';
import 'package:intl/intl.dart';

class HomeDataItem extends StatelessWidget {
  final HomeController hc;
  final int index;
  const HomeDataItem({super.key, required this.hc, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text(
            '${(DateFormat('dd MM').format(hc.st.home.dynamics?[index].date ?? DateTime.now())).split(' ')[0]} ${hc.st.months[int.tryParse((DateFormat('dd MM').format(hc.st.home.dynamics?[index].date ?? DateTime.now())).split(' ')[1]) ?? 0]}',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 11),
          Expanded(
            child: Text(
              hc.st.home.dynamics?[index].lab ?? '',
              style: TextStyle(color: textGrey),
            ),
          ),
          Text(
            '${(hc.st.home.dynamics?[index].value ?? 0.0)}',
            style: TextStyle(
              color: (hc.st.home.dynamics?[index].value ?? 0.0) >= 2.8
                  ? textGreen
                  : textOrange,
              fontSize: 28,
            ),
          )
        ],
      ),
    );
  }
}
