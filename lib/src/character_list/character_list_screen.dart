import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharacterListScreen extends StatefulWidget {
  const CharacterListScreen({super.key});

  @override
  State<CharacterListScreen> createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("Character List Screen"));
  }
}
