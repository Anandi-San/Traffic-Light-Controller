import 'package:http/http.dart' as http;

class SemuaJalur {
  Future<void> fetchData() async {
    var url = Uri.parse('http://192.168.21.1/');
    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('Response body: ${response.body}');
      } else {
        print('Gagal memanggil API. Kode status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
