part of 'string_for_search_cubit.dart';

class StringForSearchState extends Equatable {
  final String? stringForSearch;
  const StringForSearchState({this.stringForSearch});

  StringForSearchState copyWith({
    required String? stringForSearch,
  }) {
    return StringForSearchState(
      stringForSearch: stringForSearch,
      // stringForSearch: stringForSearch ?? this.stringForSearch,
    );
  }

  @override
  List<Object?> get props => [stringForSearch];
}
