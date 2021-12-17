import 'package:http/http.dart' as http;

class ApiDatasource {
  static const String _baseUrl = "http://10.0.2.2:8080/api";
  String? _authJWT;

  void setAuthJWT(String authJWT) {
    _authJWT = authJWT;
  }

  void clearAuthJWT() {
    _authJWT = null;
  }

  // get auth header
  Map<String, String> get _getHeaders {
    Map<String, String> hearders = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    if (_authJWT != null) {
      hearders["Authorization"] = "Bearer $_authJWT";
    }
    
    return hearders;
  }

  Future<dynamic> get(String url) async {
    try {
      final response = await http.get(Uri.parse(_baseUrl + url), headers: _getHeaders);
      return response;
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> post(String url, dynamic body) async {
    try {
      var response = await http.post(Uri.parse(_baseUrl + url), body: body, headers: _getHeaders);
      return response;
    } catch (e) {
      return null;
    }
  }
}
