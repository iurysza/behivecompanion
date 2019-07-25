import 'package:behivecompanion/presentation/app_theme.dart';
import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/base/router.dart';
import 'package:behivecompanion/presentation/features/hive_list/hivelist_bloc.dart';
import 'package:behivecompanion/presentation/widgets/list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HiveListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeUtils.getDefaultAppTheme(context),
      home: Scaffold(
        appBar: AppBar(title: const Text('Hive List')),
        body: Container(
          child: BaseWidget<HiveListBloc>(
            onBlocReady: (viewModel) => viewModel.getHiveList(),
            bloc: HiveListBloc(Provider.of(context)),
            builder: (context, bloc, child) {
              return ListView.builder(
                itemCount: bloc.itemList.length,
                itemBuilder: (context, position) {
                  final item = bloc.getItemAt(position);
                  return ListItem(
                    title: item.name,
                    subtitle: item.name,
                    pictureUrl: item.pictureUrl ?? "",
                    onTap: () {
                      Navigator.pushNamed(context, RoutePaths.Statistics);
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
