import 'package:flutter/material.dart';
import 'package:mvelopes/utilities/color/colors.dart';
import 'package:mvelopes/viewmodel/settings/settings_pov.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utilities/style/styles.dart';
import 'widgets/bottom_sheet.dart';
import 'widgets/items_widget.dart';
import 'widgets/notification_button.dart';
import 'widgets/reset_dialog.dart';

class Settingsscreen extends StatelessWidget {
  const Settingsscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings', style: gFontsprimary(sz: 22, cr: whiteColor)),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const UserProfileWidget(),
          const SizedBox(height: 15),
          const NotificationInfoWidget(name: "Notification"),
          Card(
            elevation: 1,
            child: Column(children: [
              const NotificationButton(),
              InkWell(
                onTap: () {
                  // timePicking(context: context);
                },
                child: const ItemsWidget(
                  icon: Icons.alarm,
                  text: 'Reminder',
                ),
              ),
              const SizedBox(height: 5)
            ]),
          ),
          const SizedBox(height: 10),
          const NotificationInfoWidget(name: "Communicate"),
          Card(
            elevation: 1,
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    context.read<SettingsPov>().mailLaunch();
                  },
                  child: const ItemsWidget(
                    icon: Icons.mail_outline,
                    text: 'Contact',
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<SettingsPov>().urlLaunch(
                          'https://play.google.com/store/apps/details?id=com.fouvty.mvelopes',
                          LaunchMode.externalApplication,
                        );
                  },
                  child: const ItemsWidget(
                    icon: Icons.star_border_outlined,
                    text: 'Drop review',
                  ),
                ),
                const SizedBox(height: 5)
              ],
            ),
          ),
          const SizedBox(height: 10),
          const NotificationInfoWidget(name: "Info"),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    final one = context.read<SettingsPov>().randomNumberGenerator();
                    final two = context.read<SettingsPov>().randomNumberGenerator();
                    showDialog(
                      context: context,
                      builder: (context) => ResetDialogue(one: one, two: two),
                    );
                  },
                  child: const ItemsWidget(
                    icon: Icons.delete_outline,
                    text: 'Reset',
                  ),
                ),
                InkWell(
                  onTap: () async {
                    await Share.share(
                      'hey! check out this  app https://play.google.com/store/apps/details?id=com.fouvty.mvelopes',
                    );
                  },
                  child: const ItemsWidget(
                    icon: Icons.share_outlined,
                    text: 'Share',
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<SettingsPov>().urlLaunch(
                          'https://fouvtyindia.blogspot.com/p/mvelopes-privacy.html',
                          LaunchMode.externalApplication,
                        );
                  },
                  child: const ItemsWidget(
                    icon: Icons.privacy_tip_outlined,
                    text: 'Privacy policy',
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.read<SettingsPov>().urlLaunch(
                          'https://mushthakvp.github.io/PersonalWebsite/',
                          LaunchMode.inAppWebView,
                        );
                  },
                  child: const ItemsWidget(
                    icon: Icons.info_outline,
                    text: 'About',
                  ),
                ),
                const SizedBox(height: 5)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            )),
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return const BottomSheetSettings();
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundColor: whiteColor,
              backgroundImage: AssetImage('assets/image/man.png'),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Consumer<SettingsPov>(
                  builder: (context, value, child) {
                    return Text(
                      value.userName,
                      style: gFontsprimary(sz: 20, ls: 1),
                    );
                  },
                ),
                Text('Edit details', style: gFontsprimary(sz: 13, cr: greyColor, ls: 1))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationInfoWidget extends StatelessWidget {
  final String name;
  const NotificationInfoWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        name,
        style: const TextStyle(fontSize: 14, color: greyColor),
      ),
    );
  }
}
