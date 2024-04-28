part of 'location_characters_cubit.dart';

sealed class LocationCharactersState extends Equatable {
  const LocationCharactersState();

  @override
  List<Object> get props => [];
}

final class LocationCharactersInitial extends LocationCharactersState {}

final class LocationCharactersLoading extends LocationCharactersState {}

final class LocationCharactersLoaded extends LocationCharactersState {
  final LocationOriginEntity locationOriginEntity;

  const LocationCharactersLoaded({
    required this.locationOriginEntity,
  });

  LocationCharactersLoaded copyWith({
    LocationOriginEntity? locationOriginEntity,
  }) {
    return LocationCharactersLoaded(
      locationOriginEntity: locationOriginEntity ?? this.locationOriginEntity,
    );
  }

  @override
  List<Object> get props => [locationOriginEntity];
}
