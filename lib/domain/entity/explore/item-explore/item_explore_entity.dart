class ItemExploreEntity {
  String? responseCode;
  OKContentItemExploreEntity? oKContentItemExplore;

  ItemExploreEntity(
      {required this.responseCode, required this.oKContentItemExplore});

  ItemExploreEntity.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentItemExplore = json['OKContentItemExplore'] != null
        ? new OKContentItemExploreEntity.fromJson(json['OKContentItemExplore'])
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
}

class OKContentItemExploreEntity {
  List<ItemsExploreList>? itemsExplore;

  OKContentItemExploreEntity({required this.itemsExplore});

  OKContentItemExploreEntity.fromJson(Map<String, dynamic> json) {
    if (json['itemsExplore'] != null) {
      itemsExplore = <ItemsExploreList>[];
      json['itemsExplore'].forEach((v) {
        itemsExplore!.add(new ItemsExploreList.fromJson(v));
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
}

class ItemsExploreList {
  String? itemsName;
  String? actualPrice;
  String? disconPrice;
  String? productType;
  String? terkumpul;
  String? totalOrang;
  String? imageUrl;

  ItemsExploreList(
      {required this.itemsName,
      required this.actualPrice,
      required this.disconPrice,
      required this.productType,
      required this.terkumpul,
      required this.totalOrang,
      required this.imageUrl});

  ItemsExploreList.fromJson(Map<String, dynamic> json) {
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
