import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mc_applicaton/home/model/user_informetion.dart';


class GetUserProvider extends ChangeNotifier {
    Future<List<UserModel>> getUsers(
      {int results = 10, String gender = 'male'}) async {
    final Uri uri =
        Uri.parse('https://randomuser.me/api/?results=$results&gender=$gender');
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];

      return results.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
