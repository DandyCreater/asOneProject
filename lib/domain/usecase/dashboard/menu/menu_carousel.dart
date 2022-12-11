import 'package:as_one/domain/entity/dashboard/menu/menu_entity.dart';
import 'package:as_one/domain/repository/domain_repository.dart';
import 'package:dartz/dartz.dart';

class MenuUseCase {
  final DomainRepository repository;

  MenuUseCase(this.repository);

  Future<Either<String, MenuEntity>> execute() async {
    return repository.loadMenu();
  }
}
