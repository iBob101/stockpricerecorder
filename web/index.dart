import 'dart:html';

String msg = '';

main() {
  querySelector('#text').text = 'Loading...';
  String url = 'http://www.bloomberg.com/markets/chart/data/1D/AAPL:US';
  http.read(url).then((content) {
    content = JSON.decode(content);
    //printy('Precision: ' + content['precision'].toString());
    //printy('Exchange open at: ' + datetoString(content['exch_open_time']));
    //printy('Exchange close at: ' + datetoString(content['exch_close_time']));
    printy('Previous close: ' + content['prev_close'].toString());
    printy('Opening price: ' + content['data_values'][0][1].toString());
    printy('Closing price: ' + content['data_values'][content['data_values'].length-1][1].toString());
    //printy('Data:');
    //for (List line in content['data_values']){
    //printy('  '+datetoString(line[0])+'  '+line[1].toString());
    //}
  });
  querySelector('#text').text = msg;
}

void printy(String s){
  if (msg == '') {
    msg = s;
  } else {
    msg = "$msg\n$s";
  }
}

String datetoString(d){
  return new DateTime.fromMillisecondsSinceEpoch(d).toString();
}