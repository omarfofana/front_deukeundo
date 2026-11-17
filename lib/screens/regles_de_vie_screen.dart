import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import '../widgets/champ_texte.dart';

/// Définition des exigences comportementales attachées à une annonce.
class ReglesDeVieScreen extends StatelessWidget {
  const ReglesDeVieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Règles de vie'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.amberLight,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Icon(Icons.info_outline_rounded, size: 18, color: AppColors.amber),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Les règles marquées obligatoires doivent être acceptées par '
                    'le candidat avant qu’il puisse envoyer sa candidature.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Règles définies',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < DonneesDemo.reglesDeVie.length; i++) ...<Widget>[
            _CarteRegle(
              titre: DonneesDemo.reglesDeVie[i],
              categorie: const <String>[
                'Santé',
                'Tranquillité',
                'Propreté',
                'Visites',
                'Finances',
              ][i],
              obligatoire: i < 3,
            ),
            const SizedBox(height: 10),
          ],
          const SizedBox(height: 14),
          Text(
            'Ajouter une règle',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 14),
          const ChampTexte(
            libelle: 'Intitulé',
            placeholder: 'Ex. : pas d’animaux domestiques',
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Précision (facultatif)',
            placeholder: 'Expliquez la règle en une ou deux phrases',
            lignes: 3,
          ),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              Switch(value: true, onChanged: (_) {}),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Règle obligatoire',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Ajouter la règle'),
          ),
          const SizedBox(height: 28),
          FilledButton(
            onPressed: () {},
            child: const Text('Publier l’annonce'),
          ),
        ],
      ),
    );
  }
}

class _CarteRegle extends StatelessWidget {
  const _CarteRegle({
    required this.titre,
    required this.categorie,
    required this.obligatoire,
  });

  final String titre;
  final String categorie;
  final bool obligatoire;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  titre,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        categorie,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    if (obligatoire) ...<Widget>[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.amberLight,
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: const Text(
                          'Obligatoire',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFFB4772A),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.edit_outlined, size: 18, color: AppColors.textMuted),
          const SizedBox(width: 14),
          const Icon(
            Icons.delete_outline_rounded,
            size: 18,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }
}
