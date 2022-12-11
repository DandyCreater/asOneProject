import 'package:as_one/domain/entity/dashboard/menu/menu_entity.dart';
import 'package:as_one/domain/usecase/dashboard/menu/menu_carousel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'menu_event.dart';
part 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  final MenuUseCase menuUseCase;
  MenuBloc(this.menuUseCase) : super(MenuInitial()) {
    on<FetchMenu>((event, emit) async {
      emit(MenuLoading());

      try {
        final response = await menuUseCase.execute();
        response.fold((failure) {
          emit(MenuFailed(message: failure));
        }, (result) {
          emit(MenuSuccess(value: result.oKContentMenu!.menu));
        });
      } catch (e) {
        debugPrint("BLOC Menu Error $e");
        emit(MenuFailed(message: "BLOC Menu Error $e"));
      }
    });
  }
}
