import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewImageScreen extends StatefulWidget {
  final String imageUrl;

  const ViewImageScreen({Key key, this.imageUrl}) : super(key: key);
  @override
  _ViewImageScreenState createState() => _ViewImageScreenState();
}

class _ViewImageScreenState extends State<ViewImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PhotoView(
        imageProvider: CachedNetworkImageProvider(widget.imageUrl),
      ),
    );
  }
}
