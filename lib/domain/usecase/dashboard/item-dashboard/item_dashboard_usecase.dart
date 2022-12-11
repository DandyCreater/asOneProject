import 'package:as_one/domain/entity/dashboard/item-dashboard/item_dashboard_entity.dart';
import 'package:as_one/domain/repository/domain_repository.dart';
import 'package:dartz/dartz.dart';

class ItemDashboardUseCase {
  final DomainRepository repository;

  ItemDashboardUseCase(this.repository);

  Future<Either<String, ItemDashboardEntity>> execute() async {
    return repository.itemDashboard();
  }
}
