import 'package:keja_hunt/core/data/repository/unit_repository.dart';
import 'package:keja_hunt/core/di/locator.dart';

import '../../../../../domain/models/house_unit_model.dart';

class UploadUnitCase {
  final unitRepo = locator.get<UnitRepository>();

  Future<void> call({required HouseUnitModel houseUnitModel}) async =>
      await unitRepo.uploadHouseUnit(houseUnitModel: houseUnitModel);
}
