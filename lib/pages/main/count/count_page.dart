import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:my_app/core/utils/extensions/modal_extensions.dart';
import 'package:my_app/core/utils/helpers/logger_helper/logger_helper.dart';
import 'package:my_app/generated/di/di.dart';
import 'package:my_app/pages/base/base_page_mixin.dart';
import 'package:my_app/pages/main/count/bloc/count_state.dart';
import 'package:my_app/pages/template/bloc/template_bloc.dart';
import 'package:my_app/pages/template/bloc/template_event.dart';
import 'bloc/count_bloc.dart';

@RoutePage()
class CountPage extends StatefulWidget implements AutoRouteWrapper {
  const CountPage({super.key});

  @override
  State<CountPage> createState() => _CountPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CountBloc>(),
      child: this,
    );
  }
}

class _CountPageState extends State<CountPage> with BasePageMixin {
  CountBloc get _bloc => context.read<CountBloc>();
  StreamSubscription<void>? _countChangedSub;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CountBloc, CountState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) => buildPage(context),
    );
  }

  @override
  String? get title => 'Counter';

  @override
  void initState() {
    super.initState();
    _countChangedSub = _bloc.countChanged.listen((_) {
      if (!mounted) return;
      getIt<LoggerHelper>().debug("countChanged");
      context.read<TemplateBloc>().add(TemplateEventActive(true));
    });
  }

  @override
  void dispose() {
    _countChangedSub?.cancel();
    super.dispose();
  }

  void _showAlertDialog(BuildContext context) async {
    await context.showAlertDialog(
      message:
          'This is a alert dialogThis is a alert dialogThis is a alert dialog',
      title: 'Alert',
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              child: const Text("Show Alert Dialog"),
            ),
            const SizedBox(height: 20),
            Text('Count: ${_bloc.count}'),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _bloc.onDecrement(),
                  child: const Text('-'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () => _bloc.onIncrement(),
                  child: const Text('+'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
