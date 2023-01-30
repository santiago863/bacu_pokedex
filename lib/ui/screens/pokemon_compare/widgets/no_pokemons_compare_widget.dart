import 'package:flutter/material.dart';

import '../../../widgets/atoms/button_widget.dart';
import '../../../widgets/tokens/app_fonts.dart';

class NoPokemonsCompareWidget extends StatelessWidget {
  const NoPokemonsCompareWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .2,
          ),
          const Icon(
            Icons.warning,
            size: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'There are no pokemons to compare',
            textAlign: TextAlign.center,
            style: AppFonts.subtitle.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ButtonWidget(
            text: 'Search pokemon to compare',
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
