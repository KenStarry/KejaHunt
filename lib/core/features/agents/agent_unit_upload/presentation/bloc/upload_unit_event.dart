part of 'upload_unit_bloc.dart';

@immutable
sealed class UploadUnitEvent {}

final class HouseUnitUploadEvent extends UploadUnitEvent {
  final HouseUnitModel houseUnitModel;

  HouseUnitUploadEvent({required this.houseUnitModel});
}
