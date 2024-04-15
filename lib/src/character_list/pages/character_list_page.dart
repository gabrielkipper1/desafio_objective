import 'package:desafio_objective/src/character_list/bloc/character_list_bloc.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_builder.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_paginator.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_search_bar.dart';
import 'package:desafio_objective/src/interceptors/dio/marvel_auth_interceptor_dio.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';
import 'package:desafio_objective/src/repositories/character_repository/marvel_character_service.dart';
import 'package:desafio_objective/src/repositories/http_client/dio_http.dart';
import 'package:desafio_objective/src/repositories/http_client/http_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({super.key});

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  late CharacterListBloc _bloc;

  @override
  void initState() {
    _bloc = CharacterListBloc(characterRepository: Modular.get<CharacterRepository>());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<CharacterListBloc, CharacterListState>(
        listener: (context, state) {},
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(title: const Text("Character List")),
          body: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CharacterListSearchBar(),
              Expanded(child: CharacterListBuilder()),
              CharacterListPaginator(),
            ],
          ),
        ),
      ),
    );
  }
}
