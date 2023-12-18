import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:seven/rules/data/source/models/rule_response_body.dart';
import 'package:seven/rules/data/source/rules_data_source.dart';

const _loadingDuration = Duration(milliseconds: 1000);

class RulesMockDataSource extends RulesDataSource {
  @override
  Future<List<RuleResponseBody>> getRules() async {
    const path = 'assets/mock/rules.json';
    await Future.delayed(_loadingDuration);

    final response =
        jsonDecode(await rootBundle.loadString(path)) as List<dynamic>;

    return response.map((e) => RuleResponseBody.fromJson(e)).toList();
  }
}
