import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fit_fusion/component.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int rowItem = 2;
  double ratio = 0.75;
  late TextEditingController _searchControllor;
  List<String> title = ["Steps Taken", "Hydration"];
  Map<String, Map<String, String>> habits = {
    "Steps Taken": {
      'route': 'steps',
      'icon': 'assets/icons/steps.svg',
      'count': "1,532",
      'unit': "total",
      'image': 'assets/pictures/bar_graph.svg',
    },
    "Hydration": {
      'route': 'hydration',
      'icon': 'assets/icons/water drop.svg',
      'count': "1,500",
      'unit': "ml",
      'image': 'assets/pictures/water.svg',
    },
  };

  @override
  void initState() {
    super.initState();
    _searchControllor = TextEditingController();
  }

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
                        onPressed: () =>
                            Navigator.pushNamed(context, 'notifications'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, 'settings'),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset('assets/pictures/users_pic.jpg',
                              width: 80),
                        ),
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
            SizedBox(
              height: ((size.width / rowItem) - 20) *
                  (title.length / rowItem).ceil() *
                  (1 / ratio),
              child: GridView.builder(
                itemCount: title.length,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: ratio,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, habits[title[index]]!['route']!),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Niramit(
                                  text: title[index],
                                  size: 16,
                                  weight: FontWeight.w500,
                                ),
                                Svgs(
                                  image: habits[title[index]]!['icon']!,
                                  size: 20,
                                  color: yellow,
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.end,
                              children: [
                                Niramit(
                                  text: habits[title[index]]!['count']!,
                                  weight: FontWeight.bold,
                                  size: 20,
                                ),
                                const SizedBox(width: 5),
                                Niramit(text: habits[title[index]]!['unit']!),
                              ],
                            ),
                          ],
                        ),
                        SvgPicture.asset(habits[title[index]]!['image']!,
                            width: (size.width / rowItem) - 50),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
