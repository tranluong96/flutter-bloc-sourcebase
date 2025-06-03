import 'package:flutter/material.dart';
import 'package:my_app/core/resources/res_colors.dart';
import 'package:my_app/core/utils/extensions/string_extensions.dart';

mixin BasePageMixin {
  String? title;
  Widget buildBody(BuildContext context);

  PreferredSizeWidget? buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: ResColors().white,
      foregroundColor: ResColors().primary,
      centerTitle: true,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: ResColors().strokeAppbar,
          height: 1,
        ),
      ),
      title: title == null ? null : Text(title.content),
    );
  }

  Widget? buildBottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget? buildBottomSheet(BuildContext context) {
    return null;
  }

  Widget? buildDrawer(BuildContext context) {
    return null;
  }

  Widget? buildEndDrawer(BuildContext context) {
    return null;
  }

  Widget? buildFloatActionButton(BuildContext context) {
    return null;
  }

  Widget buildPage(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: buildAppBar(context),
      body: buildBody(context),
      bottomNavigationBar: buildBottomNavigationBar(context),
      bottomSheet: buildBottomSheet(context),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      floatingActionButton: buildFloatActionButton(context),
    );
  }

  bool get resizeToAvoidBottomInset => false;
}
