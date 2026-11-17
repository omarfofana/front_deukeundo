import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Titre de section avec action optionnelle à droite.
class TitreSection extends StatelessWidget {
  const TitreSection({
    super.key,
    required this.titre,
    this.action,
    this.sousTitre,
  });

  final String titre;
  final String? action;
  final String? sousTitre;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(titre, style: Theme.of(context).textTheme.titleMedium),
              if (sousTitre != null) ...<Widget>[
                const SizedBox(height: 2),
                Text(sousTitre!, style: Theme.of(context).textTheme.bodySmall),
              ],
            ],
          ),
        ),
        if (action != null)
          Text(
            action!,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.teal,
            ),
          ),
      ],
    );
  }
}
