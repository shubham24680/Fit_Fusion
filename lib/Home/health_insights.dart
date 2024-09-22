class Health {
  final String title;
  final String icon;
  final String value;
  final String unit;
  final String image;
  final String route;

  Health({
    required this.title,
    required this.icon,
    required this.value,
    required this.unit,
    required this.image,
    required this.route,
  });
}

List<Health> insights = [
  Health(
    title: "Steps Taken",
    icon: 'assets/icons/steps.svg',
    value: "1,532",
    unit: "total",
    image: 'assets/pictures/bar_graph.svg',
    route: 'steps',
  ),
  Health(
    title: "Hydration",
    icon: 'assets/icons/water drop.svg',
    value: "1,500",
    unit: "ml",
    image: 'assets/pictures/water.svg',
    route: 'hydration',
  ),
  Health(
    title: "Hydration",
    icon: 'assets/icons/water drop.svg',
    value: "1,500",
    unit: "ml",
    image: 'assets/pictures/water.svg',
    route: 'hydration',
  ),
  Health(
    title: "Steps Taken",
    icon: 'assets/icons/steps.svg',
    value: "1,532",
    unit: "total",
    image: 'assets/pictures/bar_graph.svg',
    route: 'steps',
  ),
  Health(
    title: "Steps Taken",
    icon: 'assets/icons/steps.svg',
    value: "1,532",
    unit: "total",
    image: 'assets/pictures/bar_graph.svg',
    route: 'steps',
  ),
];
