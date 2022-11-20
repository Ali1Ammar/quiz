import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:quiz/view/quiz_page.dart';
import 'package:quiz/viewmodel/tag_viewmodel.dart';

class TagPage extends StatelessWidget {
  const TagPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TagViewModel>();
    return Scaffold(
      body: viewModel.isLoading
          ? const CircularProgressIndicator()
          : ListView(
              children: [
                if (viewModel.error != null) Text(viewModel.error!),
                ...(viewModel.tags ?? []).map((e) => ListTile(
                      title: Text(e),
                      onTap: () {
                        viewModel.pressTag(e);
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return QuizPage();
                        }));
                      },
                    ))
              ],
            ),
    );
  }
}
