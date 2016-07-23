import 'dart:io';

main() async {

  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, port);
  print("Serving at ${server.address}:${server.port}");

  await for (var request in server) {
    request.response
      ..headers.contentType = new ContentType("text", "plain", charset: "utf-8")
      ..write('Hello, bobworld')
      ..close();
  }
}