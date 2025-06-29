import 'package:keja_hunt/core/data/mixins/units/fetch_units_mixin.dart';
import 'package:keja_hunt/core/data/mixins/units/unit_images_mixin.dart';
import 'package:keja_hunt/core/data/mixins/units/unit_reviews_mixin.dart';
import 'package:keja_hunt/core/data/mixins/units/upload_unit_mixin.dart';

import '../mixins/units/upload_apartment_mixin.dart';

class UnitRepository
    with
        UploadUnitMixin,
        UnitImagesMixin,
        FetchUnitsMixin,
        UnitReviewsMixin,
        /// Apartments
        UploadApartmentMixin {}
