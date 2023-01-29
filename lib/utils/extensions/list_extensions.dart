import 'package:pokedex/utils/extensions/string_extension.dart';

extension ListExtension on List<dynamic> {
  String toListItems() {
    String result = '';
    for (String item in this) {
      if (item.isNotEmpty) {
        result += '* ${item.toUnPath()} \n';
      }
    }
    return result;
  }
}
