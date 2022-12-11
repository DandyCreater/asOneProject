import 'package:as_one/domain/entity/dashboard/item-dashboard/item_dashboard_entity.dart';
import 'package:as_one/domain/usecase/dashboard/item-dashboard/item_dashboard_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'item_dashboard_event.dart';
part 'item_dashboard_state.dart';

class ItemDashboardBloc extends Bloc<ItemDashboardEvent, ItemDashboardState> {
  final ItemDashboardUseCase itemDashboardUseCase;
  ItemDashboardBloc(this.itemDashboardUseCase) : super(ItemDashboardInitial()) {
    on<FetchItemDashboard>((event, emit) async {
      emit(ItemDashboardLoading());
      try {
        final response = await itemDashboardUseCase.execute();
        response.fold((failure) {
          emit(ItemDashboardFailed(message: failure));
        }, (result) {
          emit(ItemDashboardSuccess(
              value: result.oKContentItemDashboard!.itemsDashboard!));
        });
      } catch (e) {
        debugPrint("BLOC Item Dashboard Error $e");
        emit(ItemDashboardFailed(message: "BlOC Item Dashboard Error $e"));
      }
    });
  }
}
