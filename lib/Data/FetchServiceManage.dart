import 'package:http/http.dart' as http;
import 'RestServiceManage.dart';

class FetchServiceManage implements RestServiceManage {
  @override
  Future<T> get<T, HttpRequestConfig>(Uri url,
      {HttpRequestConfig? config}) async {
    final result = await http.get(url);
    return result.body as T;
  }

  @override
  Future<T> post<T, D, HttpRequestConfig>(Uri url, D data,
      {HttpRequestConfig? config}) async {
    final result = await http.post(url, body: data);
    return result.body as T;
  }

  @override
  Future<T> put<T, D, HttpRequestConfig>(Uri url, D data,
      {HttpRequestConfig? config}) async {
    final result = await http.put(url, body: data);
    return result.body as T;
  }

  @override
  Future<T> patch<T, D, HttpRequestConfig>(Uri url, D data,
      {HttpRequestConfig? config}) async {
    final result = await http.patch(url, body: data);
    return result.body as T;
  }

  @override
  Future<T> delete<T, HttpRequestConfig>(Uri url,
      {HttpRequestConfig? config}) async {
    //final url = Uri.https('example.com', 'whatsit/create');
    final result = await http.delete(url);
    return result.body as T;
  }
}
