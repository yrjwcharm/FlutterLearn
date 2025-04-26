import 'package:myflutterproject/pigeon_source.dart';

import 'generated_pigeon.dart';

Future<void> onClick() async {
  SearchRequest request = SearchRequest(query: 'test');
  Api api = SomeApi();
  SearchReply reply = api.search(request);
  print('reply: ${reply.result}');
}
