import 'package:flutter/widgets.dart';

enum MD2IndicatorSize {
  tiny,
  normal,
  full,
}

class MD2Indicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final MD2IndicatorSize indicatorSize;

  const MD2Indicator(
      {@required this.indicatorHeight,
      @required this.indicatorColor,
      @required this.indicatorSize});

  @override
  _MD2Painter createBoxPainter([VoidCallback onChanged]) {
    return new _MD2Painter(this, onChanged);
  }
}

class _MD2Painter extends BoxPainter {
  final MD2Indicator decoration;

  _MD2Painter(this.decoration, VoidCallback onChanged)
      : assert(decoration != null),
        super(onChanged);

  final Paint painter = Paint();
  Rect rect;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration != null);
    assert(configuration.size != null);

    var dy = (configuration.size.height - decoration.indicatorHeight ?? 3);
    var configWidth = configuration.size.width;

    if (decoration.indicatorSize == MD2IndicatorSize.full) {
      rect = Offset(offset.dx, dy) & Size(configWidth, decoration.indicatorHeight ?? 3);
    } else if (decoration.indicatorSize == MD2IndicatorSize.normal) {
      var size = Size(configWidth - 12, decoration.indicatorHeight ?? 3);
      rect = Offset(offset.dx + 6, dy) & size;
    } else if (decoration.indicatorSize == MD2IndicatorSize.tiny) {
      var size = Size(8, 8);
      rect = Offset(offset.dx + configWidth / 2 - 8, dy) & size;
    }

    painter.color = decoration.indicatorColor ?? Color(0xff1967d2);
    painter.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(rect,
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            topRight: Radius.circular(8),
            topLeft: Radius.circular(8)),
        painter);
  }
}
