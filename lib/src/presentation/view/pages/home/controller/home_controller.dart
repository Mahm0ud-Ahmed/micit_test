import 'dart:math';

import 'package:flutter/material.dart'
    show BuildContext, Curves, FormState, GlobalKey, Navigator, ScrollController, TextEditingController;
import 'package:micit_test/src/core/config/assets/assets.gen.dart';
import 'package:micit_test/src/core/services/sqlite_service.dart';

import '../../../../../core/utils/api_info.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../../data/models/user_model.dart';
import '../../../../view_model/blocs/data_bloc/api_data_bloc.dart';
import '../../../../view_model/blocs/data_bloc/api_data_state.dart';
import '../../../common/dialogs.dart';

class HomeController {
  late final ApiDataBloc<UserModel> usersBloc;
  late final GlobalKey<FormState> formKey;
  TextEditingController? firstNameController;
  TextEditingController? lastNameController;
  TextEditingController? emailController;

  late final ScrollController scrollController;

  String? eventId;

  void initController() {
    usersBloc = ApiDataBloc<UserModel>(apiInfo: ApiInfo(endpoint: ApiRoute.users.route, pageSize: 5));
    formKey = GlobalKey<FormState>();
    scrollController = ScrollController();
  }

  void initFieldsControllers() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
  }

  void disposeFieldsControllers() {
    firstNameController?.dispose();
    lastNameController?.dispose();
    emailController?.dispose();
  }

  void addUser() {
    eventId = "add_user";
    formKey.currentState!.save();
    final randomIndex = Random().nextInt(2);
    final assets = [
      Assets.man.path,
      Assets.woman.path,
    ];
    final user = UserModel(
        email: emailController!.text,
        firstName: firstNameController!.text,
        lastName: lastNameController!.text,
        avatar: assets[randomIndex]);

    usersBloc.addData(info: ApiInfo(endpoint: ApiRoute.users.route, data: user.toJson()), id: eventId).then(
      (value) {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      },
    );
  }

  void updateUser(UserModel pUser, int index) {
    eventId = index.toString();
    final user = UserModel(
      id: pUser.id,
      email: emailController!.text,
      firstName: firstNameController!.text,
      lastName: lastNameController!.text,
      avatar: pUser.avatar,
    );

    usersBloc.updateData(info: ApiInfo(endpoint: ApiRoute.users.route, data: user.toJson()), index: index);
  }

  void deleteUser(UserModel pUser, int index) {
    eventId = index.toString();
    usersBloc.deleteData(info: ApiInfo(endpoint: ApiRoute.users.route, data: pUser.toJson()), index: index);
  }

  void listenOnActions(BuildContext context, ApiDataState state) {
    state.mapOrNull(
      loading: (
        value,
      ) {
        if (value.id != null && value.id == eventId) {
          showLoadingDialog(context);
        }
      },
      success: (value) {
        if (value.id != null && value.id == eventId) {
          eventId = null;
          Navigator.pop(context);
        }
        showToast('Success Process');
      },
      error: (value) {
        if (value.id != null && value.id == eventId) {
          eventId = null;
          Navigator.pop(context);
        }
        showToast(value.error?.statusMessage ?? '');
      },
    );
  }

  void disposeController() {
    usersBloc.close();
    SqlLiteService().closeDB();
  }
}
