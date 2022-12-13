import 'package:as_one/domain/entity/dashboard/item-order-detail/item_order_detail_entity.dart';
import 'package:as_one/domain/repository/domain_repository.dart';
import 'package:dartz/dartz.dart';

class ItemOrderDetailUseCase {
  final DomainRepository repository;

  ItemOrderDetailUseCase(this.repository);

  Future<Either<String, ItemOrderDetailEntity>> execute() async {
    return repository.itemOrderDetail();
  }
}
