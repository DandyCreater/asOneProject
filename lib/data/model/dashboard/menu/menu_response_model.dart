// ignore_for_file: unnecessary_this

import 'package:as_one/domain/entity/dashboard/menu/menu_entity.dart';

class MenuResponseModel {
  String? responseCode;
  OKContentMenu? oKContentMenu;

  MenuResponseModel({this.responseCode, this.oKContentMenu});

  MenuResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentMenu = json['OKContentMenu'] != null
        ? new OKContentMenu.fromJson(json['OKContentMenu'])
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

  MenuEntity toEntity() {
    return MenuEntity(
        responseCode: this.responseCode,
        oKContentMenu:
            this.oKContentMenu != null ? this.oKContentMenu!.toEntity() : null);
  }
}

class OKContentMenu {
  List<Menu>? menu;

  OKContentMenu({this.menu});

  OKContentMenu.fromJson(Map<String, dynamic> json) {
    if (json['menu'] != null) {
      menu = <Menu>[];
      json['menu'].forEach((v) {
        menu!.add(new Menu.fromJson(v));
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

  OKContentMenuEntity toEntity() {
    return OKContentMenuEntity(
        menu: this.menu != null
            ? this.menu!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class Menu {
  String? routes;
  String? menuName;
  String? imageUrl;

  Menu({this.routes, this.menuName, this.imageUrl});

  Menu.fromJson(Map<String, dynamic> json) {
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

  MenuList toEntity() {
    return MenuList(
        // ignore: unnecessary_this
        routes: this.routes,
        menuName: this.menuName,
        imageUrl: this.imageUrl);
  }
}
