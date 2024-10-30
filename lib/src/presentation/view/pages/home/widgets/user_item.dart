import 'package:flutter/material.dart';
import 'package:micit_test/src/core/utils/extension.dart';
import 'package:micit_test/src/presentation/view/pages/home/controller/home_controller.dart';

import '../../../../../data/models/user_model.dart';
import '../../../common/dialogs.dart';
import '../../../common/image_widget.dart';
import '../../../common/text_widget.dart';
import 'user_form.dart';

class UserItem extends StatelessWidget {
  final UserModel item;
  final int index;
  final HomeController homeController;
  const UserItem({
    super.key,
    required this.item,
    required this.index,
    required this.homeController,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextWidget(text: '${item.firstName} ${item.lastName}'),
      subtitle: TextWidget(text: item.email),
      leading: ImageWidget(image: item.avatar),
      trailing: Column(
        children: [
          Flexible(
            child: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                customBottomSheet(
                  context: context,
                  height: context.sizeSide.largeSide * .5,
                  builder: (context, constraints) => UserForm(
                    constraints: constraints,
                    homeController: homeController,
                    user: item,
                    index: index,
                  ),
                );
              },
            ),
          ),
          Flexible(
            child: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                homeController.deleteUser(item, index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
