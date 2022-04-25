import 'package:experiment_app/page_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WidgetWithOffset {
  final Widget widget;
  final Offset offset;

  WidgetWithOffset({
    required this.widget,
    required this.offset,
  });
}

class PageThree extends StatefulWidget {
  PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final List<WidgetWithOffset> list = <WidgetWithOffset>[];
  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PageThree',
        ),
      ),
      floatingActionButton: Draggable(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PageAnimation()),
            );
          },
        ),
        feedback: SizedBox(
          height: 100,
          width: 100,
          child: FloatingActionButton(
            onPressed: () {},
          ),
        ),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: DragTarget<Widget>(
          builder: (_, item, reject) {
            return MyExample(
              key: key,
              childrenr: list,
            );
          },
          onAcceptWithDetails: (details) {
            setState(
              () {
                list.add(
                  WidgetWithOffset(
                    widget: details.data,
                    offset: details.offset,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    list.clear();
    super.dispose();
  }
}

class MyExample extends MultiChildRenderObjectWidget {
  MyExample({
    Key? key,
    required this.childrenr,
  }) : super(key: key, children: childrenr.map((e) => e.widget).toList());
  final List<WidgetWithOffset> childrenr;

  @override
  RenderMyExample createRenderObject(BuildContext context) {
    return RenderMyExample();
  }
}

class MyExampleParentData extends ContainerBoxParentData<RenderBox> {}

class RenderMyExample extends RenderBox
    with ContainerRenderObjectMixin<RenderBox, MyExampleParentData> {
  @override
  void setupParentData(RenderObject child) {
    if (child.parentData is! MyExampleParentData) {
      child.parentData = MyExampleParentData();
    }
  }

  @override
  void performLayout() {
    size = constraints.biggest;
    print('${size.width}: ${size.height}');

    for (var child = firstChild; child != null; child = childAfter(child)) {
      child.layout(
        constraints,
      );
    }
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    for (var child = firstChild; child != null; child = childAfter(child)) {
      context.paintChild(
        child,
        offset,
      );
    }
  }

  @override
  void dispose() {
    print('ADSFDFDFDFD');
    super.dispose();
  }
}
