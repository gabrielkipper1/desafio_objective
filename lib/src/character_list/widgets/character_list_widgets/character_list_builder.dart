import 'package:desafio_objective/src/character_list/bloc/character_list_bloc.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/chracter_list_states/character_list_empty_widget.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/chracter_list_states/character_list_error_widget.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/chracter_list_states/character_list_initial_message_widget.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/chracter_list_states/character_list_loading_widget.dart';
import 'package:desafio_objective/src/character_list/widgets/character_list_widgets/character_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterListBuilder extends StatelessWidget {
  const CharacterListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterListBloc, CharacterListState>(
      builder: (context, state) => switch (state) {
        CharacterListInitial() => const CharacterListInitialMessageWidget(key: Key("list_builder_initial")),
        CharacterListLoading() => const CharacterListLoadingWidget(key: Key("list_builder_loading")),
        CharacterListLoaded() => CharacterListView(request: state.characters, key: const Key("list_builder_loaded")),
        CharacterListPageChangedRequested() => const CharacterListLoadingWidget(key: Key("list_builder_loading")),
        CharacterListError() => CharacterListErrorWidget(errorMessage: state.message, key: const Key("list_builder_error")),
        CharacterListEmptyState() => const CharacterListEmptyWidget(key: Key("list_builder_empty")),
      },
    );
  }
}
