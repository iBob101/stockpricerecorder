import 'dart:io';
import 'dart:convert' show JSON;

main() async {

  var port = int.parse(Platform.environment['PORT']);

  HttpServer server = await HttpServer.bind('0.0.0.0', port);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    print("Request receved type 1");
    request.response
      ..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
      ..write('Hello, bobworld')
      ..close();
  }

  server.listen((HttpRequest request) {
    print("Request received type 2");
    var resp = JSON.encode({
      'Dart on Heroku': true,
      'Buildpack URL': 'https://github.com/igrigorik/heroku-buildpack-dart',
      'Environment': Platform.environment}
    );
    request.response..headers.set(HttpHeaders.CONTENT_TYPE, 'application/json')
      ..write(resp)
      ..close();
  });

}