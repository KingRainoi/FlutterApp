class HttpRequestConfig {
  final String? method;
  final Map<String, String>? headers;
  final String? url;

  HttpRequestConfig({
    this.method,
    this.headers,
    this.url,
  });
}
