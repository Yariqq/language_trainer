import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:seven/app/router/app_router.gr.dart';
import 'package:seven/app/theme/common_size.dart';
import 'package:seven/dictionary/domain/entity/dictionary_category.dart';
import 'package:seven/dictionary/presentation/extensions/dictionary_category_extension.dart';

const _containerRadius = 12.0;
const _containerShadowColorOpacity = 0.6;
const _containerShadowBlurRadius = 7.0;
const _containerShadowOffset = Offset(0, 1.0);

@RoutePage()
class DictionaryPage extends StatelessWidget {
  const DictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: CommonSize.paddingDefault,
        vertical: CommonSize.paddingLarge,
      ),
      child: SafeArea(
        child: ListView.separated(
          itemCount: DictionaryCategory.values.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => context.pushRoute(
                DictionaryDetailsRoute(
                  category: DictionaryCategory.values[index],
                ),
              ),
              child: Container(
                padding: const EdgeInsets.all(CommonSize.paddingDefault),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(_containerRadius),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Colors.grey.withOpacity(_containerShadowColorOpacity),
                      blurRadius: _containerShadowBlurRadius,
                      offset: _containerShadowOffset,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        DictionaryCategory.values[index].title,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: CommonSize.paddingLarge,
            );
          },
        ),
      ),
    );
  }
}
