
class Canteen {
  final String canteenId;
  final String canteen;
  final List<MensaMenuItem> menus;

  const Canteen({
    required this.canteenId,
    required this.canteen,
    required this.menus,
  });

  factory Canteen.fromJson(Map<String, dynamic> jsonData) {

    if (jsonData.containsKey('canteenId') && jsonData.containsKey('canteen')) {
      final DateTime currentTime = DateTime.now();
      final int currentYear = currentTime.year;
      final int currentMonth = currentTime.month;
      final int currentDay = currentTime.day - 1;

      final List<dynamic> rawMenus = jsonData['menus'];
      final List<MensaMenuItem> parsedMenus =
          rawMenus
          .where((menu) => menu["menuLine"].contains("Tagesmenü"))
          .where((menu) =>
            DateTime.parse(menu['menuDate']).year == currentYear 
            && DateTime.parse(menu['menuDate']).month == currentMonth
            && DateTime.parse(menu['menuDate']).day == currentDay)
          .map((menu) => MensaMenuItem.fromJson(menu)).toList();
          
      return Canteen(
        canteenId: jsonData['canteenId'] as String,
        canteen: jsonData['canteen'] as String,
        menus: parsedMenus,
      );
    } else {
      throw const FormatException('Failed to format Canteen. Missing required keys.');
    }
  }
}


class MensaMenuItem {
  final String id;
  final String menuLine;
  final Map<String, dynamic> photo;
  final String studentPrice;
  final String guestPrice;
  final String pupilPrice;
  final String menuDate;
  final List<dynamic> menu;
  final List<dynamic> meats;
  final List<dynamic> icons;
  final List<dynamic> filtersInclude;
  final List<dynamic> allergens;
  final List<dynamic> additives;
  final dynamic co2;


  MensaMenuItem({
    required this.id,
    required this.menuLine,
    required this.photo,
    required this.studentPrice,
    required this.guestPrice,
    required this.pupilPrice,
    required this.menuDate,
    required this.menu,
    required this.meats,
    required this.icons,
    required this.filtersInclude,
    required this.allergens,
    required this.additives,
    required this.co2,
  });

  factory MensaMenuItem.fromJson(Map<String, dynamic> json) {
    return MensaMenuItem(
      id: json['id'],
      menuLine: json['menuLine'],
      photo: json['photo'],
      studentPrice: json['studentPrice'],
      guestPrice: json['guestPrice'],
      pupilPrice: json['pupilPrice'],
      menuDate: json['menuDate'],
      menu: json['menu'],
      meats: json['meats'],
      icons: json['icons'],
      filtersInclude: json['filtersInclude'],
      allergens: json['allergens'],
      additives: json['additives'],
      co2: json['co2'],
    );
  }
}