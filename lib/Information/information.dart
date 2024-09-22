import 'dart:async';

import 'package:fit_fusion/save_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:fit_fusion/component.dart';

import 'package:fit_fusion/Information/fitness.dart';
import 'package:fit_fusion/Information/gender.dart';
import 'package:fit_fusion/Information/goals.dart';
import 'package:fit_fusion/Information/height.dart';
import 'package:fit_fusion/Information/weight.dart';

class Information extends StatefulWidget {
  const Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  int _selected = 0;
  bool _canPop = true;
  bool _loading = false;
  bool _nameLength = false;
  late TextEditingController _nameControllor;
  var _value = "";
  List<String> _goals = [];

  @override
  void initState() {
    super.initState();
    _nameControllor = TextEditingController();
  }

  body() {
    switch (_selected) {
      case 1:
        return Fitness(
          onChoice: (value) {
            _value = value;
          },
        );
      case 2:
        return Goal(
          onChoice: (value) {
            _goals = value;
          },
        );
      case 3:
        return Gender(
          onChoice: (value) {
            _value = value;
          },
        );
      case 4:
        return Height(
          onChoice: (value) {
            _value = value;
          },
        );
      case 5:
        return Weight(
          onChoice: (value) {
            _value = value;
          },
        );
    }
  }

  saveData() async {
    FirestoreServices firestoreServices = FirestoreServices();
    switch (_selected) {
      case 0:
        await firestoreServices.saveUserData({'name': _nameControllor.text});
        break;
      case 1:
        await firestoreServices.saveUserData({'fitness': _value});
        break;
      case 2:
        await firestoreServices.saveUserData({'goals': _goals});
        break;
      case 3:
        await firestoreServices.saveUserData({'gender': _value});
        break;
      case 4:
        await firestoreServices.saveUserData({'height': _value});
        break;
      case 5:
        await firestoreServices.saveUserData({
          'weight': _value,
          'profileCompleted': true,
        });
        break;
    }

    if (_selected != 5) {
      setState(() {
        _selected += 1;
        _canPop = false;
      });
    } else {
      setState(() {
        _loading = true;
      });
      Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacementNamed(context, 'home'),
      );
      setState(() {
        _loading = false;
      });
    }
  }

  handleBack() {
    setState(() {
      if (_selected == 1) {
        _canPop = true;
      }
      if (_selected != 0) {
        _selected -= 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Back button
    return PopScope(
      canPop: _canPop,
      onPopInvoked: (didPop) => handleBack(),
      child: Scaffold(
        // Consist of Liner indicator and steps.
        appBar: AppBar(
          backgroundColor: background,
          surfaceTintColor: background,
          automaticallyImplyLeading: false,
          leading: _selected != 0
              ? CIconButton(
                  image: 'assets/icons/left.svg',
                  onPressed: () => handleBack(),
                  color: white,
                )
              : const SizedBox(),
          title: Column(
            children: [
              LinearPercentIndicator(
                alignment: MainAxisAlignment.center,
                padding: const EdgeInsets.all(0),
                barRadius: const Radius.circular(15),
                backgroundColor: yellow.withOpacity(0.3),
                progressColor: yellow,
                lineHeight: 8,
                width: 120,
                percent: _selected * 0.2,
              ),
              const SizedBox(height: 10),
              Niramit(text: "Step ${_selected + 1}/6"),
            ],
          ),
          actions: const [
            SizedBox(width: 60),
          ],
        ),

        body: (_selected == 0)
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Name
                    const Align(
                      child: Saira(text: "What is your name?", size: 24),
                    ),

                    // Center Image
                    Expanded(
                      child: SvgPicture.asset('assets/pictures/yoga.svg'),
                    ),

                    // Name Text Editor
                    TextEditor(
                      controller: _nameControllor,
                      hintText: "Name",
                      onChanged: (value) {
                        setState(() {
                          _nameLength = value.isNotEmpty;
                        });
                      },
                    ),
                  ],
                ),
              )
            : body(),

        // Next button
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: ((_selected == 0 && _nameLength) || _selected > 0)
                ? () => saveData()
                : null,
            style: ElevatedButton.styleFrom(
                backgroundColor: yellow,
                foregroundColor: black,
                minimumSize: const Size.fromHeight(63),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
            child: _loading
                ? CircularProgressIndicator(color: yellow)
                : Saira(
                    text: (_selected == 5) ? "Finish" : "Next",
                    size: 20,
                    color: black,
                  ),
          ),
        ),
      ),
    );
  }
}
