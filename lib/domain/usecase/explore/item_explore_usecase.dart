import 'package:as_one/domain/entity/explore/item-explore/item_explore_entity.dart';
import 'package:as_one/domain/repository/domain_repository.dart';
import 'package:dartz/dartz.dart';

class ItemExploreUseCase {
  final DomainRepository repository;

  ItemExploreUseCase(this.repository);

  Future<Either<String, ItemExploreEntity>> execute() async {
    return repository.itemExplore();
  }
}
