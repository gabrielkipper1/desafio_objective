import 'package:desafio_objective/src/character_list/bloc/character_list_bloc.dart';
import 'package:desafio_objective/src/character_list/widgets/app_bar/app_bar_builder.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_builder.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_paginator.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_search_bar.dart';
import 'package:desafio_objective/src/repositories/character_repository/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
        child: SafeArea(
          child: Scaffold(
            body: Padding(
              padding: getPadding(),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarBuilder(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: CharacterListSearchBar(),
                  ),
                  Expanded(
                    child: CharacterListBuilder(),
                  ),
                  CharacterListPaginator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  EdgeInsets getPadding() => ResponsiveBreakpoints.of(context).breakpoint.name == MOBILE
      ? const EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10)
      : const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 15.0, top: 20.0);
}
