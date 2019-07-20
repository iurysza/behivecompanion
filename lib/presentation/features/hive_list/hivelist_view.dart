import 'package:behivecompanion/data/repositories/hives/hive_repositoryimpl.dart';
import 'package:behivecompanion/presentation/app_theme.dart';
import 'package:behivecompanion/presentation/base/base_widget.dart';
import 'package:behivecompanion/presentation/custom_widgets/list_item.dart';
import 'package:behivecompanion/presentation/features/hive_list/hivelist_vm.dart';
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
          child: BaseWidget<HiveListVM>(
            onModelReady: (viewModel) => viewModel.getHiveList(),
            model: HiveListVM(hiveRepository: Provider.of<HiveRepositoryImpl>(context)),
            builder: (context, viewModel, child) {
              return ListView.builder(
                itemCount: viewModel.itemList.length,
                itemBuilder: (context, position) {
                  final item = viewModel.getItemAt(position);
                  return ListItem(
                    title: item.name,
                    subtitle: item.name,
                    pictureUrl: item.pictureUrl ?? "",
                    onItemClick: () => Scaffold.of(context)
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
