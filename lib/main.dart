import 'package:material_ui/material_ui.dart';

import 'screens/accueil_screen.dart';
import 'theme/app_theme.dart';

// ---------------------------------------------------------------------------
// Choix de l'écran affiché
//
// L'application n'a pas encore de navigation : elle affiche un seul écran,
// celui indiqué dans `home:` plus bas. Pour en afficher un autre, remplacez
// la ligne d'import ci-dessus et la ligne `home:` par celles de l'écran
// voulu dans la liste suivante.
//
//   import 'screens/bienvenue_screen.dart';          home: const BienvenueScreen(),
//   import 'screens/connexion_screen.dart';          home: const ConnexionScreen(),
//   import 'screens/inscription_screen.dart';        home: const InscriptionScreen(),
//   import 'screens/mot_de_passe_oublie_screen.dart'; home: const MotDePasseOublieScreen(),
//   import 'screens/accueil_screen.dart';            home: const AccueilScreen(),
//   import 'screens/recherche_screen.dart';          home: const RechercheScreen(),
//   import 'screens/detail_annonce_screen.dart';     home: const DetailAnnonceScreen(),
//   import 'screens/publier_annonce_screen.dart';    home: const PublierAnnonceScreen(),
//   import 'screens/regles_de_vie_screen.dart';      home: const ReglesDeVieScreen(),
//   import 'screens/mes_annonces_screen.dart';       home: const MesAnnoncesScreen(),
//   import 'screens/postuler_screen.dart';           home: const PostulerScreen(),
//   import 'screens/candidatures_screen.dart';       home: const CandidaturesScreen(),
//   import 'screens/cohabitation_screen.dart';       home: const CohabitationScreen(),
//   import 'screens/favoris_screen.dart';            home: const FavorisScreen(),
//   import 'screens/messagerie_screen.dart';         home: const MessagerieScreen(),
//   import 'screens/conversation_screen.dart';       home: const ConversationScreen(),
//   import 'screens/profil_screen.dart';             home: const ProfilScreen(),
//   import 'screens/modifier_profil_screen.dart';    home: const ModifierProfilScreen(),
//   import 'screens/avis_screen.dart';               home: const AvisScreen(),
//   import 'screens/evaluation_screen.dart';         home: const EvaluationScreen(),
//   import 'screens/signalement_screen.dart';        home: const SignalementScreen(),
//   import 'screens/administration_screen.dart';     home: const AdministrationScreen(),
// ---------------------------------------------------------------------------

void main() {
  runApp(const DeukendoApp());
}

class DeukendoApp extends StatelessWidget {
  const DeukendoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deukendo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const AccueilScreen(),
    );
  }
}
