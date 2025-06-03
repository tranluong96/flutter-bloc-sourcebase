import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/core/resources/res_colors.dart';
import 'package:my_app/pages/base/base_page_mixin.dart';
import 'package:my_app/pages/template/bloc/template_state.dart';
import 'package:my_app/pages/template/bloc/template_bloc.dart';
import 'package:my_app/pages/template/bloc/template_event.dart';
import 'package:my_app/routes/router.gr.dart';

@RoutePage()
class TemplatePage extends StatefulWidget {
  const TemplatePage({super.key});

  @override
  State<TemplatePage> createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> with BasePageMixin {
  TemplateBloc get _bloc => context.read<TemplateBloc>();

  @override
  String? get title => "Template Demo";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TemplateBloc, TemplateState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) => buildPage(context),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return BlocBuilder<TemplateBloc, TemplateState>(
      builder: (context, state) => SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: ResColors().white,
                child: state is TemplateStateActive
                    ? state.isActive
                        ? const Text("Xin chào, Bạn đã Active")
                        : const Text("Bạn chưa Active")
                    : const Text("Bạn chưa Active"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (state is TemplateStateActive) {
                    _bloc.add(TemplateEventActive(false));
                  } else {
                    _bloc.add(TemplateEventActive(true));
                  }
                },
                child: const Text("Active"),
              ),
              const SizedBox(height: 20),
              //navigate to count page
              ElevatedButton(
                onPressed: () {
                  context.router.push(const CountRoute());
                },
                child: const Text("Go to Count Page"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
