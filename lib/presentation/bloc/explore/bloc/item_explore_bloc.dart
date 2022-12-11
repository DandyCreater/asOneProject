import 'package:as_one/domain/entity/explore/item-explore/item_explore_entity.dart';
import 'package:as_one/domain/usecase/explore/item_explore_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'item_explore_event.dart';
part 'item_explore_state.dart';

class ItemExploreBloc extends Bloc<ItemExploreEvent, ItemExploreState> {
  final ItemExploreUseCase itemExploreUseCase;
  ItemExploreBloc(this.itemExploreUseCase) : super(ItemExploreInitial()) {
    on<ItemExploreEvent>((event, emit) async {
      emit(ItemExploreLoading());
      try {
        final response = await itemExploreUseCase.execute();
        response.fold((failure) {
          emit(ItemExploreFailed(message: failure));
        }, (result) {
          emit(ItemExploreSuccess(
              value: result.oKContentItemExplore!.itemsExplore));
        });
      } catch (e) {
        debugPrint("BLOC Item Explore Error $e");
        emit(ItemExploreFailed(message: "BLOC Item Explore Error $e"));
      }
    });
  }
}
