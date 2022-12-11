import 'package:as_one/data/model/dashboard/carousel/carousel_response_model.dart';
import 'package:as_one/domain/entity/dashboard/carousel/carousel_entity.dart';
import 'package:as_one/domain/usecase/dashboard/carousel/carousel_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  final CarouselUseCase carouselUseCase;
  CarouselBloc(this.carouselUseCase) : super(CarouselInitial()) {
    on<FetchCarousel>((event, emit) async {
      emit(CarouselLoading());
      try {
        final response = await carouselUseCase.execute();
        response.fold((failure) {
          emit(CarouselFailed(message: failure));
        }, (result) {
          emit(CarouselSuccess(value: result.oKContentCarousel!.carousel));
        });
      } catch (e) {
        debugPrint("Bloc Carousel Error $e");
        emit(CarouselFailed(message: "Bloc Carousel Error $e"));
      }
    });
  }
}
