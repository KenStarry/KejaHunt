part of 'upload_unit_bloc.dart';

@immutable
sealed class UploadUnitState {}

final class UploadUnitInitial extends UploadUnitState {}

final class UploadUnitLoading extends UploadUnitState {}

final class UploadUnitSuccess extends UploadUnitState {}

final class UploadUnitFailure extends UploadUnitState {
  final String errorMessage;

  UploadUnitFailure({required this.errorMessage});
}
