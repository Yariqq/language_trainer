import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class RuleDetailsPage extends StatelessWidget {
  final String title;

  const RuleDetailsPage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(),
    );
  }
}