import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final T bloc;
  final Widget child;
  final Function(T) onBlocReady;

  BaseWidget({
    Key key,
    this.builder,
    this.bloc,
    this.child,
    this.onBlocReady,
  }) : super(key: key);

  _BaseWidgetState<T> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T bloc;

  @override
  void initState() {
    bloc = widget.bloc;

    if (widget.onBlocReady != null) {
      widget.onBlocReady(bloc);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => bloc,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
