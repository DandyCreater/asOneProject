import 'package:as_one/domain/entity/dashboard/item-dashboard/item_dashboard_entity.dart';
import 'package:as_one/domain/entity/dashboard/item-order-detail/item_order_detail_entity.dart';

class ItemOrderDetailResponseModel {
  String? responseCode;
  OKContentItemOrderDetail? oKContentItemDashboard;

  ItemOrderDetailResponseModel(
      {this.responseCode, this.oKContentItemDashboard});

  ItemOrderDetailResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentItemDashboard = json['OKContentItemOrderDetail'] != null
        ? new OKContentItemOrderDetail.fromJson(
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

  ItemOrderDetailEntity toEntity() {
    return ItemOrderDetailEntity(
        responseCode: this.responseCode,
        oKContentItemDashboard: this.oKContentItemDashboard != null
            ? this.oKContentItemDashboard!.toEntity()
            : null);
  }
}

class OKContentItemOrderDetail {
  List<ItemsOrderDetail>? itemsDashboard;

  OKContentItemOrderDetail({this.itemsDashboard});

  OKContentItemOrderDetail.fromJson(Map<String, dynamic> json) {
    if (json['itemsOrderDetail'] != null) {
      itemsDashboard = <ItemsOrderDetail>[];
      json['itemsOrderDetail'].forEach((v) {
        itemsDashboard!.add(new ItemsOrderDetail.fromJson(v));
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

  OKContentItemOrderDetailEntity toEntity() {
    return OKContentItemOrderDetailEntity(
        itemsDashboard: this.itemsDashboard != null
            ? this.itemsDashboard!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class ItemsOrderDetail {
  String? itemsName;
  String? actualPrice;
  String? disconPrice;
  String? productType;
  String? terkumpul;
  String? totalOrang;
  String? imageUrl;

  ItemsOrderDetail(
      {this.itemsName,
      this.actualPrice,
      this.disconPrice,
      this.productType,
      this.terkumpul,
      this.totalOrang,
      this.imageUrl});

  ItemsOrderDetail.fromJson(Map<String, dynamic> json) {
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

  ItemsOrderDetailEntity toEntity() {
    return ItemsOrderDetailEntity(
        itemsName: this.itemsName,
        actualPrice: this.actualPrice,
        disconPrice: this.disconPrice,
        productType: this.productType,
        terkumpul: this.terkumpul,
        totalOrang: this.totalOrang,
        imageUrl: this.imageUrl);
  }
}
