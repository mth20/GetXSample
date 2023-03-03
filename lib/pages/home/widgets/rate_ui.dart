import 'package:mm_ex_rate/data/models/rate_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RateUI extends StatelessWidget {
  final RateModel rate;
  const RateUI({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Text(DateFormat.yMMMMEEEEd().format(
            DateTime.fromMillisecondsSinceEpoch(
              int.parse(rate.timestamp) * 1000,
            ),
          )),
          ...List.generate(
            rate.rates.length,
            (idx) => ListTile(
              onTap: () {},
              title: Text(rate.rates[idx].name),
              subtitle: Text(rate.rates[idx].rate),
            ),
          )
        ],
      ),
    );
  }
}
