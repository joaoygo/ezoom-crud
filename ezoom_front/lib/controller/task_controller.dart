import 'package:ezoom_front/models/task_model.dart';
import 'package:ezoom_front/repositories/task_repository.dart';
import 'package:ezoom_front/viewModel/task_view_model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  final TasksRepository _repository = TasksRepository();
  RxList<TaskModel> listTasks = <TaskModel>[].obs;
  RxBool isLoading = true.obs;

  Future<void> getListTasks() async {
    isLoading.value = true;
    listTasks.value = await _repository.getListTasks();
    isLoading.value = false;
  }

  Future<void> addTasks(TaskViewModel task) async {
    isLoading.value = true;
    await _repository.addTask(task);
    getListTasks();
    isLoading.value = false;
  }

  Future<void> editTasks(TaskModel task) async {
    isLoading.value = true;
    await _repository.editTask(task);
    getListTasks();
    isLoading.value = false;
  }

  Future<void> removeTask(TaskModel task) async {
    await _repository.removeTask(task);
    getListTasks();
  }
}
