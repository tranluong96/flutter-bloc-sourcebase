import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

/// Manages Dio [CancelToken]s keyed by UUID v4 strings.
///
/// Use this to:
/// - Create a token tied to a unique request key.
/// - Cancel a specific request by key.
/// - Cancel all pending requests (e.g. on logout).
///
/// Example:
/// ```dart
/// // 1. Generate a key and token
/// final key = CancelTokenManager.instance.register();
///
/// // 2. Pass token to the API call
/// await restClient.loginAPI(input, CancelTokenManager.instance.get(key));
///
/// // 3. Cancel a specific request later
/// CancelTokenManager.instance.cancel(key, "User cancelled");
///
/// // 4. Cancel all on logout
/// CancelTokenManager.instance.cancelAll("logout");
/// ```
class CancelTokenManager {
  CancelTokenManager._();

  static final CancelTokenManager instance = CancelTokenManager._();

  final _uuid = const Uuid();
  final Map<String, CancelToken> _tokens = {};

  /// Registers a new [CancelToken] keyed by a new UUID v4 and returns the key.
  String register() {
    final key = _uuid.v4();
    _tokens[key] = CancelToken();
    return key;
  }

  /// Returns the [CancelToken] associated with [key], or null if not found.
  CancelToken? get(String key) => _tokens[key];

  /// Cancels the token associated with [key] and removes it.
  void cancel(String key, [String? reason]) {
    _tokens[key]?.cancel(reason);
    _tokens.remove(key);
  }

  /// Removes the token entry associated with [key] without cancelling it.
  /// Call this when a request completes successfully to clean up the registry.
  void remove(String key) {
    _tokens.remove(key);
  }

  /// Cancels all currently registered tokens and clears the registry.
  /// Useful for clearing pending requests on logout or app reset.
  void cancelAll([String? reason]) {
    for (final token in _tokens.values) {
      token.cancel(reason);
    }
    _tokens.clear();
  }
}
