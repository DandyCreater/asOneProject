import 'package:as_one/domain/entity/dashboard/carousel/carousel_entity.dart';
import 'package:as_one/domain/entity/dashboard/item-dashboard/item_dashboard_entity.dart';
import 'package:as_one/domain/entity/dashboard/menu/menu_entity.dart';
import 'package:as_one/domain/entity/explore/item-explore/item_explore_entity.dart';
import 'package:dartz/dartz.dart';

abstract class DomainRepository {
  Future<Either<String, CarouselEntity>> loadCarousel();
  Future<Either<String, MenuEntity>> loadMenu();
  Future<Either<String, ItemDashboardEntity>> itemDashboard();

  Future<Either<String, ItemExploreEntity>> itemExplore();
}
