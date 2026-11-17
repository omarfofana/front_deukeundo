import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import 'etoiles_note.dart';
import 'format.dart';
import 'photo_placeholder.dart';

/// Carte d'annonce utilisée dans l'accueil, la recherche et les favoris.
class CarteAnnonce extends StatelessWidget {
  const CarteAnnonce({super.key, required this.annonce, this.compacte = false});

  final AnnonceDemo annonce;
  final bool compacte;

  @override
  Widget build(BuildContext context) {
    if (compacte) return _versionCompacte(context);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              const ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                child: PhotoPlaceholder(hauteur: 150, rayon: 0),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    annonce.favori
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline_rounded,
                    size: 18,
                    color: annonce.favori
                        ? AppColors.danger
                        : AppColors.textMuted,
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.navy,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'Dispo ${annonce.disponibleLe}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  annonce.titre,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Row(
                  children: <Widget>[
                    const Icon(
                      Icons.place_outlined,
                      size: 15,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${annonce.quartier}, ${annonce.ville} · ${annonce.type}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            formatFcfa(annonce.coutTotal),
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w800,
                              color: AppColors.navy,
                            ),
                          ),
                          Text(
                            'charges comprises / mois',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                    EtoilesNote(
                      note: annonce.note,
                      taille: 14,
                      nombreAvis: annonce.nombreAvis,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _versionCompacte(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            const SizedBox(
              width: 86,
              height: 86,
              child: PhotoPlaceholder(hauteur: 86, rayon: 12),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    annonce.titre,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${annonce.quartier} · ${annonce.chambres} chambres',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${formatFcfa(annonce.coutTotal)} / mois',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.navy,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              annonce.favori
                  ? Icons.favorite_rounded
                  : Icons.favorite_outline_rounded,
              size: 20,
              color: annonce.favori ? AppColors.danger : AppColors.textMuted,
            ),
          ],
        ),
      ),
    );
  }
}
