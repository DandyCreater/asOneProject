part of 'item_explore_bloc.dart';

abstract class ItemExploreState extends Equatable {
  const ItemExploreState();

  @override
  List<Object> get props => [];
}

class ItemExploreInitial extends ItemExploreState {}

class ItemExploreLoading extends ItemExploreState {}

class ItemExploreSuccess extends ItemExploreState {
  final List<ItemsExploreList>? value;

  const ItemExploreSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class ItemExploreFailed extends ItemExploreState {
  final String? message;

  const ItemExploreFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
