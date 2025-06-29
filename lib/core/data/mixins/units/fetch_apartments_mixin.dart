import 'package:keja_hunt/core/domain/models/apartment/apartment_model.dart';
import 'package:keja_hunt/core/domain/models/house_unit_model.dart';
import 'package:keja_hunt/core/utils/supabase_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../di/locator.dart';

mixin FetchApartmentsMixin {
  final supabase = locator.get<SupabaseClient>();

  Future<List<ApartmentModel>> fetchAllApartments() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    /// Fetch all units from units table and unit images table
    final apartmentsResponse = await supabase.from(apartmentsTable).select('*');

    // return [];
    return apartmentsResponse
        .map((response) => ApartmentModel.fromJson(response))
        .toList();
  }

  Future<List<ApartmentModel>> fetchAgentApartments({
    required String agentId,
  }) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw Exception('No user is currently logged in');
    }

    /// Fetch all units from units table and unit images table
    final apartmentsResponse = await supabase
        .from(apartmentsTable)
        .select('*')
        .eq("user_id", agentId);

    return apartmentsResponse
        .map((response) => ApartmentModel.fromJson(response))
        .toList();
  }
}
