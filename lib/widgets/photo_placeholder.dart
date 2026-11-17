import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Emplacement de photo d'annonce, en attendant le stockage des images.
class PhotoPlaceholder extends StatelessWidget {
  const PhotoPlaceholder({
    super.key,
    this.hauteur = 160,
    this.rayon = 16,
    this.icone = Icons.photo_outlined,
    this.etiquette,
  });

  final double hauteur;
  final double rayon;
  final IconData icone;
  final String? etiquette;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hauteur,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rayon),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[Color(0xFFE8EEF6), Color(0xFFD6E2EF)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icone, size: 30, color: AppColors.textMuted),
          if (etiquette != null) ...<Widget>[
            const SizedBox(height: 6),
            Text(
              etiquette!,
              style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
            ),
          ],
        ],
      ),
    );
  }
}
