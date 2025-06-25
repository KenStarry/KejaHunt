part of 'reviews_bloc.dart';

@immutable
sealed class ReviewsState {}

final class ReviewsInitial extends ReviewsState {}

final class ReviewsLoading extends ReviewsState {}

final class ReviewsSuccess extends ReviewsState {
  final List<UnitReviewModel> reviews;

  ReviewsSuccess({required this.reviews});
}

final class ReviewsFailed extends ReviewsState {
  final String errorMessage;

  ReviewsFailed({required this.errorMessage});
}
