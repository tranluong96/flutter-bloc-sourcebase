import 'package:flutter/material.dart';
import 'package:my_app/core/utils/helpers/dp_disposable.dart';
import 'package:my_app/pages/base/base_page_mixin.dart';
import 'package:my_app/pages/base/base_view_model.dart';

abstract class BasePage<ViewModel extends BaseViewModel>
    extends StatefulWidget {
  final ViewModel viewModel;
  const BasePage({Key? key, required this.viewModel}) : super(key: key);
}

abstract class BasePageState<T extends BasePage> extends State<T>
    with BasePageMixin, DPDisposable {
  @override
  void initState() {
    super.initState();
    bind();
  }

  @override
  void dispose() {
    super.dispose();
    widget.viewModel.cancelSubscriptions();
    cancelSubscriptions();
  }

  void bind();

  @override
  Widget build(BuildContext context) {
    return buildPage(context);
  }
}
