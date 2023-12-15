import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:getsh_tdone/models/todo_model.dart';
import 'package:getsh_tdone/providers/category_provider.dart';
import 'package:getsh_tdone/providers/date_provider.dart';
import 'package:getsh_tdone/providers/description_provider.dart';
import 'package:getsh_tdone/providers/iscompleted_provider.dart';
import 'package:getsh_tdone/providers/theme_provider.dart';
import 'package:getsh_tdone/providers/time_provider.dart';
import 'package:getsh_tdone/providers/title_provider.dart';
import 'package:getsh_tdone/services/firestore_service.dart';
import 'package:getsh_tdone/services/logger.dart';
import 'package:getsh_tdone/theme/theme.dart';
import 'package:intl/intl.dart';

class UpdateTodoModal extends ConsumerStatefulWidget {
  const UpdateTodoModal(
    this.todo, {
    super.key,
  });

  final Todo todo;

  @override
  ConsumerState<UpdateTodoModal> createState() {
    return UpdateTodoModalState();
  }
}

class UpdateTodoModalState extends ConsumerState<UpdateTodoModal> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.todo.title);
    descriptionController =
        TextEditingController(text: widget.todo.description);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(titleProvider.notifier).state = widget.todo.title;
      ref.read(descriptionProvider.notifier).state = widget.todo.description!;
    });
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        24.0,
        0.0,
        24.0,
        MediaQuery.of(context).viewInsets.bottom + 16.0,
      ),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(
          dragDevices: <PointerDeviceKind>{
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
            PointerDeviceKind.trackpad,
            PointerDeviceKind.stylus,
          },
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Update your TODO',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 4,
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: titleController,
                onChanged: (String updatedTitle) {
                  ref.read(titleProvider.notifier).state = updatedTitle;
                },
                decoration: const InputDecoration(
                  labelText: 'Update TODO Title',
                ),
              ),
              const SizedBox(height: 8.0),
              TextField(
                controller: descriptionController,
                onChanged: (String updatedDescription) {
                  ref.read(descriptionProvider.notifier).state =
                      updatedDescription;
                },
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Update TODO Description',
                ),
              ),
              const SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  UpdateTaskCategoryChoiceSegmentedButton(widget.todo),
                ],
              ),
              const SizedBox(height: 12.0),
              const Row(
                children: <Widget>[
                  UpdateTaskDatePickerButton(),
                  SizedBox(width: 16.0),
                  UpdateTaskTimePickerButton(),
                ],
              ),
              Row(
                children: <Widget>[
                  const UpdateTaskCancelButton(),
                  const SizedBox(width: 16.0),
                  UpdateTaskSaveButton(
                    ref: ref,
                    id: widget.todo.id!,
                    oldTitle: widget.todo.title,
                    oldDescription: widget.todo.description,
                    oldDueDate: widget.todo.dueDate,
                    oldDueTime: widget.todo.dueTime,
                    titleController: titleController,
                    descriptionController: descriptionController,
                    mounted: mounted,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UpdateTaskCategoryChoiceSegmentedButton extends ConsumerStatefulWidget {
  const UpdateTaskCategoryChoiceSegmentedButton(this.todo, {super.key});

  final Todo todo;

  @override
  ConsumerState<UpdateTaskCategoryChoiceSegmentedButton> createState() {
    return UpdateTaskCategoryChoiceSegmentedButtonState();
  }
}

class UpdateTaskCategoryChoiceSegmentedButtonState
    extends ConsumerState<UpdateTaskCategoryChoiceSegmentedButton> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Categories initialCategory;
      if (widget.todo.category == 'Personal') {
        initialCategory = Categories.personal;
      } else if (widget.todo.category == 'Work') {
        initialCategory = Categories.work;
      } else if (widget.todo.category == 'Study') {
        initialCategory = Categories.study;
      } else {
        initialCategory = Categories.personal;
      }
      ref.read(categoryProvider.notifier).updateCategory(initialCategory, ref);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SegmentedButton<Categories>(
        selected: ref.watch(categoryProvider),
        onSelectionChanged: (Set<Categories> updatedSelection) {
          if (updatedSelection.contains(Categories.personal)) {
            ref
                .read(categoryProvider.notifier)
                .updateCategory(Categories.personal, ref);
          } else if (updatedSelection.contains(Categories.work)) {
            ref
                .read(categoryProvider.notifier)
                .updateCategory(Categories.work, ref);
          } else if (updatedSelection.contains(Categories.study)) {
            ref
                .read(categoryProvider.notifier)
                .updateCategory(Categories.study, ref);
          }
        },
        emptySelectionAllowed: true,
        segments: const <ButtonSegment<Categories>>[
          ButtonSegment<Categories>(
            value: Categories.personal,
            label: Text('Personal'),
          ),
          ButtonSegment<Categories>(
            value: Categories.work,
            label: Text('Work'),
          ),
          ButtonSegment<Categories>(
            value: Categories.study,
            label: Text('Study'),
          ),
        ],
      ),
    );
  }
}

