import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/domain/models/apartment/apartment_model.dart';

import '../../../../../domain/models/house_unit_model.dart';

class UploadApartmentCase {
  final unitRepo = locator.get<UnitRepository>();

  Future<void> call({required ApartmentModel apartmentModel}) async =>
      await unitRepo.uploadApartment(apartmentModel: apartmentModel);
}
