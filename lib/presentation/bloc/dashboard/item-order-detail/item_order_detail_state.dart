part of 'item_order_detail_bloc.dart';

abstract class ItemOrderDetailState extends Equatable {
  const ItemOrderDetailState();

  @override
  List<Object> get props => [];
}

class ItemOrderDetailInitial extends ItemOrderDetailState {}

class ItemOrderDetailLoading extends ItemOrderDetailState {}

class ItemOrderDetailSuccess extends ItemOrderDetailState {
  final List<ItemsOrderDetailEntity>? value;

  const ItemOrderDetailSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class ItemOrderDetailFailed extends ItemOrderDetailState {
  final String? message;

  const ItemOrderDetailFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
