import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CharacterListLoadingWidget extends StatelessWidget {
  const CharacterListLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      key: const Key("loading_shimmer"),
      baseColor: Colors.white,
      highlightColor: const Color.fromRGBO(206, 206, 206, 0.301),
      child: Container(
        height: 100,
        width: double.infinity,
        color: Colors.red,
      ),
    );
  }
}
