import 'package:bloc_rick_morty/domain/entities/peticion_details_entity/peticion_details_entity.dart';

import '../../../domain/data_sources/data_sources.dart';
import '../../../domain/repositories/repositories.dart';

class PeticionDetailsRepositoryImpl implements PeticionDetailsRepository {
  final PeticionDetailsDataSource peticionDetailsDataSource;

  PeticionDetailsRepositoryImpl({required this.peticionDetailsDataSource});

  @override
  Future<PeticionDetailsEntity> getPeticionDetails({required int page}) {
    //! las excepciones tambien se tiene que manejar aqui

    return peticionDetailsDataSource.getCharacters(page: page);
  }
}
