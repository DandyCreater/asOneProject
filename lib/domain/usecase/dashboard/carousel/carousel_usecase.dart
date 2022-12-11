import 'package:as_one/domain/entity/dashboard/carousel/carousel_entity.dart';
import 'package:as_one/domain/repository/domain_repository.dart';
import 'package:dartz/dartz.dart';

class CarouselUseCase {
  final DomainRepository repository;

  CarouselUseCase(this.repository);

  Future<Either<String, CarouselEntity>> execute() async {
    return repository.loadCarousel();
  }
}
