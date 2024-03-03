part of 'type_for_search_cubit.dart';

class TypeForSearchState extends Equatable {
  final String? typeForSearch;
  const TypeForSearchState({this.typeForSearch});

  TypeForSearchState copyWith({
    required String? typeForSearch,
  }) {
    return TypeForSearchState(
      typeForSearch: typeForSearch ?? this.typeForSearch,
    );
  }

  @override
  List<Object?> get props => [typeForSearch];
}
