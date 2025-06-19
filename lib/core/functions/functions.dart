
/// Returns a full image URL for a given path, handling both relative and absolute URLs.
String getFullImageUrl(String? path) {
  const String baseUrl = 'http://160.19.97.180:3030/';
  if (path == null || path.isEmpty) return '';
  if (path.startsWith('http')) return path;
  return baseUrl + (path.startsWith('/') ? path.substring(1) : path);
}
