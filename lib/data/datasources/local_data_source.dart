import 'dart:convert';

import 'package:as_one/data/model/dashboard/carousel/carousel_response_model.dart';
import 'package:as_one/data/model/dashboard/item-dashboard/item_dashboard_response_model.dart';
import 'package:as_one/data/model/dashboard/item-order-detail/item_order_detail_response_model.dart';
import 'package:as_one/data/model/dashboard/menu/menu_response_model.dart';
import 'package:as_one/data/model/explore/item-explore/item_explore_response_model.dart';
import 'package:flutter/services.dart';

abstract class LocalDataSource {
  Future carouselLoad();
  Future menuLoad();
  Future itemDashboard();

  Future itemExplore();
  Future itemOrderDetail();
}

class LocalDataSourceImpl implements LocalDataSource {
  @override
  Future carouselLoad() async {
    final response = await rootBundle.loadString('assets/json/carousel.json');
    final decodeResponse = jsonDecode(response);
    var result = CarouselResponseModel.fromJson(decodeResponse);

    return result;
  }

  @override
  Future menuLoad() async {
    final response = await rootBundle.loadString('assets/json/menu.json');
    final decodeResponse = jsonDecode(response);

    var result = MenuResponseModel.fromJson(decodeResponse);

    return result;
  }

  @override
  Future itemDashboard() async {
    final response =
        await rootBundle.loadString('assets/json/items_dashboard.json');
    final decodeResponse = jsonDecode(response);

    var result = ItemDashboardResponseModel.fromJson(decodeResponse);

    return result;
  }

  @override
  Future itemExplore() async {
    final response =
        await rootBundle.loadString('assets/json/items_explore.json');
    final decodeResponse = jsonDecode(response);

    var result = ItemExploreResponseModel.fromJson(decodeResponse);

    return result;
  }

  @override
  Future itemOrderDetail() async {
    final response =
        await rootBundle.loadString('assets/json/items_order_detail.json');
    final decodeResponse = jsonDecode(response);

    var result = ItemOrderDetailResponseModel.fromJson(decodeResponse);

    return result;
  }
}
