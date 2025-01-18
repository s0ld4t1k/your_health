import 'package:flutter/material.dart';
import 'package:test_fl_chart/app/data/color.dart';

class HomeAlert extends StatelessWidget {
  final String msg;
  final bool isResubmit;
  const HomeAlert({super.key, required this.msg, required this.isResubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration:
          BoxDecoration(color: conGrey, borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            msg,
            style: TextStyle(color: textGrey),
          ),
          const SizedBox(height: 12),
          if (isResubmit)
            TextButton(
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Resubmit requested')));
              },
              child: Text(
                'Resubmit the markers',
                style: TextStyle(color: textBlue),
              ),
            )
        ],
      ),
    );
  }
}
