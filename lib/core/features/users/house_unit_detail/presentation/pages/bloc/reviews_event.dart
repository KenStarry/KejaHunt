part of 'reviews_bloc.dart';

@immutable
sealed class ReviewsEvent {}

final class FetchAllUnitReviews extends ReviewsEvent {
  final String unitId;

  FetchAllUnitReviews({required this.unitId});
}
