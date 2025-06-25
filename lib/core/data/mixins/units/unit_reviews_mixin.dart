import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/domain/models/units/unit_review_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../di/locator.dart';

mixin UnitReviewsMixin {
  final supabase = locator.get<SupabaseClient>();

  Future<List<UnitReviewModel>> fetchAllUnitReviews({
    required String unitId,
    int limit = 100,
  }) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    /// Fetch all units from units table and unit images table
    final reviewsResponse = await supabase
        .from(unitReviewsTable)
        .select('*, reviewer:$usersTable!unit_reviews_user_id_fkey(*)')
        .eq('unit_id', unitId)
        .order('updated_at', ascending: false)
        .limit(limit);

    // return [];
    return reviewsResponse
        .map((response) => UnitReviewModel.fromJson(response))
        .toList();
  }
}
