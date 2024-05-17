import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_test/modular_test.dart';
import 'package:simo_personal_website/modules/core/core_module.dart';
import 'package:simo_personal_website/modules/core/services/local_storage_service.dart';
// import 'package:simo_personal_website/modules/feature2/feature_2_module_def.dart';
// import 'package:simo_personal_website/modules/feature2/models/data_models/pokemon.dart';
// import 'package:simo_personal_website/modules/feature2/pages/feature_2_base_page.dart';
// import 'package:simo_personal_website/modules/feature2/repositories/feature_2_repo.dart';
//
// class MockPokemonRepository extends Mock implements Feature2Repository {}

class MockLocalStorageService extends Mock implements LocalStorageService {}

main() {
  final mockLocalStorageService = MockLocalStorageService();
  //
  // final mockPokemons = [
  //   Pokemon(
  //     id: 1,
  //     name: 'bulbasaur',
  //     spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png',
  //     artworkUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
  //     types: ['grass', 'poison'],
  //   ),
  //   Pokemon(
  //     id: 4,
  //     name: 'charmander',
  //     spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png',
  //     artworkUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
  //     types: ['fire'],
  //   ),
  //   Pokemon(
  //     id: 7,
  //     name: 'squirtle',
  //     spriteUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png',
  //     artworkUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png',
  //     types: ['water'],
  //   ),
  // ];
  // final mockFavorites = [
  //   7
  // ];
  //
  // setUp((){
  //
  //   initModules([CoreModule(), Feature2Module()], replaceBinds: [
  //     Bind.instance<LocalStorageService>(mockLocalStorageService, export: true),
  //     Bind.instance<Feature2Repository>(mockPokemonRepository),
  //   ]);
  // });
  //
  // testWidgets('list rendering...', (tester) async {
  //   when(() => mockPokemonRepository.getAll(page: any(named: 'page'), size: any(named: 'size'))).thenAnswer((invocation) async => mockPokemons);
  //   when(() => mockLocalStorageService.get(any())).thenAnswer((invocation) async => jsonEncode(mockFavorites));
  //
  //   await tester.pumpWidget(const MaterialApp(
  //     home: Feature2BasePage(),
  //   ));
  //
  //   final finder = find.text(mockPokemons[0].name);
  //
  //   expect(finder, findsOneWidget);
  // });

}