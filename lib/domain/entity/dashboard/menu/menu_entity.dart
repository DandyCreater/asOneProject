class MenuEntity {
  String? responseCode;
  OKContentMenuEntity? oKContentMenu;

  MenuEntity({required this.responseCode, required this.oKContentMenu});

  MenuEntity.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentMenu = json['OKContentMenu'] != null
        ? new OKContentMenuEntity.fromJson(json['OKContentMenu'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.oKContentMenu != null) {
      data['OKContentMenu'] = this.oKContentMenu!.toJson();
    }
    return data;
  }
}

class OKContentMenuEntity {
  List<MenuList>? menu;

  OKContentMenuEntity({required this.menu});

  OKContentMenuEntity.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      menu = <MenuList>[];
      json['menu'].forEach((v) {
        menu!.add(new MenuList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.menu != null) {
      data['menu'] = this.menu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MenuList {
  String? routes;
  String? menuName;
  String? imageUrl;

  MenuList(
      {required this.routes, required this.menuName, required this.imageUrl});

  MenuList.fromJson(Map<String, dynamic> json) {
    routes = json['routes'];
    menuName = json['menuName'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['routes'] = this.routes;
    data['menuName'] = this.menuName;
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}
