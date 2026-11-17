import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import '../widgets/avatar_utilisateur.dart';
import '../widgets/champ_texte.dart';

/// Laisser un avis sur un colocataire ou un propriétaire après cohabitation.
class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text('Laisser un avis'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                const AvatarUtilisateur(nom: 'Moussa Faye', taille: 68),
                const SizedBox(height: 12),
                Text(
                  'Moussa Faye',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 4),
                Text(
                  'Colocation à Sacré-Cœur 3 · mars → octobre 2026',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Note globale',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    for (int i = 1; i <= 5; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(
                          i <= 4
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          size: 38,
                          color: AppColors.amber,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 6),
                Text('4 sur 5', style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(height: 28),
          Text(
            'Détail par critère',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 14),
          for (final String critere in DonneesDemo.criteresEvaluation)
            Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      critere,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      for (int i = 1; i <= 5; i++)
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Icon(
                            i <= 4
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            size: 20,
                            color: AppColors.amber,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          const SizedBox(height: 10),
          const ChampTexte(
            libelle: 'Commentaire',
            placeholder:
                'Décrivez votre expérience : respect des règles, communication, '
                'propreté…',
            lignes: 6,
            aide: 'Votre avis sera visible publiquement sur le profil.',
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Icon(
                  Icons.info_outline_rounded,
                  size: 18,
                  color: AppColors.textMuted,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Un seul avis est possible par cohabitation. Il ne pourra '
                    'plus être modifié une fois publié.',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          FilledButton(
            onPressed: () {},
            child: const Text('Publier mon avis'),
          ),
        ],
      ),
    );
  }
}
