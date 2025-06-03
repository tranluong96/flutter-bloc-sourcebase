// ignore_for_file: prefer_interpolation_to_compose_strings
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res.dart';
import 'package:my_app/core/utils/helpers/navigator_global_context.dart';
import 'package:my_app/core/utils/session/session.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/routes/router.gr.dart' as router;

extension StackRouterError on StackRouter {
  NavigatorGlobalContextHelper get _navigatorHelper =>
      getIt<NavigatorGlobalContextHelper>();

  Future<void> handleError(Object? error) async {
    if (error == null) return;

    final context = _navigatorHelper.getCurrentContext;

    if (error is DioException) {
      await _handleNetworkError(error, context);
    } else if (error is Exception) {
      await _showErrorDialog(error.toString(), context);
    } else {
      await _showErrorDialog('System error', context);
    }
  }

  Future<void> _handleNetworkError(
      DioException error, BuildContext context) async {
    final statusCode = error.response?.statusCode ?? 0;

    if (_isServerError(statusCode)) {
      await _showErrorDialog('Server is not working', context);
      return;
    }

    if (_isUnauthorized(statusCode)) {
      await _handleUnauthorized(context);
      return;
    }

    if (_isNetworkError(error.type)) {
      await _showErrorDialog('Network error', context);
      return;
    }

    await _handleApiError(error, context);
  }

  bool _isServerError(int statusCode) => statusCode >= 500;
  bool _isUnauthorized(int statusCode) => statusCode == 401;
  bool _isNetworkError(DioExceptionType type) =>
      type == DioExceptionType.unknown ||
      type == DioExceptionType.sendTimeout ||
      type == DioExceptionType.receiveTimeout ||
      type == DioExceptionType.connectionTimeout;

  Future<void> _handleUnauthorized(BuildContext context) async {
    getIt<Session>().logout();
    // Show error first
    await _showErrorDialog('Session expired. Please login again.', context);
    // Then navigate to login
    if (context.mounted) {
      await context.router.replaceAll([const router.LoginRoute()]);
    }
  }

  Future<void> _handleApiError(DioException error, BuildContext context) async {
    try {
      final errorData = error.response?.data as Map<String, dynamic>?;
      final message = _extractErrorMessage(errorData);
      final statusCode = error.response?.statusCode;

      await _showErrorDialog(
        message,
        context,
        onDismiss: () async {
          if (statusCode == HttpStatus.unauthorized) {
            await _handleUnauthorized(context);
          }
        },
      );
    } catch (_) {
      await _showErrorDialog('System error', context);
    }
  }

  String _extractErrorMessage(Map<String, dynamic>? errorData) {
    if (errorData == null) return 'Unknown error';

    final message = errorData['message'];
    if (message is List) return message.first.toString();
    return message?.toString() ?? 'Unknown error';
  }

  Future<void> _showErrorDialog(
    String message,
    BuildContext context, {
    VoidCallback? onDismiss,
  }) async {
    if (!context.mounted) return;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => _ErrorModalSheet(
        message: message,
        onDismiss: () {
          Navigator.pop(context);
          onDismiss?.call();
        },
      ),
    );
  }
}

class _ErrorModalSheet extends StatelessWidget {
  final String message;
  final VoidCallback onDismiss;

  const _ErrorModalSheet({
    required this.message,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Text(
            'Error',
            style: ResTextStyles().medium16.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: ResTextStyles().regular16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onDismiss,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'OK',
                style: ResTextStyles().medium16.copyWith(
                      color: ResColors().white,
                    ),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

extension ErrorHandler on BuildContext {
  Future<void> showError(Object? error) async {
    if (error == null) return;

    if (error is DioException) {
      await _handleNetworkError(error);
    } else if (error is Exception) {
      await _showErrorModal(error.toString());
    } else {
      await _showErrorModal('System error');
    }
  }

  Future<void> _handleNetworkError(DioException error) async {
    final statusCode = error.response?.statusCode ?? 0;

    if (_isServerError(statusCode)) {
      await _showErrorModal('Server is not working');
      return;
    }

    if (_isUnauthorized(statusCode)) {
      await _handleUnauthorized();
      return;
    }

    if (_isNetworkError(error.type)) {
      await _showErrorModal('Network error');
      return;
    }

    await _handleApiError(error);
  }

  bool _isServerError(int statusCode) => statusCode >= 500;
  bool _isUnauthorized(int statusCode) => statusCode == 401;
  bool _isNetworkError(DioExceptionType type) =>
      type == DioExceptionType.unknown ||
      type == DioExceptionType.sendTimeout ||
      type == DioExceptionType.receiveTimeout ||
      type == DioExceptionType.connectionTimeout;

  Future<void> _handleUnauthorized() async {
    // Show error first
    await _showErrorModal('Session expired. Please login again.');
    // Then logout and navigate
    if (mounted) {
      getIt<Session>().logout();
      // Use AutoRouter.of(this) to get the router instance
      await AutoRouter.of(this).replaceAll([const router.LoginRoute()]);
    }
  }

  Future<void> _handleApiError(DioException error) async {
    try {
      final errorData = error.response?.data as Map<String, dynamic>?;
      final message = _extractErrorMessage(errorData);
      final statusCode = error.response?.statusCode;

      await _showErrorModal(
        message,
        onDismiss: () async {
          if (statusCode == HttpStatus.unauthorized) {
            await _handleUnauthorized();
          }
        },
      );
    } catch (_) {
      await _showErrorModal('System error');
    }
  }

  String _extractErrorMessage(Map<String, dynamic>? errorData) {
    if (errorData == null) return 'Unknown error';

    final message = errorData['message'];
    if (message is List) return message.first.toString();
    return message?.toString() ?? 'Unknown error';
  }

  Future<void> _showErrorModal(
    String message, {
    VoidCallback? onDismiss,
  }) async {
    if (!mounted) return;

    await showModalBottomSheet(
      context: this,
      isScrollControlled: false,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: true, // scroll to dismiss
      showDragHandle: false,
      builder: (context) => _ErrorModalSheet(
        message: message,
        onDismiss: () async {
          Navigator.pop(context);
          onDismiss?.call();
        },
      ),
    );
  }
}
