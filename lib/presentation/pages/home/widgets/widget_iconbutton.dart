import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/blocs.dart';

class IconButtonRick extends StatelessWidget {
  const IconButtonRick({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final darkMode = state.isDarkMode;

        return IconButton(
          iconSize: 50,
          icon: Icon(
            (darkMode) ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
          onPressed: () {
            context.read<ThemeCubit>().toggleTheme();
          },
        );
      },
    );
  }
}
