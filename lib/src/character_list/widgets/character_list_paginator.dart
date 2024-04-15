import 'dart:math';
import 'package:desafio_objective/src/character_list/bloc/character_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

class CharacterListPaginator extends StatefulWidget {
  final Function(int)? onPageChanged;
  const CharacterListPaginator({this.onPageChanged, super.key});

  @override
  State<CharacterListPaginator> createState() => _CharacterListPaginatorState();
}

class _CharacterListPaginatorState extends State<CharacterListPaginator> {
  final NumberPaginatorController _paginatorController = NumberPaginatorController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterListBloc, CharacterListState>(
      buildWhen: (previous, current) =>
          (current is CharacterListLoading && current is CharacterListLoaded) || current is CharacterListLoaded,
      builder: (context, state) {
        if (state is CharacterListLoaded) {
          if (state.characters.results.isEmpty) return const SizedBox();

          int currentPage = max((state.characters.offset / 4).ceil(), 0);
          int totalPages = max((state.characters.total / 4).ceil(), 1);

          return Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 600,
              child: NumberPaginator(
                key: const Key("paginator"),
                numberPages: totalPages,
                onPageChange: (int page) => onPageChanged(page),
                initialPage: currentPage,
                controller: _paginatorController,
              ),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  void onPageChanged(int page) {
    if (!mounted) return;
    setState(() {});
    Provider.of<CharacterListBloc>(context, listen: false).add(ChangePageEvent(page: page, limit: 4));

    // widget.onPageChanged?.call(page);
  }
}
