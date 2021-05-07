import 'package:flutter/material.dart';
import 'package:thriftini/helpers/item.dart';

class GridItemBuilder extends StatelessWidget {
  final Item a;
  final int index;

  GridItemBuilder({this.a, this.index});

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: a.imgSrc == null
          ? Image.asset(
              "images/item.JPG",
              fit: BoxFit.cover,
            )
          : Image.file(
              a.imgSrc,
              fit: BoxFit.cover,
            ),
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          title: Container(
            alignment: Alignment.topRight,
            child: Text(
              a.itemName,
              textAlign: TextAlign.center,
            ),
          ),
          subtitle: Container(
            alignment: Alignment.topRight,
            child: FittedBox(
              child: Text(
                a.itemDesc.length > 30
                    ? "..." + a.itemDesc.substring(0, 30)
                    : a.itemDesc,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        ),
      ),
      child: image,
    );
  }
}
