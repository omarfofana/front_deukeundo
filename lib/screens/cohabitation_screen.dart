import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/avatar_utilisateur.dart';
import '../widgets/badge_statut.dart';
import '../widgets/titre_section.dart';

/// Cohabitation en cours : colocataires, règles et clôture.
class CohabitationScreen extends StatelessWidget {
  const CohabitationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Ma cohabitation'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[AppColors.navy, AppColors.navyDark],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Chambre meublée · Sacré-Cœur 3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    BadgeStatut(texte: 'En cours', ton: TonBadge.attente),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: <Widget>[
                    _info('Début', '1er mars 2026'),
                    const SizedBox(width: 24),
                    _info('Fin prévue', 'Non définie'),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const TitreSection(titre: 'Colocataires'),
          const SizedBox(height: 12),
          _colocataire(context, 'Aïssatou Diop', 'Propriétaire'),
          _colocataire(context, 'Moussa Faye', 'Colocataire'),
          _colocataire(context, 'Awa Diallo', 'Vous'),
          const SizedBox(height: 24),
          const TitreSection(titre: 'Règles acceptées'),
          const SizedBox(height: 12),
          for (final String regle in const <String>[
            'Non-fumeur à l’intérieur du logement',
            'Pas de fête après 22h en semaine',
            'Ménage des parties communes à tour de rôle',
          ])
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 17,
                    color: AppColors.success,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      regle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.star_outline_rounded, size: 18),
            label: const Text('Évaluer mes colocataires'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: AppColors.danger),
            icon: const Icon(Icons.exit_to_app_rounded, size: 18),
            label: const Text('Terminer la cohabitation'),
          ),
        ],
      ),
    );
  }

  Widget _info(String libelle, String valeur) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          libelle,
          style: const TextStyle(color: Color(0xFFB9C7DA), fontSize: 11),
        ),
        const SizedBox(height: 2),
        Text(
          valeur,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }

  Widget _colocataire(BuildContext context, String nom, String role) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: <Widget>[
          AvatarUtilisateur(nom: nom, taille: 42),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(nom, style: Theme.of(context).textTheme.titleMedium),
                Text(role, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const Icon(
            Icons.chat_bubble_outline_rounded,
            size: 18,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}
