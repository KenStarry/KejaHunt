part of 'units_bloc.dart';

@immutable
sealed class UnitsState {}

final class UnitsInitial extends UnitsState {}

final class UnitsLoading extends UnitsState {}

final class UnitsSuccess extends UnitsState {
  final List<HouseUnitModel> allUnits;
  
  UnitsSuccess({required this.allUnits});
}

final class UnitsFailed extends UnitsState {
  final String errorMessage;

  UnitsFailed({required this.errorMessage});
}
