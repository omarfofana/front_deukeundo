import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import '../widgets/badge_statut.dart';
import '../widgets/format.dart';
import '../widgets/photo_placeholder.dart';

/// Annonces publiées par le propriétaire connecté.
class MesAnnoncesScreen extends StatelessWidget {
  const MesAnnoncesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> statuts = <String>[
      'Publiée',
      'Publiée',
      'Brouillon',
      'Indisponible',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes annonces'),
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.add_rounded)),
          const SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          Row(
            children: <Widget>[
              _statistique(context, '4', 'annonces'),
              const SizedBox(width: 10),
              _statistique(context, '12', 'candidatures'),
              const SizedBox(width: 10),
              _statistique(context, '318', 'vues'),
            ],
          ),
          const SizedBox(height: 22),
          for (int i = 0; i < DonneesDemo.annonces.length; i++) ...<Widget>[
            _carte(context, DonneesDemo.annonces[i], statuts[i]),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  Widget _statistique(BuildContext context, String valeur, String libelle) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: <Widget>[
            Text(
              valeur,
              style: const TextStyle(
                fontSize: 20,
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

  Widget _carte(BuildContext context, AnnonceDemo annonce, String statut) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              const SizedBox(
                width: 72,
                height: 72,
                child: PhotoPlaceholder(hauteur: 72, rayon: 12),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            annonce.titre,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        const SizedBox(width: 8),
                        BadgeStatut.depuisStatut(statut),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${annonce.quartier} · ${formatFcfa(annonce.coutTotal)}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.visibility_outlined,
                          size: 14,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '86 vues',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.description_outlined,
                          size: 14,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(width: 4),
                        Flexible(
                          child: Text(
                            '3 candidatures',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(),
          ),
          Row(
            children: <Widget>[
              _action(Icons.edit_outlined, 'Modifier'),
              _action(Icons.people_outline_rounded, 'Candidatures'),
              _action(Icons.delete_outline_rounded, 'Supprimer'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _action(IconData icone, String libelle) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icone, size: 16, color: AppColors.textSecondary),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              libelle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
