import 'package:as_one/domain/entity/dashboard/item-order-detail/item_order_detail_entity.dart';
import 'package:as_one/domain/usecase/dashboard/item-order-detail/item_order_detail_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'item_order_detail_event.dart';
part 'item_order_detail_state.dart';

class ItemOrderDetailBloc
    extends Bloc<ItemOrderDetailEvent, ItemOrderDetailState> {
  final ItemOrderDetailUseCase itemOrderDetailUseCase;
  ItemOrderDetailBloc(this.itemOrderDetailUseCase)
      : super(ItemOrderDetailInitial()) {
    on<FetchItemOrderDetail>((event, emit) async {
      emit(ItemOrderDetailLoading());

      try {
        final response = await itemOrderDetailUseCase.execute();

        response.fold((failure) {
          emit(ItemOrderDetailFailed(message: failure));
        }, (response) {
          emit(ItemOrderDetailSuccess(
              value: response.oKContentItemDashboard!.itemsDashboard!));
        });
      } catch (e) {
        debugPrint("BLOC ITEM DETAIL ORDER ERROR $e");
        emit(ItemOrderDetailFailed(message: "BLOC ITEM DETAIL ORDER ERROR $e"));
      }
    });
  }
}
