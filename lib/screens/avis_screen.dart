import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import '../widgets/avatar_utilisateur.dart';
import '../widgets/etoiles_note.dart';

/// Avis reçus par un utilisateur, avec répartition des notes.
class AvisScreen extends StatelessWidget {
  const AvisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const BackButton(), title: const Text('Avis')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          _resume(context),
          const SizedBox(height: 22),
          Text(
            '${DonneesDemo.avis.length} avis publiés',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 14),
          for (final AvisDemo a in DonneesDemo.avis) ...<Widget>[
            _carte(context, a),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  Widget _resume(BuildContext context) {
    const List<(int, double)> repartition = <(int, double)>[
      (5, 0.62),
      (4, 0.25),
      (3, 0.08),
      (2, 0.03),
      (1, 0.02),
    ];
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              const Text(
                '4,7',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: AppColors.navy,
                  height: 1,
                ),
              ),
              const SizedBox(height: 6),
              const EtoilesNote(note: 4.7, taille: 14, afficherValeur: false),
              const SizedBox(height: 4),
              Text('8 avis', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          const SizedBox(width: 22),
          Expanded(
            child: Column(
              children: <Widget>[
                for (final (int note, double part) in repartition)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 12,
                          child: Text(
                            '$note',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(999),
                            child: LinearProgressIndicator(
                              value: part,
                              minHeight: 6,
                              backgroundColor: AppColors.border,
                              color: AppColors.amber,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _carte(BuildContext context, AvisDemo avis) {
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
          Row(
            children: <Widget>[
              AvatarUtilisateur(nom: avis.auteur, taille: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      avis.auteur,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${avis.role} · ${avis.date}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              EtoilesNote(note: avis.note, taille: 14, afficherValeur: false),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            avis.commentaire,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          if (avis.reponse != null) ...<Widget>[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Réponse du membre',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.teal,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    avis.reponse!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              const Icon(
                Icons.reply_rounded,
                size: 15,
                color: AppColors.textMuted,
              ),
              const SizedBox(width: 6),
              Text('Répondre', style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(width: 18),
              const Icon(
                Icons.flag_outlined,
                size: 15,
                color: AppColors.textMuted,
              ),
              const SizedBox(width: 6),
              Text('Signaler', style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ],
      ),
    );
  }
}
