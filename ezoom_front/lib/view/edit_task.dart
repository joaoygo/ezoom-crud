import 'package:ezoom_front/controller/task_controller.dart';
import 'package:ezoom_front/models/task_model.dart';
import 'package:ezoom_front/widgets/button_gradiente.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key});

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  final TaskController _controller = TaskController();
  final TextEditingController _titleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RxBool isCompleted = false.obs;
  RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    final TaskModel taskArgs =
        ModalRoute.of(context)?.settings.arguments as TaskModel;

    _titleController.text = taskArgs.title;
    isCompleted.value = taskArgs.done == 1 ? true : false;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Atualizar Atividade'),
          backgroundColor: const Color(0xFFF58524),
        ),
        body: Obx(
          () => Form(
            key: _formKey,
            child: Padding(
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
                const SizedBox(
                  height: 20,
                ),
                isLoading.value
                    ? const CircularProgressIndicator()
                    : ButtonGradiente(
                        txt: 'Atualizar',
                        icon: const Icon(Icons.add),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            isLoading.value = true;
                            await _controller.editTasks(TaskModel(
                              id: taskArgs.id,
                              done: isCompleted.value == true ? 1 : 0,
                              title: _titleController.text,
                              createdAt: taskArgs.createdAt,
                              updatedAt: taskArgs.updatedAt,
                            ));
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text("Atividade atualizada com sucesso"),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                            isLoading.value = false;
                            if (context.mounted) {
                              Navigator.of(context).pop(true);
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("O título não pode estar vazio"),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        })
              ]),
            ),
          ),
        ));
  }
}
