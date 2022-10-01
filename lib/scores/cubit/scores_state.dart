part of 'scores_cubit.dart';

@immutable
class ScoresState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const ScoresState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
