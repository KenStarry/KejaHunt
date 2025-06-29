part of 'upload_apartment_bloc.dart';

@immutable
sealed class UploadApartmentEvent {}

final class ApartmentUploadEvent extends UploadApartmentEvent {
  final ApartmentModel apartmentModel;

  ApartmentUploadEvent({required this.apartmentModel});
}
