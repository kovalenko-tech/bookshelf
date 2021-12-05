import 'package:bookshelf/injection/injection.dart';
import 'package:bookshelf/models/index.dart';
import 'package:bookshelf/modules/main/modules/details/cubit/details_cubit.dart';
import 'package:bookshelf/theme/app_theme.dart';
import 'package:bookshelf/widget/base_appbar.dart';
import 'package:bookshelf/widget/image.dart';
import 'package:bookshelf/widget/progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsPage extends StatefulWidget {
  final String id;
  const DetailsPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _ContentWidget extends StatelessWidget {
  final Book model;
  const _ContentWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            height: 180.h,
            width: double.infinity,
            imageUrl: model.coverImageUrl,
          ),
          SizedBox(
            height: 16.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.title,
                  style: theme.textTheme.demi28,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  model.publisher,
                  style: theme.textTheme.book14.grey,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Text(
                  model.author,
                  style: theme.textTheme.book14.grey,
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  model.synopsis,
                  style: theme.textTheme.book18,
                ),
                SizedBox(
                  height: 40.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsPageState extends State<DetailsPage> {
  late DetailsCubit cubit;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.lightGrey,
      appBar: BaseAppBar.create(context),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        bloc: cubit,
        builder: (context, state) {
          return state.maybeWhen(
            success: (model) => _ContentWidget(
              model: model,
            ),
            orElse: () => Center(
              child: ProgressWidget(
                color: theme.colors.tiffany,
                size: 40.w,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  void initState() {
    cubit = getIt<DetailsCubit>();
    super.initState();

    cubit.fetch(id: widget.id);
  }
}
