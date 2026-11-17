import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Affichage d'une note sur 5 sous forme d'étoiles.
class EtoilesNote extends StatelessWidget {
  const EtoilesNote({
    super.key,
    required this.note,
    this.taille = 16,
    this.afficherValeur = true,
    this.nombreAvis,
  });

  final double note;
  final double taille;
  final bool afficherValeur;
  final int? nombreAvis;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        for (int i = 1; i <= 5; i++)
          Icon(
            note >= i
                ? Icons.star_rounded
                : (note >= i - 0.5
                      ? Icons.star_half_rounded
                      : Icons.star_outline_rounded),
            size: taille,
            color: AppColors.amber,
          ),
        if (afficherValeur) ...<Widget>[
          const SizedBox(width: 6),
          Text(
            note.toStringAsFixed(1),
            style: TextStyle(
              fontSize: taille - 3,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
        ],
        if (nombreAvis != null) ...<Widget>[
          const SizedBox(width: 4),
          Text(
            '($nombreAvis avis)',
            style: TextStyle(fontSize: taille - 4, color: AppColors.textMuted),
          ),
        ],
      ],
    );
  }
}
