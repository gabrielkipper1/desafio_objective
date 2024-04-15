import 'package:desafio_objective/src/entities/story.dart';
import 'package:flutter/material.dart';

class StoryListTile extends StatelessWidget {
  final Story story;
  const StoryListTile({required this.story, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListTile(
        title: Text(story.name, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(story.type),
      ),
    );
  }
}
