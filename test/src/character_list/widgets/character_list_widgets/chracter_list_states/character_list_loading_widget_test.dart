import 'package:desafio_objective/src/features/character_list/widgets/character_list_widgets/chracter_list_states/character_list_loading_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should find a shimmer effect widget', (tester) async {
    await tester.pumpWidget(const CharacterListLoadingWidget());
    final loading = find.byKey(const Key('loading_shimmer'));
    expect(loading, findsOneWidget);
  });
}