class UpdateTaskDatePickerButton extends ConsumerWidget {
  const UpdateTaskDatePickerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030),
          ).then((DateTime? datePicked) {
            if (datePicked != null) {
              final String formattedDate =
                  DateFormat('dd/MM/yyyy').format(datePicked);
              ref.read(dueDateProvider.notifier).state = formattedDate;
              return null;
            }
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.edit_calendar_rounded),
            const SizedBox(width: 8.0),
            Text(ref.watch(dueDateProvider)),
          ],
        ),
      ),
    );
  }
}

class UpdateTaskTimePickerButton extends ConsumerWidget {
  const UpdateTaskTimePickerButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () async {
          await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          ).then((TimeOfDay? timePicked) {
            if (timePicked != null) {
              final String formattedTime = timePicked.format(context);
              ref.read(dueTimeProvider.notifier).state = formattedTime;
              return null;
            }
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.alarm_rounded),
            const SizedBox(width: 8.0),
            Text(ref.watch(dueTimeProvider)),
          ],
        ),
      ),
    );
  }
}

class UpdateTaskCancelButton extends StatelessWidget {
  const UpdateTaskCancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.delete_rounded),
            SizedBox(width: 8.0),
            Text('Cancel'),
          ],
        ),
      ),
    );
  }
}

class UpdateTaskSaveButton extends StatelessWidget {
  const UpdateTaskSaveButton({
    required this.ref,
    required this.id,
    required this.titleController,
    required this.descriptionController,
    required this.mounted,
    super.key,
    this.oldTitle,
    this.oldDescription,
    this.oldDueDate,
    this.oldDueTime,
  });

  final WidgetRef ref;
  final String id;
  final String? oldTitle;
  final String? oldDescription;
  final String? oldDueDate;
  final String? oldDueTime;
  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final bool mounted;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FilledButton(
        onPressed: () async {
          try {
            await FirestoreService(ref).updateTodo(
              Todo(
                id: id,
                title: ref.watch(titleProvider),
                description: ref.watch(descriptionProvider),
                category: ref.watch(categoryStringProvider),
                dueDate: ref.watch(dueDateProvider),
                dueTime: ref.watch(dueTimeProvider),
                isCompleted: false,
              ),
            );
            titleController.clear();
            descriptionController.clear();
            ref
              ..invalidate(titleProvider)
              ..invalidate(descriptionProvider)
              ..invalidate(categoryProvider)
              ..invalidate(dueDateProvider)
              ..invalidate(dueTimeProvider)
              ..invalidate(isCompletedProvider);
            Logs.updateTodoComplete();
            if (mounted) {
              Navigator.pop(context);
            }
          } catch (error) {
            Logs.updateTodoFailed();
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Failed to update TODO: $error',
                  ),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: ref.watch(isDarkModeProvider)
                      ? flexSchemeDark(ref).error
                      : flexSchemeLight(ref).error,
                ),
              );
            }
          }
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.save_rounded,
            ),
            SizedBox(width: 8.0),
            Text(
              'Save',
            ),
          ],
        ),
      ),
    );
  }
}
