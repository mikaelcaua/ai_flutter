import 'package:flutter/material.dart';

class PostComponent extends StatefulWidget {
  String userSurname;
  String message;
  PostComponent({super.key, required this.userSurname, required this.message});

  @override
  State<PostComponent> createState() => _PostComponentState();
}

class _PostComponentState extends State<PostComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(widget.userSurname),
        Text(widget.message)
      ],
    );
  }
}