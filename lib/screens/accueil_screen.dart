import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import '../widgets/carte_annonce.dart';
import '../widgets/titre_section.dart';

/// Page d'accueil : recherche rapide, quartiers populaires et annonces.
class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.only(bottom: 32),
          children: <Widget>[
            _enTete(context),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const TitreSection(
                    titre: 'Quartiers recherchés',
                    action: 'Tout voir',
                  ),
                  const SizedBox(height: 12),
                  _quartiers(),
                  const SizedBox(height: 28),
                  const TitreSection(
                    titre: 'Annonces récentes',
                    sousTitre: 'Mises à jour aujourd’hui',
                    action: 'Tout voir',
                  ),
                  const SizedBox(height: 12),
                  for (final AnnonceDemo annonce in DonneesDemo.annonces) ...<Widget>[
                    CarteAnnonce(annonce: annonce),
                    const SizedBox(height: 14),
                  ],
                  const SizedBox(height: 14),
                  _blocConfiance(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _enTete(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[AppColors.navy, AppColors.navyDark],
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(26)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Deukendo',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'La colocation plus simple et plus rassurante.',
                      style: TextStyle(color: Color(0xFFB9C7DA), fontSize: 13),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Row(
              children: <Widget>[
                Icon(Icons.search_rounded, color: AppColors.textMuted, size: 20),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Ville, quartier ou budget…',
                    style: TextStyle(color: AppColors.textMuted, fontSize: 14),
                  ),
                ),
                Icon(Icons.tune_rounded, color: AppColors.teal, size: 20),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              _statistique('1 248', 'annonces'),
              const SizedBox(width: 10),
              _statistique('860', 'colocataires'),
              const SizedBox(width: 10),
              _statistique('12', 'quartiers'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statistique(String valeur, String libelle) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: <Widget>[
            Text(
              valeur,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            Text(
              libelle,
              style: const TextStyle(color: Color(0xFFB9C7DA), fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quartiers() {
    const List<(String, String)> quartiers = <(String, String)>[
      ('Sacré-Cœur', '184 annonces'),
      ('Point E', '126 annonces'),
      ('Mermoz', '98 annonces'),
      ('Ouakam', '71 annonces'),
    ];
    return SizedBox(
      height: 112,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: quartiers.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (BuildContext context, int index) {
          final (String nom, String compte) = quartiers[index];
          return Container(
            width: 140,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Icon(
                  Icons.apartment_rounded,
                  color: AppColors.teal,
                  size: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      nom,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      compte,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _blocConfiance(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.amberLight,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFFF2DDBB)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Icon(Icons.shield_outlined, color: AppColors.amber),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Louez en confiance',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  'Ne versez jamais d’argent avant la visite. Signalez toute '
                  'annonce suspecte depuis la conversation.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
