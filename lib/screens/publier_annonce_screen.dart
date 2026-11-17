import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/champ_texte.dart';
import '../widgets/titre_section.dart';

/// Formulaire de publication d'une annonce (propriétaire).
class PublierAnnonceScreen extends StatelessWidget {
  const PublierAnnonceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text('Publier une annonce'),
        actions: <Widget>[
          TextButton(onPressed: () {}, child: const Text('Brouillon')),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          _progression(context),
          const SizedBox(height: 24),
          const TitreSection(titre: 'Photos du logement'),
          const SizedBox(height: 12),
          _photos(),
          const SizedBox(height: 24),
          const TitreSection(titre: 'Informations principales'),
          const SizedBox(height: 14),
          const ChampTexte(
            libelle: 'Titre de l’annonce',
            placeholder: 'Chambre meublée dans appartement partagé',
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Description',
            placeholder: 'Décrivez le logement, l’ambiance, le quartier…',
            lignes: 5,
          ),
          const SizedBox(height: 24),
          const TitreSection(titre: 'Localisation'),
          const SizedBox(height: 14),
          const Row(
            children: <Widget>[
              Expanded(
                child: ChampTexte(libelle: 'Ville', placeholder: 'Dakar'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ChampTexte(
                  libelle: 'Quartier',
                  placeholder: 'Sacré-Cœur 3',
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Adresse',
            placeholder: 'Rue, repère proche',
            icone: Icons.place_outlined,
            aide: 'Seule une adresse approximative est montrée aux visiteurs.',
          ),
          const SizedBox(height: 24),
          const TitreSection(titre: 'Logement'),
          const SizedBox(height: 14),
          _selecteur(context, 'Type de logement', 'Appartement'),
          const SizedBox(height: 18),
          const Row(
            children: <Widget>[
              Expanded(
                child: ChampTexte(
                  libelle: 'Nombre de chambres',
                  placeholder: '3',
                  clavier: TextInputType.number,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ChampTexte(
                  libelle: 'Chambres libres',
                  placeholder: '1',
                  clavier: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const TitreSection(titre: 'Conditions financières'),
          const SizedBox(height: 14),
          const Row(
            children: <Widget>[
              Expanded(
                child: ChampTexte(
                  libelle: 'Loyer mensuel (FCFA)',
                  placeholder: '95 000',
                  clavier: TextInputType.number,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ChampTexte(
                  libelle: 'Charges (FCFA)',
                  placeholder: '15 000',
                  clavier: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Caution demandée',
            placeholder: '2 mois de loyer',
            icone: Icons.account_balance_wallet_outlined,
          ),
          const SizedBox(height: 18),
          _selecteur(context, 'Disponible à partir du', '1er décembre 2026'),
          const SizedBox(height: 24),
          const TitreSection(titre: 'Équipements'),
          const SizedBox(height: 12),
          _equipements(),
          const SizedBox(height: 28),
          FilledButton(
            onPressed: () {},
            child: const Text('Continuer vers les règles de vie'),
          ),
        ],
      ),
    );
  }

  Widget _progression(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text(
              'Étape 1 sur 3',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Spacer(),
            const Text(
              'Le logement',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.teal,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(999),
          child: const LinearProgressIndicator(
            value: 1 / 3,
            minHeight: 6,
            backgroundColor: AppColors.border,
            color: AppColors.teal,
          ),
        ),
      ],
    );
  }

  Widget _photos() {
    return SizedBox(
      height: 96,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        separatorBuilder: (_, _) => const SizedBox(width: 10),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              width: 96,
              decoration: BoxDecoration(
                color: AppColors.tealLight,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppColors.teal),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.add_a_photo_outlined, color: AppColors.teal),
                  SizedBox(height: 6),
                  Text(
                    'Ajouter',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.teal,
                    ),
                  ),
                ],
              ),
            );
          }
          return Container(
            width: 96,
            decoration: BoxDecoration(
              color: const Color(0xFFE8EEF6),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.image_outlined,
              color: AppColors.textMuted,
            ),
          );
        },
      ),
    );
  }

  Widget _selecteur(BuildContext context, String libelle, String valeur) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          libelle,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children: <Widget>[
              Text(
                valeur,
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textPrimary,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _equipements() {
    const List<String> equipements = <String>[
      'Meublé',
      'Wi-Fi',
      'Climatisation',
      'Eau incluse',
      'Électricité incluse',
      'Cuisine équipée',
      'Parking',
      'Gardien',
    ];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: <Widget>[
        for (int i = 0; i < equipements.length; i++)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: i < 3 ? AppColors.tealLight : AppColors.surface,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: i < 3 ? AppColors.teal : AppColors.border,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (i < 3) ...<Widget>[
                  const Icon(Icons.check_rounded, size: 15, color: AppColors.teal),
                  const SizedBox(width: 6),
                ],
                Text(
                  equipements[i],
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: i < 3 ? AppColors.teal : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
