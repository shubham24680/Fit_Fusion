import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'package:fit_fusion/component.dart';
import 'package:fit_fusion/save_data.dart';
import 'package:fit_fusion/classes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String now = DateFormat('EEE, dd MMMM yyyy').format(DateTime.now());
  DocumentSnapshot? doc;
  int rowItem = 2;
  double ratio = 0.75;
  late TextEditingController _searchControllor;

  @override
  void initState() {
    super.initState();
    _searchControllor = TextEditingController();
    _getData();
  }

  _getData() async {
    FirestoreServices services = FirestoreServices();
    DocumentSnapshot data = await services.getUserData();
    setState(() {
      doc = data;
    });
  }

  @override
  void dispose() {
    _searchControllor = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile
              Container(
                height: 275,
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            // Calander
                            const Svgs(
                                image: 'assets/icons/calendar.svg', size: 20),
                            const SizedBox(width: 5),

                            // Date
                            Niramit(
                              text: now,
                              weight: FontWeight.bold,
                              color: black,
                            ),
                          ],
                        ),

                        // Notification
                        // CIconButton(
                        //   image: 'assets/icons/notification.svg',
                        //   color: black,
                        //   higlightColor: black.withOpacity(0.1),
                        //   onPressed: () =>
                        //       Navigator.pushNamed(context, 'notifications'),
                        // ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Settings
                        Photo(
                            route: 'settings', text: doc?['name'][0] ?? "..."),
                        const SizedBox(width: 10),

                        // Name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Niramit(text: "Welcome back,", color: black),
                            Saira(
                              text: doc?['name'] ?? "...",
                              size: 24,
                              color: black,
                            ),
                          ],
                        )
                      ],
                    ),

                    // Search
                    TextEditor(
                      controller: _searchControllor,
                      hintText: 'Search anything...',
                      borderRadius: 30,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Svgs(
                          image: 'assets/icons/search.svg',
                          color: white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.all(20),
                child: Niramit(
                    text: "Health Insights", size: 20, weight: FontWeight.bold),
              ),

              // Health Insights tiles
              SizedBox(
                height: ((size.width / rowItem) - 15) *
                    (insights.length / rowItem).ceil() *
                    (1 / ratio),
                child: GridView.builder(
                  itemCount: insights.length,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: ratio,
                  ),
                  itemBuilder: (context, index) => GestureDetector(
                    // Route
                    onTap: () =>
                        Navigator.pushNamed(context, insights[index].route),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: black,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Title
                                  Niramit(
                                    text: insights[index].title,
                                    size: 16,
                                    weight: FontWeight.w500,
                                  ),

                                  // Icons
                                  Svgs(
                                    image: insights[index].icon,
                                    size: 20,
                                    color: yellow,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Wrap(
                                crossAxisAlignment: WrapCrossAlignment.end,
                                children: [
                                  // Value
                                  Niramit(
                                    text: insights[index].value,
                                    weight: FontWeight.bold,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),

                                  Niramit(text: insights[index].unit),
                                ],
                              ),
                            ],
                          ),

                          // Image
                          SvgPicture.asset(
                            insights[index].image,
                            width: (size.width / rowItem) - 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
