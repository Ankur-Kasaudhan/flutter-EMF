// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:live_emf/pages/visuals.dart';
import 'package:live_emf/utils/color.dart';
import 'package:live_emf/widgets/mainReading.dart';
import 'package:live_emf/widgets/meterReading.dart';
import 'package:live_emf/widgets/xyzReading.dart';
import 'package:provider/provider.dart';

import 'models/magnitudeProvider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const MainReading(),
              const XYZReading(),
              const MeterReading(),
              Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: const BorderSide(color: Colors.white))),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const Visuals()));
                    },
                    child: const Text('Visualize')),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<MagnitudeProvider>(
                builder: (context, model, child) => Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                  side: const BorderSide(color: Colors.white))),
                          backgroundColor: MaterialStateProperty.all(
                              AppColors.primaryColor)),
                      onPressed: () {
                        model.changeValues();
                      },
                      child: const Text('Start')),
                ),
              ),

              // StartButton()
            ],
          ),
        ),
      ),
    );
  }
}
