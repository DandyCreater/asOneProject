part of 'carousel_bloc.dart';

abstract class CarouselState extends Equatable {
  const CarouselState();

  @override
  List<Object> get props => [];
}

class CarouselInitial extends CarouselState {}

class CarouselLoading extends CarouselState {}

class CarouselSuccess extends CarouselState {
  final List<CarouselList>? value;

  CarouselSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class CarouselFailed extends CarouselState {
  final String? message;

  const CarouselFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
