import 'package:flutter/material.dart';
import 'package:my_app/pages/base/base_page.dart';
import 'package:my_app/pages/main/favorite/favorite_view_model.dart';

class FavoritePage extends BasePage<FavoriteViewModel> {
  const FavoritePage({super.key, required super.viewModel});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends BasePageState<FavoritePage> {
  @override
  String? get title => "Favorite";

  @override
  void bind() {
    // TODO: implement bind
  }

  @override
  Widget buildBody(BuildContext context) {
    return Container();
  }
}
