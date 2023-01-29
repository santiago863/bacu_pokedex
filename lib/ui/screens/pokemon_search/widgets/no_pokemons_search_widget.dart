import 'package:flutter/material.dart';
import '../../../widgets/tokens/app_fonts.dart';

class NoPokemonsSearchWidget extends StatelessWidget {
  const NoPokemonsSearchWidget({
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
            'No pokemon found',
            textAlign: TextAlign.center,
            style: AppFonts.subtitle.copyWith(
              fontSize: 20,
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
