import 'package:bloc/bloc.dart';
import 'package:keja_hunt/core/domain/models/units/unit_review_model.dart';
import 'package:meta/meta.dart';

import '../../../../../../data/repository/unit_repository.dart';
import '../../../../../../di/locator.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  ReviewsBloc() : super(ReviewsInitial()) {
    on<FetchAllUnitReviews>(_fetchAllUnitReviews);
  }

  Future<void> _fetchAllUnitReviews(
      FetchAllUnitReviews event,
      Emitter<ReviewsState> emit,
      ) async {
    emit(ReviewsLoading());
    try {
      final userRepo = locator.get<UnitRepository>();

      await userRepo.fetchAllUnitReviews(unitId: event.unitId).then((unitReviews) {
        emit(ReviewsSuccess(reviews: unitReviews));
      });
    } catch (e) {
      emit(ReviewsFailed(errorMessage: "Could not fetch units: ${e.toString()}"));
    }
  }
}
