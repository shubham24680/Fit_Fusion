import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fit_fusion/component.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController _searchControllor;
  List<String> title = ["Steps Taken", "Hydration"];

  @override
  void initState() {
    super.initState();
    _searchControllor = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 275,
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 60, bottom: 10),
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
                          const Svgs(
                              image: 'assets/icons/calendar.svg', size: 20),
                          const SizedBox(width: 5),
                          Niramit(
                            text: "WED, 28 AUGUST 2024",
                            weight: FontWeight.bold,
                            color: black,
                          ),
                        ],
                      ),
                      CIconButton(
                        image: 'assets/icons/notification.svg',
                        color: black,
                        higlightColor: black.withOpacity(0.1),
                        onPressed: () {},
                        // Navigator.pushNamed(context, 'notifications'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset('assets/pictures/users_pic.jpg',
                            width: 80),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Niramit(text: "Welcome back,", color: black),
                          Saira(text: "Shubham patel", size: 24, color: black),
                        ],
                      )
                    ],
                  ),
                  TextEditor(
                    controller: _searchControllor,
                    hintText: 'Search anything...',
                    borderRadius: 30,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Svgs(
                          image: 'assets/icons/search.svg',
                          color: white,
                          size: 20),
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
          ],
        ),
      ),
    );
  }
}
