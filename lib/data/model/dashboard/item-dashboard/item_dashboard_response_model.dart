import 'package:as_one/domain/entity/dashboard/item-dashboard/item_dashboard_entity.dart';

class ItemDashboardResponseModel {
  String? responseCode;
  OKContentItemDashboard? oKContentItemDashboard;

  ItemDashboardResponseModel({this.responseCode, this.oKContentItemDashboard});

  ItemDashboardResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentItemDashboard = json['OKContentItemDashboard'] != null
        ? new OKContentItemDashboard.fromJson(json['OKContentItemDashboard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.oKContentItemDashboard != null) {
      data['OKContentItemDashboard'] = this.oKContentItemDashboard!.toJson();
    }
    return data;
  }

  ItemDashboardEntity toEntity() {
    return ItemDashboardEntity(
        responseCode: this.responseCode,
        oKContentItemDashboard: this.oKContentItemDashboard != null
            ? this.oKContentItemDashboard!.toEntity()
            : null);
  }
}

class OKContentItemDashboard {
  List<ItemsDashboard>? itemsDashboard;

  OKContentItemDashboard({this.itemsDashboard});

  OKContentItemDashboard.fromJson(Map<String, dynamic> json) {
    if (json['itemsDashboard'] != null) {
      itemsDashboard = <ItemsDashboard>[];
      json['itemsDashboard'].forEach((v) {
        itemsDashboard!.add(new ItemsDashboard.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemsDashboard != null) {
      data['itemsDashboard'] =
          this.itemsDashboard!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  OKContentItemDashboardEntity toEntity() {
    return OKContentItemDashboardEntity(
        itemsDashboard: this.itemsDashboard != null
            ? this.itemsDashboard!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class ItemsDashboard {
  String? itemsName;
  String? actualPrice;
  String? disconPrice;
  String? productType;
  String? terkumpul;
  String? totalOrang;
  String? imageUrl;

  ItemsDashboard(
      {this.itemsName,
      this.actualPrice,
      this.disconPrice,
      this.productType,
      this.terkumpul,
      this.totalOrang,
      this.imageUrl});

  ItemsDashboard.fromJson(Map<String, dynamic> json) {
    itemsName = json['itemsName'];
    actualPrice = json['actualPrice'];
    disconPrice = json['disconPrice'];
    productType = json['productType'];
    terkumpul = json['terkumpul'];
    totalOrang = json['totalOrang'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsName'] = this.itemsName;
    data['actualPrice'] = this.actualPrice;
    data['disconPrice'] = this.disconPrice;
    data['productType'] = this.productType;
    data['terkumpul'] = this.terkumpul;
    data['totalOrang'] = this.totalOrang;
    data['imageUrl'] = this.imageUrl;
    return data;
  }

  ItemsDashboardList toEntity() {
    return ItemsDashboardList(
        itemsName: this.itemsName,
        actualPrice: this.actualPrice,
        disconPrice: this.disconPrice,
        productType: this.productType,
        terkumpul: this.terkumpul,
        totalOrang: this.totalOrang,
        imageUrl: this.imageUrl);
  }
}
