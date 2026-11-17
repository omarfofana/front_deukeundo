import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/avatar_utilisateur.dart';
import '../widgets/badge_statut.dart';
import '../widgets/titre_section.dart';

/// Console de modération de l'administrateur.
class AdministrationScreen extends StatelessWidget {
  const AdministrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administration')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: <Widget>[
          Row(
            children: <Widget>[
              _tuile(context, '1 248', 'Annonces', Icons.description_outlined),
              const SizedBox(width: 10),
              _tuile(context, '860', 'Utilisateurs', Icons.people_outline_rounded),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: <Widget>[
              _tuile(context, '7', 'Signalements', Icons.flag_outlined),
              const SizedBox(width: 10),
              _tuile(context, '14', 'Avis à vérifier', Icons.star_outline_rounded),
            ],
          ),
          const SizedBox(height: 26),
          const TitreSection(
            titre: 'Signalements en attente',
            action: 'Tout voir',
          ),
          const SizedBox(height: 12),
          _signalement(
            context,
            'Annonce',
            'Studio partagé · Mermoz',
            'Demande d’argent avant visite',
            'Il y a 2 h',
          ),
          const SizedBox(height: 10),
          _signalement(
            context,
            'Avis',
            'Avis sur Ibrahima N.',
            'Propos déplacés',
            'Hier',
          ),
          const SizedBox(height: 26),
          const TitreSection(titre: 'Derniers comptes créés', action: 'Gérer'),
          const SizedBox(height: 12),
          _utilisateur(context, 'Awa Diallo', 'Colocataire', 'Actif'),
          _utilisateur(context, 'Cheikh Ba', 'Propriétaire', 'Actif'),
          _utilisateur(context, 'Ndèye Fall', 'Colocataire', 'Signalé'),
        ],
      ),
    );
  }

  Widget _tuile(
    BuildContext context,
    String valeur,
    String libelle,
    IconData icone,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(icone, size: 20, color: AppColors.teal),
            const SizedBox(height: 12),
            Text(
              valeur,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: AppColors.navy,
              ),
            ),
            Text(libelle, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _signalement(
    BuildContext context,
    String type,
    String cible,
    String motif,
    String quand,
  ) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const BadgeStatut(texte: 'Signalé', ton: TonBadge.danger),
              const SizedBox(width: 8),
              Text(type, style: Theme.of(context).textTheme.bodySmall),
              const Spacer(),
              Text(quand, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(height: 10),
          Text(cible, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(motif, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                  ),
                  child: const Text('Ignorer'),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                    backgroundColor: AppColors.danger,
                  ),
                  child: const Text('Masquer'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _utilisateur(
    BuildContext context,
    String nom,
    String role,
    String statut,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: <Widget>[
          AvatarUtilisateur(nom: nom, taille: 38),
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
          BadgeStatut(
            texte: statut,
            ton: statut == 'Actif' ? TonBadge.succes : TonBadge.danger,
          ),
          const SizedBox(width: 8),
          const Icon(Icons.more_vert_rounded, size: 18, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
