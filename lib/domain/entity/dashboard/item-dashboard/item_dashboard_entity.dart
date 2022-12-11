class ItemDashboardEntity {
  String? responseCode;
  OKContentItemDashboardEntity? oKContentItemDashboard;

  ItemDashboardEntity(
      {required this.responseCode, required this.oKContentItemDashboard});

  ItemDashboardEntity.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    oKContentItemDashboard = json['OKContentItemDashboard'] != null
        ? new OKContentItemDashboardEntity.fromJson(
            json['OKContentItemDashboard'])
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
}

class OKContentItemDashboardEntity {
  List<ItemsDashboardList>? itemsDashboard;

  OKContentItemDashboardEntity({required this.itemsDashboard});

  OKContentItemDashboardEntity.fromJson(Map<String, dynamic> json) {
    if (json['itemsDashboard'] != null) {
      itemsDashboard = <ItemsDashboardList>[];
      json['itemsDashboard'].forEach((v) {
        itemsDashboard!.add(new ItemsDashboardList.fromJson(v));
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
}

class ItemsDashboardList {
  String? itemsName;
  String? actualPrice;
  String? disconPrice;
  String? productType;
  String? terkumpul;
  String? totalOrang;
  String? imageUrl;

  ItemsDashboardList(
      {required this.itemsName,
      required this.actualPrice,
      required this.disconPrice,
      required this.productType,
      required this.terkumpul,
      required this.totalOrang,
      required this.imageUrl});

  ItemsDashboardList.fromJson(Map<String, dynamic> json) {
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
