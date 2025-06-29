part of 'upload_apartment_bloc.dart';

@immutable
sealed class UploadApartmentState {}

final class UploadApartmentInitial extends UploadApartmentState {}

final class UploadApartmentLoading extends UploadApartmentState {}

final class UploadApartmentSuccess extends UploadApartmentState {}

final class UploadApartmentFailed extends UploadApartmentState {
  final String errorMessage;

  UploadApartmentFailed({required this.errorMessage});
}
