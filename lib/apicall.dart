import 'package:api/model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<FasalApi>> fetchdata() async {
  final resposnse =
      await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
  if (resposnse.statusCode == 200) {
    final data = jsonDecode(resposnse.body).cast<Map<String, dynamic>>();

    return data.map<FasalApi>((json) => FasalApi.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load');
  }
}
