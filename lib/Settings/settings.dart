// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fit_fusion/classes.dart';
// import 'package:fit_fusion/save_data.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:fit_fusion/component.dart';
import 'package:hive/hive.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var userBox = Hive.box('user');
  late String _name;

  @override
  void initState() {
    super.initState();
    _name = userBox.get('name', defaultValue: '...');

    // _getData();
  }

  // _getData() async {
  //   FirestoreServices services = FirestoreServices();
  //   DocumentSnapshot data = await services.getUserData();
  //   setState(() {
  //     doc = data;
  //   });
  // }

  // logout() {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       backgroundColor: black,
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),

  //       // title
  //       titlePadding:
  //           const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 10),
  //       title: const Niramit(
  //         text: "Logout",
  //         size: 20,
  //         weight: FontWeight.bold,
  //       ),

  //       // content
  //       contentPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
  //       content: const Niramit(
  //         text: "Are you sure, do you want to logout?",
  //         weight: FontWeight.w500,
  //         size: 16,
  //       ),

  //       // action (buttons)
  //       buttonPadding: const EdgeInsets.all(50),
  //       actions: [
  //         GestureDetector(
  //           onTap: () => Navigator.pop(context),
  //           child: alertChild("No"),
  //         ),
  //         GestureDetector(
  //           onTap: () {
  //             FirebaseAuth.instance.signOut();
  //             Navigator.pushNamedAndRemoveUntil(
  //                 context, 'onboarding', (_) => false);
  //           },
  //           child: alertChild("Yes"),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // alertChild(String value) {
  //   return Niramit(text: value, weight: FontWeight.bold, color: yellow);
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
                    // Profile
                    Photo(route: '', text: _name[0].toUpperCase()),
                    const SizedBox(height: 10),
                    Saira(text: _name, size: 24, color: black),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(20),
                child: Niramit(
                    text: "Settings", size: 20, weight: FontWeight.bold),
              ),

              // Settings tiles
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: List.generate(
                    titles.length,
                    (index) => GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.pushNamed(context, 'accountSettings');
                        } else if (index == 1) {
                          Navigator.pushNamed(context, 'termsAndConditions');
                        } else if (index == 2) {
                          Navigator.pushNamed(context, 'help');
                        } else if (index == 3) {
                          moveTo('mailto:fitfusion622@gmail.com');
                        } else if (index == 4) {
                          moveTo('https://github.com/shubham24680/Fit_Fusion');
                        } 
                        // else if (index == 5) {
                        //   logout();
                        // }
                      },
                      child: Column(
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
                                    // Icon
                                    Svgs(
                                      image: titles[index].icon,
                                      color: yellow,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 10),

                                    // Setting Title
                                    Niramit(
                                      text: titles[index].title,
                                      weight: FontWeight.w500,
                                      size: 16,
                                    ),
                                  ],
                                ),

                                // Right arrow
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
