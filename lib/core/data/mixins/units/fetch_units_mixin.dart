import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../di/locator.dart';

mixin FetchUnitsMixin {
  final supabase = locator.get<SupabaseClient>();

  Future<List<HouseUnitModel>> fetchAllUnits() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    /// Fetch all units from units table and unit images table
    final unitsResponse = await supabase
        .from(unitsTable)
        //  select all units, images, agent metadata
        .select(
          '*, images:$unitImagesTable(*),'
          '$apartmentsTable!units_apartment_id_fkey(*),'
          '$usersTable!units_user_id_fkey(*),'
          '$agentsTable!units_user_id_fkey1(*),'
          '$unitReviewsTable(*, reviewer:$usersTable!unit_reviews_user_id_fkey(*))',
        );

    // return [];
    return unitsResponse
        .map((response) => HouseUnitModel.fromJson(response))
        .toList();
  }
}
