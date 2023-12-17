
class MensaList {
  String canteenId;
  String canteen;
  List<MensaMenu> menus;
  
  MensaList({
    required this.canteenId,
    required this.canteen,
    required this.menus,
  });

  factory MensaList.fromJson(Map<String, dynamic> json) {
    final currentDate = DateTime.now();

    return MensaList(
      canteenId: json['canteenId'] as String,
      canteen: json['canteen'] as String,
      menus: (json['menus'] as List<dynamic>)
        .map((menuJson) => MensaMenu.fromJson(menuJson as Map<String, dynamic>))
        .where((menu) =>
          menu.menuLine.contains("Tagesmenü")
          && DateTime.parse(menu.menuDate).isAtSameMomentAs(currentDate))
        .toList(),
    );
  }
  
  @override
  String toString() {
    return 'MensaMenu { canteenId: $canteenId, canteen: $canteen, menus: $menus }';
  }

}


class MensaMenu {
  String menuLine;
  String thumbnail;
  String medium;
  String large;
  String full;
  String studentPrice;
  String guestPrice;
  String pupilPrice;
  String menuDate;
  List<String> menuItems;   // heißt im JSON-Objekt menu


  MensaMenu({
    required this.menuLine,
    required this.thumbnail,
    required this.medium,
    required this.large,
    required this.full,
    required this.studentPrice,
    required this.guestPrice,
    required this.pupilPrice,
    required this.menuDate,
    required this.menuItems,
  });


  factory MensaMenu.fromJson(Map<String, dynamic> json) {
    return MensaMenu(
      menuLine: json['menuLine'] as String,
      thumbnail: json['photo']['thumbnail'] as String,
      medium: json['photo']['medium'] as String,
      large: json['photo']['large'] as String,
      full: json['photo']['full'] as String,
      studentPrice: json['studentPrice'] as String,
      guestPrice: json['guestPrice'] as String,
      pupilPrice: json['pupilPrice'] as String,
      menuDate: json['menuDate'] as String,
      menuItems: (json['menu'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  @override
  String toString() {
    return 'MensaMenu { menuLine: $menuLine, thumbnail: $thumbnail, studentPrice: $studentPrice, guestPrice: $guestPrice, menuDate: $menuDate, menuItems: $menuItems }';
  }
}