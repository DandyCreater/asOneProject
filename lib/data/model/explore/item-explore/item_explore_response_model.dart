import 'package:as_one/domain/entity/explore/item-explore/item_explore_entity.dart';

class ItemExploreResponseModel {
  String? responseCode;
  OKContentItemExplore? oKContentItemExplore;

  ItemExploreResponseModel({this.responseCode, this.oKContentItemExplore});

  ItemExploreResponseModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentItemExplore = json['OKContentItemExplore'] != null
        ? new OKContentItemExplore.fromJson(json['OKContentItemExplore'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    if (this.oKContentItemExplore != null) {
      data['OKContentItemExplore'] = this.oKContentItemExplore!.toJson();
    }
    return data;
  }

  ItemExploreEntity toEntity() {
    return ItemExploreEntity(
        responseCode: this.responseCode,
        oKContentItemExplore: this.oKContentItemExplore != null
            ? this.oKContentItemExplore!.toEntity()
            : null);
  }
}

class OKContentItemExplore {
  List<ItemsExplore>? itemsExplore;

  OKContentItemExplore({this.itemsExplore});

  OKContentItemExplore.fromJson(Map<String, dynamic> json) {
    if (json['itemsExplore'] != null) {
      itemsExplore = <ItemsExplore>[];
      json['itemsExplore'].forEach((v) {
        itemsExplore!.add(new ItemsExplore.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.itemsExplore != null) {
      data['itemsExplore'] = this.itemsExplore!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  OKContentItemExploreEntity toEntity() {
    return OKContentItemExploreEntity(
        itemsExplore: this.itemsExplore != null
            ? this.itemsExplore!.map((e) => e.toEntity()).toList()
            : null);
  }
}

class ItemsExplore {
  String? itemsName;
  String? actualPrice;
  String? disconPrice;
  String? productType;
  String? terkumpul;
  String? totalOrang;
  String? imageUrl;

  ItemsExplore(
      {this.itemsName,
      this.actualPrice,
      this.disconPrice,
      this.productType,
      this.terkumpul,
      this.totalOrang,
      this.imageUrl});

  ItemsExplore.fromJson(Map<String, dynamic> json) {
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

  ItemsExploreList toEntity() {
    return ItemsExploreList(
        itemsName: this.itemsName,
        actualPrice: this.actualPrice,
        disconPrice: this.disconPrice,
        productType: this.productType,
        terkumpul: this.terkumpul,
        totalOrang: this.totalOrang,
        imageUrl: this.imageUrl);
  }
}
