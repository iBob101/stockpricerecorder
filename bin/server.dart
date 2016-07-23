import 'dart:io';
import 'dart:convert' show JSON;

main() async {

  var port = int.parse(Platform.environment['PORT']);

  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, port);
  print("Serving at ${server.address}:${server.port}");
  print("Bob");
  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
      ..write('Hello, bobworld')
      ..close();
  }

  server.listen((HttpRequest request) {
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