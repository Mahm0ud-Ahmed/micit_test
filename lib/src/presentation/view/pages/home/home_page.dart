import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:micit_test/src/core/utils/extension.dart';
import 'package:micit_test/src/core/utils/layout/responsive_layout.dart';
import 'package:micit_test/src/presentation/view/common/assistance_pagination.dart';
import 'package:micit_test/src/presentation/view/common/dialogs.dart';
import 'package:micit_test/src/presentation/view/common/responsive_pagination_widget.dart';
import 'package:micit_test/src/presentation/view/pages/home/controller/home_controller.dart';
import 'package:micit_test/src/presentation/view/pages/home/widgets/user_form.dart';
import 'package:micit_test/src/presentation/view/pages/home/widgets/user_item.dart';

import '../../../../core/config/l10n/generated/l10n.dart';
import '../../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../../view_model/blocs/data_bloc/api_data_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late final HomeController homeController;
  @override
  void initState() {
    super.initState();
    homeController = HomeController()..initController();
  }

  @override
  void dispose() {
    homeController.disposeController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      titleAppBar: S.of(context).app_name,
      showAppBarActions: true,
      builder: (context, info) {
        return BlocListener<ApiDataBloc, ApiDataState>(
          bloc: homeController.usersBloc,
          listener: homeController.listenOnActions,
          child: ResponsivePaginationWidget(
            bloc: homeController.usersBloc,
            scrollController: homeController.scrollController,
            listType: ListType.list,
            itemBuilder: (context, item, index, controller) =>
                UserItem(item: item, index: index, homeController: homeController),
          ),
        );
      },
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          customBottomSheet(
            context: context,
            height: context.sizeSide.largeSide * .5,
            builder: (context, constraints) => UserForm(
              constraints: constraints,
              homeController: homeController,
            ),
          );
        },
      ),
    );
  }
}
