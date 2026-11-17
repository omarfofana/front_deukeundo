import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import '../widgets/carte_annonce.dart';

/// Page de recherche avec filtres (ville, budget, type, date).
class RechercheScreen extends StatelessWidget {
  const RechercheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Rechercher'),
        actions: <Widget>[
          TextButton(onPressed: () {}, child: const Text('Réinitialiser')),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.border),
            ),
            child: const Row(
              children: <Widget>[
                Icon(Icons.search_rounded, size: 20, color: AppColors.textMuted),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Dakar, Sacré-Cœur',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Icon(Icons.close_rounded, size: 18, color: AppColors.textMuted),
              ],
            ),
          ),
          const SizedBox(height: 18),
          _filtresRapides(),
          const SizedBox(height: 22),
          _budget(context),
          const SizedBox(height: 22),
          _typeLogement(context),
          const SizedBox(height: 22),
          _dateEntree(context),
          const SizedBox(height: 24),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  '${DonneesDemo.annonces.length} résultats',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Icon(Icons.swap_vert_rounded, size: 18, color: AppColors.teal),
              const SizedBox(width: 4),
              const Text(
                'Prix croissant',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.teal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          for (final AnnonceDemo annonce in DonneesDemo.annonces) ...<Widget>[
            CarteAnnonce(annonce: annonce, compacte: true),
            const SizedBox(height: 12),
          ],
        ],
      ),
    );
  }

  Widget _filtresRapides() {
    const List<String> filtres = <String>[
      'Meublé',
      'Wi-Fi',
      'Eau incluse',
      'Non-fumeur',
      'Femmes uniquement',
    ];
    return SizedBox(
      height: 36,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: filtres.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (BuildContext context, int index) {
          final bool actif = index == 0;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: actif ? AppColors.navy : AppColors.surface,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: actif ? AppColors.navy : AppColors.border,
              ),
            ),
            child: Text(
              filtres[index],
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: actif ? Colors.white : AppColors.textSecondary,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _budget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                'Budget mensuel',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Text(
              '50 000 – 150 000 FCFA',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: AppColors.teal,
              ),
            ),
          ],
        ),
        RangeSlider(
          values: const RangeValues(50000, 150000),
          min: 0,
          max: 300000,
          onChanged: (_) {},
        ),
      ],
    );
  }

  Widget _typeLogement(BuildContext context) {
    const List<(IconData, String)> types = <(IconData, String)>[
      (Icons.bed_outlined, 'Chambre'),
      (Icons.apartment_rounded, 'Appartement'),
      (Icons.home_outlined, 'Villa'),
      (Icons.meeting_room_outlined, 'Studio'),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Type de logement',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: <Widget>[
            for (int i = 0; i < types.length; i++)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: i == 1 ? AppColors.tealLight : AppColors.surface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: i == 1 ? AppColors.teal : AppColors.border,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(
                      types[i].$1,
                      size: 18,
                      color: i == 1 ? AppColors.teal : AppColors.textMuted,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      types[i].$2,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: i == 1 ? AppColors.teal : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _dateEntree(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Date d’entrée souhaitée',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.border),
          ),
          child: const Row(
            children: <Widget>[
              Icon(
                Icons.calendar_today_outlined,
                size: 18,
                color: AppColors.textMuted,
              ),
              SizedBox(width: 10),
              Text(
                '1er décembre 2026',
                style: TextStyle(fontSize: 14, color: AppColors.textPrimary),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: AppColors.textMuted,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
