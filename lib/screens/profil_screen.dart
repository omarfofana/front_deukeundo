import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/avatar_utilisateur.dart';
import '../widgets/etoiles_note.dart';

/// Profil de l'utilisateur connecté.
class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profil'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              children: <Widget>[
                const AvatarUtilisateur(nom: 'Awa Diallo', taille: 76),
                const SizedBox(height: 12),
                Text(
                  'Awa Diallo',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Colocataire · Dakar · membre depuis 2026',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 10),
                const EtoilesNote(note: 4.7, nombreAvis: 8),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit_outlined, size: 18),
                  label: const Text('Modifier mon profil'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _verifications(context),
          const SizedBox(height: 18),
          _preferences(context),
          const SizedBox(height: 18),
          _menu(context),
        ],
      ),
    );
  }

  Widget _verifications(BuildContext context) {
    const List<(IconData, String, bool)> items = <(IconData, String, bool)>[
      (Icons.mail_outline_rounded, 'E-mail vérifié', true),
      (Icons.phone_outlined, 'Téléphone vérifié', true),
      (Icons.badge_outlined, 'Pièce d’identité', false),
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Vérifications', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 14),
          for (final (IconData icone, String libelle, bool ok) in items)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: <Widget>[
                  Icon(icone, size: 18, color: AppColors.textMuted),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      libelle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Icon(
                    ok
                        ? Icons.check_circle_rounded
                        : Icons.radio_button_unchecked_rounded,
                    size: 18,
                    color: ok ? AppColors.success : AppColors.textMuted,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _preferences(BuildContext context) {
    const List<String> preferences = <String>[
      'Non-fumeuse',
      'Couche-tôt',
      'Étudiante',
      'Sans animaux',
      'Budget 80–120k',
    ];
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Préférences de vie',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Utilisées pour vous proposer des colocataires compatibles.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: <Widget>[
              for (final String p in preferences) Chip(label: Text(p)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menu(BuildContext context) {
    const List<(IconData, String)> entrees = <(IconData, String)>[
      (Icons.description_outlined, 'Mes annonces'),
      (Icons.favorite_outline_rounded, 'Mes favoris'),
      (Icons.assignment_outlined, 'Mes candidatures'),
      (Icons.star_outline_rounded, 'Avis reçus'),
      (Icons.notifications_none_rounded, 'Notifications'),
      (Icons.help_outline_rounded, 'Aide et sécurité'),
      (Icons.logout_rounded, 'Se déconnecter'),
    ];
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: <Widget>[
          for (int i = 0; i < entrees.length; i++) ...<Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Row(
                children: <Widget>[
                  Icon(
                    entrees[i].$1,
                    size: 19,
                    color: i == entrees.length - 1
                        ? AppColors.danger
                        : AppColors.textSecondary,
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      entrees[i].$2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: i == entrees.length - 1
                            ? AppColors.danger
                            : AppColors.textPrimary,
                      ),
                    ),
                  ),
                  if (i != entrees.length - 1)
                    const Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textMuted,
                    ),
                ],
              ),
            ),
            if (i != entrees.length - 1) const Divider(indent: 16, endIndent: 16),
          ],
        ],
      ),
    );
  }
}
