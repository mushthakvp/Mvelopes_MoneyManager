import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvelopes/viewmodel/add_edit/hive_impl.dart';
import 'package:provider/provider.dart';
import '../../utilities/color/colors.dart';

createPersistentNotification(BuildContext context) async {
  await AwesomeNotifications().resetGlobalBadge();

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 0,
      channelKey: 'persistent_notification',
      title: '💰 TOTAL: ₹ ${context.read<HiveImpl>().recentTotal}',
      body: '⬆️ INCOME: ₹ ${context.read<HiveImpl>().incomeTotal} ⬇️  EXPENSE: ₹ ${context.read<HiveImpl>().expenseTotal}',
      notificationLayout: NotificationLayout.Default,
      autoDismissible: false,
      locked: true,
      displayOnBackground: true,
    ),
    actionButtons: [
      NotificationActionButton(
        key: 'EDIT',
        label: 'Close',
        color: indigColor,
        autoDismissible: true,
        buttonType: ActionButtonType.DisabledAction,
      ),
    ],
  );
}
