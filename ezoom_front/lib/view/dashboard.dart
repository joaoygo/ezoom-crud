import 'package:ezoom_front/controller/task_controller.dart';
import 'package:ezoom_front/models/task_model.dart';
import 'package:ezoom_front/view/create_task.dart';
import 'package:ezoom_front/view/edit_task.dart';
import 'package:ezoom_front/widgets/card_task.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final TaskController _controller = TaskController();

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  Future<void> _getToken() async {
    await Future.delayed(const Duration(seconds: 2));
    _controller.getListTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel de Atividades'),
        backgroundColor: const Color(0xFFF58524),
      ),
      body: Obx(
        () => _controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFF58524),
                ),
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.1),
                      child: ListView.builder(
                        itemCount: _controller.listTasks.length,
                        itemBuilder: (context, index) => CardTask(
                            title: _controller.listTasks[index].title,
                            checkbox: Checkbox(
                                value: _controller.listTasks[index].done == 1
                                    ? true
                                    : false,
                                onChanged: (newValue) {
                                  _controller.editTasks(TaskModel(
                                      id: _controller.listTasks[index].id,
                                      title: _controller.listTasks[index].title,
                                      done: newValue == true ? 1 : 0,
                                      createdAt: _controller
                                          .listTasks[index].createdAt,
                                      updatedAt: _controller
                                          .listTasks[index].updatedAt));
                                }),
                            edit: () async {
                              final result = await Navigator.of(context).push(
                                MaterialPageRoute(
                                  settings: RouteSettings(
                                      arguments: _controller.listTasks[index]),
                                  builder: (context) => const EditTask(),
                                ),
                              );
                              if (result) {
                                _controller.getListTasks();
                              }
                            },
                            delete: () {
                              _controller
                                  .removeTask(_controller.listTasks[index]);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Atividade deletada"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final result = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CreateTask(),
              ),
            );
            if (result) {
              _controller.getListTasks();
            }
          },
          label: const Text("Adicionar Atividade"),
          backgroundColor: const Color(0xFFF58524)),
    );
  }
}
