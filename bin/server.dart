import 'dart:io';
import 'package:http_server/http_server.dart';

main() async {

  String msg;

  HttpServer server = await HttpServer.bind('0.0.0.0', port);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {

    HttpClient client = new HttpClient();
    String url = 'http://www.bloomberg.com/markets/chart/data/1D/AAPL:US';
    client.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      return request.close();
    }).then(HttpBodyHandler.processResponse).then((HttpClientResponseBody body) {
      msg = body.body;
    });
    request.response
      ..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
      ..write(msg)
      ..close();
  }

}