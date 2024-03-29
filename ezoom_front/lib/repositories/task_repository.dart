import 'dart:convert';

import 'package:ezoom_front/models/task_model.dart';
import 'package:ezoom_front/viewModel/task_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TasksRepository {
  final urlBaseAPI = dotenv.env['URL_BASE_API'];
  String? token;

  Future<List<TaskModel>> getListTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    while (token == null) {
      await Future.delayed(const Duration(seconds: 2));
      token ??= prefs.getString('token');
    }

    try {
      final Uri url = Uri.parse('${urlBaseAPI}tasks');
      final res = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (res.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(res.body);
        debugPrint("Get List Tasks successfully");

        if (responseData.containsKey("tasks")) {
          final List<dynamic> tasksData = responseData["tasks"];

          final List<TaskModel> tasks =
              tasksData.map((taskData) => TaskModel.fromMap(taskData)).toList();
          return tasks;
        }
        return [];
      } else {
        debugPrint('Failed to get list tasks response');
        throw Exception('Failed to get list tasks response');
      }
    } catch (e) {
      debugPrint("$e");
      rethrow;
    }
  }

  Future<void> addTask(TaskViewModel task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    while (token == null) {
      await Future.delayed(const Duration(seconds: 2));
      token ??= prefs.getString('token');
    }
    try {
      final Uri url = Uri.parse('${urlBaseAPI}tasks');
      final res = await http.post(url,
          headers: {
            "Content-type": "application/json",
            "Authorization": "Bearer $token",
          },
          body: task.toJson());

      if (res.statusCode == 200) {
        debugPrint("Task created successfully");
      } else {
        debugPrint('Failed to create task');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> editTask(TaskModel task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    while (token == null) {
      await Future.delayed(const Duration(seconds: 2));
      token ??= prefs.getString('token');
    }
    try {
      final Uri url = Uri.parse('${urlBaseAPI}tasks/${task.id}');

      final res = await http.put(url,
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: task.toJson());
      if (res.statusCode == 200) {
        debugPrint("Task edit successfully");
      } else {
        debugPrint('Failed to edit task');
        debugPrint(task.toJson());
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removeTask(TaskModel task) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    while (token == null) {
      await Future.delayed(const Duration(seconds: 2));
      token ??= prefs.getString('token');
    }
    try {
      final Uri url = Uri.parse('${urlBaseAPI}tasks/${task.id}');
      final res = await http.delete(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (res.statusCode == 200) {
        debugPrint("Task remove successfully");
      } else {
        debugPrint('Failed to remove task');
      }
    } catch (e) {
      rethrow;
    }
  }
}
