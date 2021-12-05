import 'package:bookshelf/generated/app_strings.g.dart';
import 'package:bookshelf/injection/injection.dart';
import 'package:bookshelf/models/index.dart';
import 'package:bookshelf/modules/main/cubit/main_cubit.dart';
import 'package:bookshelf/modules/main/widget/book_item.dart';
import 'package:bookshelf/router/app_router.gr.dart';
import 'package:bookshelf/theme/app_theme.dart';
import 'package:bookshelf/widget/base_appbar.dart';
import 'package:bookshelf/widget/debounce_button.dart';
import 'package:bookshelf/widget/enter_field.dart';
import 'package:bookshelf/widget/progress_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _ContentWidget extends StatelessWidget {
  final List<Book> models;
  const _ContentWidget({
    Key? key,
    required this.models,
  }) : super(key: key);

  MainCubit get cubit => getIt<MainCubit>();
  AppRouter get router => getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    if (models.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 40.h),
          child: Text(
            LocaleKeys.main_empty.tr(
              namedArgs: {
                'text': cubit.search.text,
              },
            ),
            textAlign: TextAlign.center,
            style: theme.textTheme.medium14.grey,
          ),
        ),
      );
    }
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 40.h),
      itemBuilder: (context, index) {
        final model = models[index];
        return BookItemWidget(
          model: model,
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            router.push(DetailsPageRoute(id: model.id));
          },
        );
      },
      separatorBuilder: (_, __) {
        return SizedBox(
          height: 16.h,
        );
      },
      itemCount: models.length,
    );
  }
}

class _MainPageState extends State<MainPage> {
  MainCubit get cubit => getIt<MainCubit>();

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: theme.colors.lightGrey,
        appBar: BaseAppBar.create(
          context,
          hasBack: false,
          actions: [
            DebounceButton(
              child: Text(
                LocaleKeys.main_logout.tr(),
                style: theme.textTheme.medium14,
              ),
              onPressed: () => cubit.logout(),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              child: EnterField(
                controller: cubit.search,
                hintText: LocaleKeys.main_textfield_hint.tr(),
              ),
            ),
            Expanded(
              child: BlocBuilder<MainCubit, MainState>(
                bloc: cubit,
                builder: (context, state) {
                  return state.maybeWhen(
                    success: (model) => _ContentWidget(
                      models: model.books,
                    ),
                    orElse: () => Center(
                      child: ProgressWidget(
                        size: 40.w,
                        color: theme.colors.tiffany,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    cubit.fetch();
    super.initState();
  }
}
