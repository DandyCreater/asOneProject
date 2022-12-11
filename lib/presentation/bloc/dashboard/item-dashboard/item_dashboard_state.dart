part of 'item_dashboard_bloc.dart';

abstract class ItemDashboardState extends Equatable {
  const ItemDashboardState();

  @override
  List<Object> get props => [];
}

class ItemDashboardInitial extends ItemDashboardState {}

class ItemDashboardLoading extends ItemDashboardState {}

class ItemDashboardSuccess extends ItemDashboardState {
  final List<ItemsDashboardList>? value;

  const ItemDashboardSuccess({required this.value});

  @override
  // TODO: implement props
  List<Object> get props => [value!];
}

class ItemDashboardFailed extends ItemDashboardState {
  final String? message;

  const ItemDashboardFailed({required this.message});

  @override
  // TODO: implement props
  List<Object> get props => [message!];
}
