import 'package:keja_hunt/core/di/locator.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/models/house_unit_model.dart';

mixin UploadUnitMixin {
  final supabase = locator.get<SupabaseClient>();

  Future<void> uploadHouseUnit({required HouseUnitModel houseUnitModel}) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    final updatedHouseModel = houseUnitModel.copyWith(userId: user.id);

    await supabase
        .from(unitsTable)
        .upsert(
          updatedHouseModel.toJson(),
          onConflict: 'user_id,apartment_id,unit_type,price,price_frequency',
          ignoreDuplicates: false,
        );
  }
}
