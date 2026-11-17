import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

enum TonBadge { neutre, succes, attente, danger }

/// Petite pastille de statut (candidature, annonce, signalement…).
class BadgeStatut extends StatelessWidget {
  const BadgeStatut({super.key, required this.texte, this.ton = TonBadge.neutre});

  final String texte;
  final TonBadge ton;

  factory BadgeStatut.depuisStatut(String statut) {
    final TonBadge ton = switch (statut.toLowerCase()) {
      'acceptée' || 'publiée' || 'disponible' || 'traité' => TonBadge.succes,
      'en attente' || 'en cours' || 'brouillon' => TonBadge.attente,
      'refusée' || 'signalé' || 'masquée' || 'indisponible' => TonBadge.danger,
      _ => TonBadge.neutre,
    };
    return BadgeStatut(texte: statut, ton: ton);
  }

  (Color, Color) get _couleurs => switch (ton) {
    TonBadge.succes => (const Color(0xFFE6F4EC), AppColors.success),
    TonBadge.attente => (AppColors.amberLight, const Color(0xFFB4772A)),
    TonBadge.danger => (const Color(0xFFFBEAE8), AppColors.danger),
    TonBadge.neutre => (AppColors.tealLight, AppColors.teal),
  };

  @override
  Widget build(BuildContext context) {
    final (Color fond, Color texteCouleur) = _couleurs;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: fond,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        texte,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: texteCouleur,
        ),
      ),
    );
  }
}
