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

class Setting {
  final String icon;
  final String title;

  Setting({
    required this.icon,
    required this.title,
  });
}

// Health insights
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

// Settings tiles
List<Setting> titles = [
  Setting(icon: 'assets/icons/user.svg', title: "Account settings"),
  Setting(icon: 'assets/icons/document.svg', title: "Terms and conditions"),
  Setting(icon: 'assets/icons/help.svg', title: "Help"),
  Setting(icon: 'assets/icons/feedback.svg', title: "Feedback"),
  Setting(icon: 'assets/icons/rate.svg', title: "Rate the app"),
  Setting(icon: 'assets/icons/logout.svg', title: "Logout"),
];
