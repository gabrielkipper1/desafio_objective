import 'dart:io';

String testingSampleData(String name) {
  return File('test/src/sample_data/$name').readAsStringSync();
}
