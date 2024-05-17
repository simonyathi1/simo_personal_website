import 'package:dio/dio.dart';

import '../models/data_models/berry.dart';

class Feature1Repository {
  final Dio dio;
  const Feature1Repository(this.dio);

  Future<List<Berry>> getAll({int page = 0, int size = 20}) async {
    final response = await dio.get(
      'https://pokeapi.co/api/v2/berry',
      queryParameters: {
        'offset': page * size,
        'limit': size,
      },
    );

    final rawPokemonsList = response.data['results'] as List;
    final List<Berry> berries = [];
    for(int i =0; i < rawPokemonsList.length; ++i) {
      final berryName = (rawPokemonsList[i] as Map)['name'];

      final response = await dio.get('https://pokeapi.co/api/v2/item/$berryName-berry');
      berries.add(Berry.fromApi(response.data));
    }
    return berries;
  }

  get({required String berry}) async {
    await dio.get(
      'https://pokeapi.co/api/v2/berry/$berry',
    );
  }
}