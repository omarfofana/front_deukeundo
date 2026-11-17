import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import '../widgets/avatar_utilisateur.dart';
import '../widgets/badge_statut.dart';

/// Candidatures : celles reçues (propriétaire) et celles envoyées (colocataire).
class CandidaturesScreen extends StatelessWidget {
  const CandidaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Candidatures'),
          bottom: const TabBar(
            labelColor: AppColors.navy,
            unselectedLabelColor: AppColors.textMuted,
            indicatorColor: AppColors.teal,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            tabs: <Widget>[
              Tab(text: 'Reçues'),
              Tab(text: 'Envoyées'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[_recues(context), _envoyees(context)],
        ),
      ),
    );
  }

  Widget _recues(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: <Widget>[
        for (final CandidatureDemo c in DonneesDemo.candidatures) ...<Widget>[
          _carteRecue(context, c),
          const SizedBox(height: 12),
        ],
      ],
    );
  }

  Widget _carteRecue(BuildContext context, CandidatureDemo c) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              AvatarUtilisateur(nom: c.candidat, taille: 42),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      c.candidat,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      c.annonce,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              BadgeStatut.depuisStatut(c.statut),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: <Widget>[
              Icon(
                c.exigencesAcceptees
                    ? Icons.verified_outlined
                    : Icons.error_outline_rounded,
                size: 15,
                color: c.exigencesAcceptees
                    ? AppColors.success
                    : AppColors.danger,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  c.exigencesAcceptees
                      ? 'Règles de vie acceptées'
                      : 'Règles obligatoires non acceptées',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Text(c.date, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          if (c.statut == 'En attente') ...<Widget>[
            const SizedBox(height: 14),
            Row(
              children: <Widget>[
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(42),
                      foregroundColor: AppColors.danger,
                    ),
                    child: const Text('Refuser'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(42),
                    ),
                    child: const Text('Accepter'),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _envoyees(BuildContext context) {
    const List<(String, String, String)> envoyees = <(String, String, String)>[
      ('Chambre meublée · Sacré-Cœur 3', '12 novembre 2026', 'En attente'),
      ('Studio partagé · Mermoz', '5 novembre 2026', 'Acceptée'),
      ('Grande chambre · Ouakam', '28 octobre 2026', 'Refusée'),
    ];

    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: <Widget>[
        for (final (String titre, String date, String statut) in envoyees)
          Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        titre,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Envoyée le $date',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                BadgeStatut.depuisStatut(statut),
              ],
            ),
          ),
      ],
    );
  }
}
