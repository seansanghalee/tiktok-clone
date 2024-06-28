import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: [
          CupertinoSwitch(value: false, onChanged: (value) {}),
          Switch(value: false, onChanged: (value) {}),
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).muted,
            onChanged: (value) {
              ref.read(playbackConfigProvider.notifier).setMuted(value);
            },
            title: const Text("Auto Mute"),
          ),
          SwitchListTile.adaptive(
            value: ref.watch(playbackConfigProvider).autoplay,
            onChanged: (value) {
              ref.read(playbackConfigProvider.notifier).setAutoplay(value);
            },
            title: const Text("Auto Play"),
          ),
          CheckboxListTile(
            value: false,
            onChanged: (value) {},
            activeColor: Colors.black,
            checkColor: Colors.red,
            title: const Text("Enable notifications"),
          ),
          ListTile(
            onTap: () async {
              // final date = await showDatePicker(
              //     context: context,
              //     firstDate: DateTime(1980),
              //     lastDate: DateTime(2030),
              //     initialDate: DateTime.now());

              // final time = await showTimePicker(
              //   context: context,
              //   initialTime: TimeOfDay.now(),
              // );

              // final booking = await showDateRangePicker(
              //   context: context,
              //   firstDate: DateTime(1980),
              //   lastDate: DateTime(2030),
              //   builder: (context, child) {
              //     return Theme(
              //       data: ThemeData(
              //         appBarTheme: const AppBarTheme(
              //           foregroundColor: Colors.white,
              //           backgroundColor: Colors.black,
              //         ),
              //       ),
              //       child: child!,
              //     );
              //   },
              // );
            },
            title: const Text("When is your birthday?"),
          ),
          const ListTile(
            title: Text(
              "About",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text("About this app...."),
          ),
          ListTile(
            title: const Text("Log out (Android)"),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("for real for real?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (iOS)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("for real for real?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (iOS / Bottom)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text("Are you sure?"),
                  content: const Text("for real for real?"),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Yes"),
                    ),
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("No"),
                    ),
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text("Log out (iOS / Bottom / ActionSheet)"),
            textColor: Colors.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  title: const Text("Are you sure?"),
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () {},
                      child: const Text("Ayo"),
                    )
                  ],
                ),
              );
            },
          ),
          const AboutListTile(),
        ],
      ),
    );
  }
}
