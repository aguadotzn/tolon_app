import 'package:flutter/material.dart';

class SectionLayout extends StatelessWidget {
  const SectionLayout({
    Key key,
    this.header,
    this.body,
    this.footer,
    this.axis = Axis.vertical,
  })  : assert(axis != null),
        super(key: key);

  final Widget header;
  final Widget body;
  final Widget footer;
  final Axis axis;

  @override
  Widget build(BuildContext context) {
    return CustomMultiChildLayout(
      delegate: _SectionLayoutDelegate(axis),
      children: <Widget>[
        if (header != null) LayoutId(id: _Entries.header, child: header),
        if (body != null) LayoutId(id: _Entries.body, child: body),
        if (footer != null) LayoutId(id: _Entries.footer, child: footer)
      ],
    );
  }
}

enum _Entries { header, body, footer }

class _SectionLayoutDelegate extends MultiChildLayoutDelegate {
  _SectionLayoutDelegate(this.axis);

  final Axis axis;

  @override
  void performLayout(Size size) {
    Size headerSize = Size.zero;
    Size bodySize = Size.zero;
    Size footerSize = Size.zero;

    Offset bodyOffset = Offset.zero;
    Offset footerOffset = Offset.zero;

    if (hasChild(_Entries.header)) {
      headerSize = layoutChild(_Entries.header, BoxConstraints.loose(size));
      positionChild(_Entries.header, Offset.zero);
    }

    if (hasChild(_Entries.footer)) {
      footerSize = layoutChild(_Entries.footer, BoxConstraints.loose(size));

      if (axis == Axis.vertical) {
        footerOffset = Offset(0, size.height - footerSize.height);
      } else {
        footerOffset = Offset(size.width - footerSize.width, 0);
      }

      positionChild(_Entries.footer, footerOffset);
    }

    if (hasChild(_Entries.body)) {
      if (axis == Axis.vertical) {
        bodySize = Size(
          size.width,
          size.height - headerSize.height - footerSize.height,
        );
        bodyOffset = Offset(0, headerSize.height);
      } else {
        bodySize = Size(
          size.width - headerSize.width - footerSize.width,
          size.height,
        );
        bodyOffset = Offset(headerSize.width, 0);
      }

      layoutChild(_Entries.body, BoxConstraints.loose(bodySize));
      positionChild(_Entries.body, bodyOffset);
    }
  }

  @override
  bool shouldRelayout(MultiChildLayoutDelegate oldDelegate) => false;
}