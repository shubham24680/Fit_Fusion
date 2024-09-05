import 'package:flutter/material.dart';
import 'package:fit_fusion/component.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int rowItem = 2;
  double ratio = 1.75;
  List<String> options = [
    "Account settings",
    "Terms and conditions",
    "Rate the app",
    "Help",
    "Logout"
  ];
  Map<String, Map<String, String>> details = {
    "Account settings": {
      'route': '',
      'icon': 'assets/icons/user.svg',
    },
    "Terms and conditions": {
      'route': '',
      'icon': 'assets/icons/document.svg',
    },
    "Rate the app": {
      'route': '',
      'icon': 'assets/icons/rate.svg',
    },
    "Help": {
      'route': '',
      'icon': 'assets/icons/help.svg',
    },
    "Logout": {
      'route': '',
      'icon': 'assets/icons/logout.svg',
    },
  };

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 275,
              width: size.width,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 40, bottom: 10),
              decoration: BoxDecoration(
                color: yellow,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset('assets/pictures/users_pic.jpg',
                        width: 100),
                  ),
                  const SizedBox(height: 10),
                  Saira(text: "Shubham patel", size: 24, color: black),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20),
              child:
                  Niramit(text: "Settings", size: 20, weight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 5),
              decoration: BoxDecoration(
                color: black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: List.generate(
                  options.length,
                  (index) => Column(
                    children: [
                      if (index != 0) Divider(color: grey),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Svgs(
                                  image: details[options[index]]!['icon']!,
                                  color: yellow,
                                  size: 20,
                                ),
                                const SizedBox(width: 10),
                                Niramit(
                                  text: options[index],
                                  weight: FontWeight.w500,
                                  size: 16,
                                ),
                              ],
                            ),
                            Svgs(
                              image: 'assets/icons/right.svg',
                              color: grey,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
