import 'dart:convert';
import 'package:http/http.dart' as http;

main(List<String> args) {
  String url = 'http://www.bloomberg.com/markets/chart/data/1D/AAPL:US';
  http.read(url).then((content) {
    content = JSON.decode(content);
    //print('Precision: ' + content['precision'].toString());
    //print('Exchange open at: ' + datetoString(content['exch_open_time']));
    //print('Exchange close at: ' + datetoString(content['exch_close_time']));
    print('Previous close: ' + content['prev_close'].toString());
    print('Opening price: ' + content['data_values'][0][1].toString());
    print('Closing price: ' + content['data_values'][content['data_values'].length-1][1].toString());
    //print('Data:');
    //for (List line in content['data_values']){
      //print('  '+datetoString(line[0])+'  '+line[1].toString());
    //}
  });
}

String datetoString(d){
  return new DateTime.fromMillisecondsSinceEpoch(d).toString();
}