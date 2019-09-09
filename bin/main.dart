import 'package:html2md_sample/html2md.dart';
import 'package:html2md/html2md.dart' as html2md;

main(List<String> arguments) {
  String markdown = html2md.convert(html);
  print(markdown);
}