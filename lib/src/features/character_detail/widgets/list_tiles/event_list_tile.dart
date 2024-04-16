import 'package:desafio_objective/src/entities/event.dart';
import 'package:flutter/material.dart';

class EventListTile extends StatelessWidget {
  final Event event;
  const EventListTile({required this.event, super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ListTile(
        title: Text(event.name),
      ),
    );
  }
}
