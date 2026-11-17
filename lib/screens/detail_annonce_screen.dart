import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import '../widgets/avatar_utilisateur.dart';
import '../widgets/etoiles_note.dart';
import '../widgets/format.dart';
import '../widgets/photo_placeholder.dart';
import '../widgets/titre_section.dart';

/// Détail d'une annonce : photos, coût, logement, règles de vie, annonceur.
class DetailAnnonceScreen extends StatelessWidget {
  const DetailAnnonceScreen({super.key});

  AnnonceDemo get _annonce => DonneesDemo.annonces.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: AppColors.surface,
            leading: const _BoutonRond(icone: Icons.arrow_back_rounded),
            actions: const <Widget>[
              _BoutonRond(icone: Icons.favorite_outline_rounded),
              _BoutonRond(icone: Icons.share_outlined),
              SizedBox(width: 8),
            ],
            flexibleSpace: const FlexibleSpaceBar(
              background: PhotoPlaceholder(
                hauteur: 240,
                rayon: 0,
                icone: Icons.photo_library_outlined,
                etiquette: '5 photos',
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          _annonce.titre,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.place_outlined,
                        size: 16,
                        color: AppColors.textMuted,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '${_annonce.quartier}, ${_annonce.ville}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(width: 12),
                      EtoilesNote(note: _annonce.note, taille: 14),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _blocCout(context),
                  const SizedBox(height: 24),
                  const TitreSection(titre: 'Le logement'),
                  const SizedBox(height: 12),
                  _caracteristiques(),
                  const SizedBox(height: 24),
                  const TitreSection(titre: 'Description'),
                  const SizedBox(height: 10),
                  Text(
                    'Chambre meublée dans un appartement partagé par trois '
                    'personnes, calme et bien desservi. Salon et cuisine communs, '
                    'eau et électricité stables, Wi-Fi inclus. Proche des '
                    'commerces et à 10 minutes des universités.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  const TitreSection(
                    titre: 'Règles de vie',
                    sousTitre: 'À accepter avant de postuler',
                  ),
                  const SizedBox(height: 12),
                  for (final String regle in DonneesDemo.reglesDeVie)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Icon(
                            Icons.check_circle_outline_rounded,
                            size: 18,
                            color: AppColors.teal,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              regle,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 14),
                  const TitreSection(titre: 'L’annonceur'),
                  const SizedBox(height: 12),
                  _annonceur(context),
                  const SizedBox(height: 24),
                  _avertissement(context),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _barreAction(context),
    );
  }

  Widget _blocCout(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.tealLight,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: <Widget>[
          _ligneCout('Loyer mensuel', formatFcfa(_annonce.prix)),
          const SizedBox(height: 8),
          _ligneCout('Charges', formatFcfa(_annonce.charges)),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: Color(0xFFBFDEDE)),
          ),
          Row(
            children: <Widget>[
              const Expanded(
                child: Text(
                  'Coût total',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
              Text(
                formatFcfa(_annonce.coutTotal),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _ligneCout(String libelle, String valeur) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            libelle,
            style: const TextStyle(
              fontSize: 13,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Text(
          valeur,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _caracteristiques() {
    const List<(IconData, String)> items = <(IconData, String)>[
      (Icons.apartment_rounded, 'Appartement'),
      (Icons.bed_outlined, '3 chambres'),
      (Icons.group_outlined, '2 colocataires'),
      (Icons.weekend_outlined, 'Meublé'),
      (Icons.wifi_rounded, 'Wi-Fi'),
      (Icons.event_available_outlined, 'Dispo 1er déc.'),
    ];
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: <Widget>[
        for (final (IconData icone, String libelle) in items)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(icone, size: 17, color: AppColors.teal),
                const SizedBox(width: 8),
                Text(
                  libelle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _annonceur(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: <Widget>[
          AvatarUtilisateur(nom: _annonce.auteur),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _annonce.auteur,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  'Propriétaire · membre depuis 2025',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 6),
                EtoilesNote(
                  note: _annonce.note,
                  taille: 13,
                  nombreAvis: _annonce.nombreAvis,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textMuted,
          ),
        ],
      ),
    );
  }

  Widget _avertissement(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Icon(Icons.flag_outlined, size: 18, color: AppColors.textMuted),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            'Une information vous semble fausse ? Signalez cette annonce, elle '
            'sera examinée par la modération.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }

  Widget _barreAction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.chat_bubble_outline_rounded, size: 18),
              label: const Text('Message'),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: FilledButton(
              onPressed: () {},
              child: const Text('Postuler à cette colocation'),
            ),
          ),
        ],
      ),
    );
  }
}

class _BoutonRond extends StatelessWidget {
  const _BoutonRond({required this.icone});

  final IconData icone;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 36,
        height: 36,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Icon(icone, size: 19, color: AppColors.textPrimary),
      ),
    );
  }
}
