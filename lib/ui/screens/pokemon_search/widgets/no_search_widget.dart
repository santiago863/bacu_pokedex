import 'package:flutter/material.dart';

import '../../../widgets/tokens/app_fonts.dart';

class NoSearchWidget extends StatelessWidget {
  const NoSearchWidget({
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
            Icons.search,
            size: 50,
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Text(
              'Write the name of the pokemon to start the search',
              textAlign: TextAlign.center,
              style: AppFonts.subtitle.copyWith(
                fontSize: 20,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
