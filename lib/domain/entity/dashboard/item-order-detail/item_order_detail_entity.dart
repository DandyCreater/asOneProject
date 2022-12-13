import 'package:as_one/domain/entity/dashboard/item-dashboard/item_dashboard_entity.dart';

class ItemOrderDetailEntity {
  String? responseCode;
  OKContentItemOrderDetailEntity? oKContentItemDashboard;

  ItemOrderDetailEntity({this.responseCode, this.oKContentItemDashboard});

  ItemOrderDetailEntity.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentItemDashboard = json['OKContentItemOrderDetail'] != null
        ? new OKContentItemOrderDetailEntity.fromJson(
            json['OKContentItemOrderDetail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.oKContentItemDashboard != null) {
      data['OKContentItemOrderDetail'] = this.oKContentItemDashboard!.toJson();
    }
    return data;
  }
}

class OKContentItemOrderDetailEntity {
  List<ItemsOrderDetailEntity>? itemsDashboard;

  OKContentItemOrderDetailEntity({this.itemsDashboard});

  OKContentItemOrderDetailEntity.fromJson(Map<String, dynamic> json) {
    if (json['itemsOrderDetail'] != null) {
      itemsDashboard = <ItemsOrderDetailEntity>[];
      json['itemsOrderDetail'].forEach((v) {
        itemsDashboard!.add(new ItemsOrderDetailEntity.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemsDashboard != null) {
      data['itemsOrderDetail'] =
          this.itemsDashboard!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemsOrderDetailEntity {
  String? itemsName;
  String? actualPrice;
  String? disconPrice;
  String? productType;
  String? terkumpul;
  String? totalOrang;
  String? imageUrl;

  ItemsOrderDetailEntity(
      {this.itemsName,
      this.actualPrice,
      this.disconPrice,
      this.productType,
      this.terkumpul,
      this.totalOrang,
      this.imageUrl});

  ItemsOrderDetailEntity.fromJson(Map<String, dynamic> json) {
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
}
