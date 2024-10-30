// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

// Project imports:
import '../../../core/utils/extension.dart';
import '../../view_model/blocs/data_bloc/api_data_bloc.dart';
import 'assistance_pagination.dart';

class ResponsivePaginationWidget<MODEL> extends StatelessWidget {
  final ApiDataBloc<MODEL> bloc;
  final Widget Function(BuildContext context, MODEL item, int index, PagingController<int, MODEL> controller) itemBuilder;
  final EdgeInsetsGeometry? margin;
  final double? percentHight;
  final double? maxCrossAxisExtent;
  final ScrollPhysics? physics;
  final ListType listType;
  final double? gapItem;
  final ScrollController? scrollController;

  const ResponsivePaginationWidget({
    super.key,
    required this.bloc,
    required this.itemBuilder,
    this.margin,
    this.percentHight,
    this.maxCrossAxisExtent,
    this.physics,
    this.listType = ListType.both,
    this.gapItem,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => bloc.controller?.refresh(),
      child: switch (listType) {
        ListType.list => PagedListView.separated(
            scrollController: scrollController,
            separatorBuilder: (context, index) => gapItem.h,
            pagingController: bloc.controller!,
            physics: physics,
            padding: margin ?? EdgeInsets.only(bottom: context.bottomPadding),
            builderDelegate: PagedChildBuilderDelegate<MODEL>(
              itemBuilder: (context, item, index) => itemBuilder.call(context, item, index, bloc.controller!),
              firstPageProgressIndicatorBuilder: (context) => defaultLoading(
                child: const CircularProgressIndicator(),
              ),
              newPageProgressIndicatorBuilder: (context) => defaultLoading(),
              newPageErrorIndicatorBuilder: (context) => errorDuringBrowsing(context, bloc.controller!),
              firstPageErrorIndicatorBuilder: (context) => errorDuringBrowsing(context, bloc.controller!),
              noItemsFoundIndicatorBuilder: noData,
            ),
          ),
        ListType.grid => PagedGridView(
            pagingController: bloc.controller!,
            physics: physics,
            padding: margin ?? EdgeInsets.only(bottom: context.bottomPadding),
            builderDelegate: PagedChildBuilderDelegate<MODEL>(
              itemBuilder: (context, item, index) => itemBuilder.call(context, item, index, bloc.controller!),
              firstPageProgressIndicatorBuilder: (context) => defaultLoading(child: const CircularProgressIndicator()),
              newPageProgressIndicatorBuilder: (context) => defaultLoading(),
              newPageErrorIndicatorBuilder: (context) => errorDuringBrowsing(context, bloc.controller!),
              firstPageErrorIndicatorBuilder: (context) => errorDuringBrowsing(context, bloc.controller!),
              noItemsFoundIndicatorBuilder: noData,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxCrossAxisExtent ?? context.sizeSide.smallSide / 1.4,
              childAspectRatio: getRatio(
                context,
                percentHight ?? (context.orientationInfo.isPortrait ? .5 : .4),
              ),
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
          ),
        ListType.both => context.isMobile
            ? PagedListView.separated(
                separatorBuilder: (context, index) => gapItem.h,
                pagingController: bloc.controller!,
                physics: physics,
                padding: margin ?? EdgeInsets.only(bottom: context.bottomPadding),
                builderDelegate: PagedChildBuilderDelegate<MODEL>(
                  itemBuilder: (context, item, index) => itemBuilder.call(context, item, index, bloc.controller!),
                  firstPageProgressIndicatorBuilder: (context) => defaultLoading(),
                  newPageErrorIndicatorBuilder: (context) => errorDuringBrowsing(context, bloc.controller!),
                  firstPageErrorIndicatorBuilder: (context) => errorDuringBrowsing(context, bloc.controller!),
                  noItemsFoundIndicatorBuilder: noData,
                ),
              )
            : PagedGridView(
                pagingController: bloc.controller!,
                physics: physics,
                padding: margin ?? EdgeInsets.only(bottom: context.bottomPadding),
                builderDelegate: PagedChildBuilderDelegate<MODEL>(
                  itemBuilder: (context, item, index) => itemBuilder.call(context, item, index, bloc.controller!),
                  firstPageProgressIndicatorBuilder: (context) => defaultLoading(),
                  newPageErrorIndicatorBuilder: (context) => errorDuringBrowsing(context, bloc.controller!),
                  firstPageErrorIndicatorBuilder: (context) => errorDuringBrowsing(context, bloc.controller!),
                  noItemsFoundIndicatorBuilder: noData,
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: context.sizeSide.smallSide / 1.4,
                  childAspectRatio: getRatio(
                    context,
                    percentHight ?? (context.orientationInfo.isPortrait ? .5 : .4),
                  ),
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
              ),
      },
    );
  }

  double getRatio(BuildContext context, double percent) {
    return context.orientationInfo.isPortrait
        ? (context.sizeSide.width / context.sizeSide.largeSide) * percent
        : (context.sizeSide.height / context.sizeSide.largeSide) * percent;
  }
}
