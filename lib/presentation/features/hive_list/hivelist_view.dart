import 'package:behivecompanion/presentation/app_theme.dart';
import 'package:behivecompanion/presentation/base/base_widget.dart';
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
            builder: (context, viewModel, child) {
              return ListView.builder(
                itemCount: viewModel.itemList.length,
                itemBuilder: (context, position) {
                  final item = viewModel.getItemAt(position);
                  return ListItem(
                    title: item.name,
                    subtitle: item.name,
                    pictureUrl: item.pictureUrl ?? "",
                    onTap: () => Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("${item.name} clicked"))),
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
