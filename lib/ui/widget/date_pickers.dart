import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:places/domain/settings.dart';
import 'package:places/ui/ui_kit/ui_kit.dart';

Future<DateTime?> showCupertinoDatePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
}) =>
    showModalBottomSheet<DateTime>(
      context: context,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (context) => CupertinoDateSelect(
        initialDate: initialDate,
        firstDate: firstDate,
      ),
    );

class CupertinoDateSelect extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;

  const CupertinoDateSelect({
    Key? key,
    required this.initialDate,
    required this.firstDate,
  }) : super(key: key);

  @override
  CupertinoDateSelectState createState() => CupertinoDateSelectState();
}

class CupertinoDateSelectState extends State<CupertinoDateSelect> {
  late DateTime date;

  @override
  void initState() {
    super.initState();
    date = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: CupertinoDatePicker(
              initialDateTime: widget.initialDate,
              minimumDate: widget.firstDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (date) => this.date = date,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: CupertinoButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.pop(context, date),
            ),
          ),
        ],
      );
}

Future<DateTime?> datePicker({
  required BuildContext context,
  required DateTime initialDate,
  required DateTime firstDate,
  required DateTime lastDate,
}) {
  final theme = Theme.of(context);
  final themeColors = theme.extension<AppThemeColors>()!;

  return showDatePicker(
    locale: const Locale('ru', 'RU'),
    builder: (context, child) {
      return Theme(
        data: theme.copyWith(
          colorScheme: Settings.themeIsLight.value
              ? ColorScheme.light(
                  primary: themeColors.greenAccent!,
                  secondary: themeColors.icons!,
                )
              : ColorScheme.dark(
                  primary: themeColors.greenAccent!,
                  secondary: themeColors.icons!,
                ),
        ),
        child: child!,
      );
    },
    cancelText: AppStrings.visitingScreenCancel,
    confirmText: AppStrings.visitingScreenOk,
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );
}
