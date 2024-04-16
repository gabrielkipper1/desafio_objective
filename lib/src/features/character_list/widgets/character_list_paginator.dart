import 'package:desafio_objective/src/features/character_list/bloc/character_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:provider/provider.dart';

class CharacterListPaginator extends StatefulWidget {
  const CharacterListPaginator({super.key});

  @override
  State<CharacterListPaginator> createState() => _CharacterListPaginatorState();
}

class _CharacterListPaginatorState extends State<CharacterListPaginator> {
  final NumberPaginatorController _paginatorController = NumberPaginatorController();
  int totalPages = 0;
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CharacterListBloc, CharacterListState>(
      bloc: Provider.of<CharacterListBloc>(context, listen: false),
      listener: (context, state) => stateListener(context, state),
      child: Builder(
        builder: (context) {
          if (totalPages == 0) {
            return const SizedBox();
          }
          return Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 24.0, top: 18.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 600,
                child: NumberPaginator(
                  key: const Key("paginator"),
                  numberPages: totalPages,
                  onPageChange: (int page) => onPageChanged(page),
                  initialPage: currentPage,
                  controller: _paginatorController,
                  showNextButton: false,
                  showPrevButton: false,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void onPageChanged(int page) {
    if (context.mounted && page == currentPage) {
      return;
    }

    BlocProvider.of<CharacterListBloc>(context).add(ChangePageEvent(page: page, limit: 4));
    setState(() {
      currentPage = page;
    });
  }

  stateListener(BuildContext context, CharacterListState? state) {
    if (!mounted && context.mounted) {
      return;
    }

    if (state is CharacterListLoaded) {
      final newPage = (state.characters.offset / 4).ceil();
      final newTotalPage = (state.characters.total / 4).ceil();

      if (newPage != currentPage || newTotalPage != totalPages) {
        setState(() {
          _paginatorController.currentPage = newPage;
          currentPage = newPage;
          totalPages = newTotalPage;
        });
      }
    }

    if (state is CharacterListError || state is CharacterListEmptyState) {
      setState(() {
        currentPage = 0;
        totalPages = 0;
      });
    }
  }
}
