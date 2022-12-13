import 'package:as_one/data/datasources/local_data_source.dart';
import 'package:as_one/data/model/dashboard/carousel/carousel_response_model.dart';
import 'package:as_one/data/model/dashboard/item-dashboard/item_dashboard_response_model.dart';
import 'package:as_one/data/model/dashboard/item-order-detail/item_order_detail_response_model.dart';
import 'package:as_one/data/model/dashboard/menu/menu_response_model.dart';
import 'package:as_one/data/model/explore/item-explore/item_explore_response_model.dart';
import 'package:as_one/domain/entity/dashboard/carousel/carousel_entity.dart';
import 'package:as_one/domain/entity/dashboard/item-dashboard/item_dashboard_entity.dart';
import 'package:as_one/domain/entity/dashboard/item-order-detail/item_order_detail_entity.dart';
import 'package:as_one/domain/entity/dashboard/menu/menu_entity.dart';
import 'package:as_one/domain/entity/explore/item-explore/item_explore_entity.dart';
import 'package:as_one/domain/repository/domain_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class DataRepositoryImpl extends DomainRepository {
  final LocalDataSource localDataSource;

  DataRepositoryImpl(this.localDataSource);

  @override
  Future<Either<String, CarouselEntity>> loadCarousel() async {
    try {
      CarouselResponseModel result = await localDataSource.carouselLoad();

      if (result.responseCode == "OK") {
        return right(result.toEntity());
      } else {
        return left("Load Carousel Error");
      }
    } catch (e) {
      debugPrint("Catch Error Load Carousel $e");
      return Left("Catch Error Load Carousel $e");
    }
  }

  @override
  Future<Either<String, MenuEntity>> loadMenu() async {
    try {
      MenuResponseModel result = await localDataSource.menuLoad();
      if (result.responseCode == "OK") {
        return right(result.toEntity());
      }
      return left("Load Menu Error");
    } catch (e) {
      debugPrint("Catach Error Load Menu $e");
      return Left("Catch Error Load Menu $e");
    }
  }

  @override
  Future<Either<String, ItemDashboardEntity>> itemDashboard() async {
    try {
      ItemDashboardResponseModel result = await localDataSource.itemDashboard();

      if (result.responseCode == "OK") {
        return right(result.toEntity());
      }
      return left("Load Item Dashboard Error");
    } catch (e) {
      debugPrint("Catch Error Load Item Dashboard $e");
      return Left("Catch Error Load Item Dashboard $e");
    }
  }

  @override
  Future<Either<String, ItemExploreEntity>> itemExplore() async {
    try {
      ItemExploreResponseModel result = await localDataSource.itemExplore();
      if (result.responseCode == "OK") {
        return right(result.toEntity());
      }
      return left("Fetch item Explore Error");
    } catch (e) {
      debugPrint("Catch Error Load Item Explore $e");
      return Left("Catch Error Load Item Explore $e");
    }
  }

  @override
  Future<Either<String, ItemOrderDetailEntity>> itemOrderDetail() async {
    try {
      ItemOrderDetailResponseModel result =
          await localDataSource.itemOrderDetail();

      if (result.responseCode == "OK") {
        return right(result.toEntity());
      }
      return left("Load Item Dashboard Error");
    } catch (e) {
      debugPrint("Catch Error Load Item Order Detail $e");
      return Left("Catch Error Load Item Order Detail $e");
    }
  }
}
