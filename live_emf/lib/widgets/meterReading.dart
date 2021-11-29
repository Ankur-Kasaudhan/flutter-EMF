// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:live_emf/models/magnitudeProvider.dart';
import 'package:live_emf/utils/color.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MeterReading extends StatefulWidget {
  const MeterReading({Key? key}) : super(key: key);

  @override
  _MeterReadingState createState() => _MeterReadingState();
}

class _MeterReadingState extends State<MeterReading> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Consumer<MagnitudeProvider>(
          builder: (context, model, child) => SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 1000,
                labelOffset: 20,
                tickOffset: 20,
                ranges: <GaugeRange>[
                  GaugeRange(
                    startValue: 0,
                    endValue: 200,
                    color: AppColors.green,
                    label: 'SAFE',
                    startWidth: 25,
                    endWidth: 25,
                    // ignore: prefer_const_constructors
                    labelStyle: GaugeTextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  GaugeRange(
                    startValue: 200,
                    endValue: 500,
                    color: AppColors.orange,
                    label: 'MODERATE',
                    startWidth: 25,
                    endWidth: 25,
                    // ignore: prefer_const_constructors
                    labelStyle: GaugeTextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  GaugeRange(
                    startValue: 500,
                    endValue: 1000,
                    color: AppColors.red,
                    label: 'DANGER',
                    startWidth: 25,
                    endWidth: 25,
                    // ignore: prefer_const_constructors
                    labelStyle: GaugeTextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(value: model.magnitude)
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                          child: Text(model.magnitude.toStringAsFixed(2),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold))),
                      angle: 90,
                      positionFactor: 0.5)
                ])
          ]),
        ),
      ],
    );
  }
}
