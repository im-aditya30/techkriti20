import 'dart:async';
import 'dart:convert' show json, utf8;
import 'dart:io';

class Api {
  final HttpClient _httpClient = HttpClient();
  final String _url = 'techkriti.org';

  Future<dynamic> getContentJSON(String category) async {
    var append = '/api/content/$category';
    if (category == 'workshops') {
      append = '/api/techkriti19/content/workshops';
    }
    
    final uri = Uri.https(_url, append);
    var jsonResponse;
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        jsonResponse = 'errorObtaining';
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      jsonResponse = json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      jsonResponse = 'errorObtaining';
    }
    if (jsonResponse == 'errorObtaining') {
      print('Error retreiving content data');
      return 'errorObtaining';
    }

    return (category == 'workshops') ? jsonResponse : jsonResponse['data'];


    // TODO: Instead of returning 'null', return a copy of downloaded JSON kept in 'assets/'
  }

  Future<dynamic> getUserProfile(String token) async {
    final uri = Uri.https(_url, '/api/techkriti19/user/me');
    var jsonResponse;
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      httpRequest.headers.set("Authorization", token);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        jsonResponse = null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      jsonResponse = json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      jsonResponse = null;
    }
    if (jsonResponse == null) {
      print('Error retreiving content data');
      return null;
    }
    return jsonResponse;
  }

  Future<dynamic> updateUserProfile(String token, Map jsonProfile) async {
    final uri = Uri.https(_url, '/api/techkriti19/user/update');
    var jsonResponse;
    try {
      final httpRequest = await _httpClient.putUrl(uri);
      httpRequest.headers.set("Authorization", token);
      httpRequest.headers.set('content-type', 'application/json');
      httpRequest.add(utf8.encode(json.encode(jsonProfile)));
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        jsonResponse = null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      jsonResponse = json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      jsonResponse = null;
    }
    if (jsonResponse == null) {
      print('Error retreiving content data');
      return null;
    }
    return jsonResponse;
  }
}
