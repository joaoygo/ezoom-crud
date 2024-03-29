import 'package:ezoom_front/controller/task_controller.dart';
import 'package:ezoom_front/viewModel/task_view_model.dart';
import 'package:ezoom_front/widgets/button_gradiente.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final TaskController _controller = TaskController();

  final TextEditingController _titleController = TextEditingController();

  RxBool isCompleted = false.obs;
  RxBool isLoading = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Adicionar Atividade'),
          backgroundColor: const Color(0xFFF58524),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: [
              TextFormField(
                controller: _titleController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "Titulo",
                  labelStyle: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o titulo';
                  }
                  return null;
                },
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Checkbox(
                    value: isCompleted.value,
                    onChanged: (value) {
                      isCompleted.value = value ?? isCompleted.value;
                    },
                  ),
                  const Text('Foi finalizada?'),
                ],
              ),
              const SizedBox(height: 20.0),
              isLoading.value
                  ? const CircularProgressIndicator()
                  : ButtonGradiente(
                      txt: 'Adicionar',
                      icon: const Icon(Icons.add),
                      onTap: () async {
                        final String title = _titleController.text.trim();
                        if (title.isNotEmpty) {
                          isLoading.value = true;
                          await _controller.addTasks(TaskViewModel(
                              title: _titleController.text,
                              done: isCompleted.value));
                          Get.showSnackbar(const GetSnackBar(
                            title: 'Sucesso',
                            message: 'Atividade Criada',
                            duration: Duration(seconds: 3),
                            snackPosition: SnackPosition.TOP,
                            backgroundColor: Colors.green,
                          ));
                          isLoading.value = true;
                          if (context.mounted) Navigator.of(context).pop(true);
                        } else {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Erro',
                              message: 'O título não pode estar vazio.',
                              duration: Duration(seconds: 3),
                              snackPosition: SnackPosition.TOP,
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      })
            ]),
          ),
        ));
  }
}
