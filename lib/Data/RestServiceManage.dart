abstract class RestServiceManage {
  Future<T> get<T, HttpRequestConfig>(
    Uri url, {
    HttpRequestConfig? config,
  });

  Future<T> post<T, D, HttpRequestConfig>(
    Uri url,
    D data, {
    HttpRequestConfig? config,
  });

  Future<T> put<T, D, HttpRequestConfig>(
    Uri url,
    D data, {
    HttpRequestConfig? config,
  });

  Future<T> patch<T, D, HttpRequestConfig>(
    Uri url,
    D data, {
    HttpRequestConfig? config,
  });

  Future<T> delete<T, HttpRequestConfig>(
    Uri url, {
    HttpRequestConfig? config,
  });
}
