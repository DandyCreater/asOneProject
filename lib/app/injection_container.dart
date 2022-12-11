import 'package:as_one/data/datasources/local_data_source.dart';
import 'package:as_one/data/repository/data_repository_impl.dart';
import 'package:as_one/domain/repository/domain_repository.dart';
import 'package:as_one/domain/usecase/dashboard/carousel/carousel_usecase.dart';
import 'package:as_one/domain/usecase/dashboard/item-dashboard/item_dashboard_usecase.dart';
import 'package:as_one/domain/usecase/dashboard/menu/menu_carousel.dart';
import 'package:as_one/domain/usecase/explore/item_explore_usecase.dart';
import 'package:as_one/presentation/bloc/dashboard/carousel/carousel_bloc.dart';
import 'package:as_one/presentation/bloc/dashboard/item-dashboard/item_dashboard_bloc.dart';
import 'package:as_one/presentation/bloc/dashboard/menu/menu_bloc.dart';
import 'package:as_one/presentation/bloc/explore/bloc/item_explore_bloc.dart';

import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init(String baseUrl) async {
  sl.registerFactory(() => CarouselBloc(sl()));
  sl.registerFactory(() => MenuBloc(sl()));
  sl.registerFactory(() => ItemDashboardBloc(sl()));
  sl.registerFactory(() => ItemExploreBloc(sl()));

  sl.registerLazySingleton(() => CarouselUseCase(sl()));
  sl.registerLazySingleton(() => MenuUseCase(sl()));
  sl.registerLazySingleton(() => ItemDashboardUseCase(sl()));
  sl.registerLazySingleton(() => ItemExploreUseCase(sl()));

  sl.registerLazySingleton<DomainRepository>(() => DataRepositoryImpl(sl()));

  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
