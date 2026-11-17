import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import 'format.dart';

/// Avatar à initiales, en attendant les photos de profil du serveur.
class AvatarUtilisateur extends StatelessWidget {
  const AvatarUtilisateur({super.key, required this.nom, this.taille = 44});

  final String nom;
  final double taille;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: taille,
      height: taille,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: <Color>[AppColors.navyLight, AppColors.navy],
        ),
      ),
      child: Text(
        initiales(nom),
        style: TextStyle(
          color: Colors.white,
          fontSize: taille * 0.36,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
