// Vérifie que chaque écran se construit et se met en page sans erreur à la
// taille d'un téléphone. Le facteur d'échelle du texte compense la police des
// tests (Ahem), dont chaque caractère est un carré plein, environ deux fois
// plus large qu'une vraie police.
import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:front_deukeundo/screens/accueil_screen.dart';
import 'package:front_deukeundo/screens/administration_screen.dart';
import 'package:front_deukeundo/screens/avis_screen.dart';
import 'package:front_deukeundo/screens/bienvenue_screen.dart';
import 'package:front_deukeundo/screens/candidatures_screen.dart';
import 'package:front_deukeundo/screens/cohabitation_screen.dart';
import 'package:front_deukeundo/screens/connexion_screen.dart';
import 'package:front_deukeundo/screens/conversation_screen.dart';
import 'package:front_deukeundo/screens/detail_annonce_screen.dart';
import 'package:front_deukeundo/screens/evaluation_screen.dart';
import 'package:front_deukeundo/screens/favoris_screen.dart';
import 'package:front_deukeundo/screens/inscription_screen.dart';
import 'package:front_deukeundo/screens/mes_annonces_screen.dart';
import 'package:front_deukeundo/screens/messagerie_screen.dart';
import 'package:front_deukeundo/screens/modifier_profil_screen.dart';
import 'package:front_deukeundo/screens/mot_de_passe_oublie_screen.dart';
import 'package:front_deukeundo/screens/postuler_screen.dart';
import 'package:front_deukeundo/screens/profil_screen.dart';
import 'package:front_deukeundo/screens/publier_annonce_screen.dart';
import 'package:front_deukeundo/screens/recherche_screen.dart';
import 'package:front_deukeundo/screens/regles_de_vie_screen.dart';
import 'package:front_deukeundo/screens/signalement_screen.dart';
import 'package:front_deukeundo/theme/app_theme.dart';

void main() {
  final Map<String, Widget> ecrans = <String, Widget>{
    'bienvenue': const BienvenueScreen(),
    'connexion': const ConnexionScreen(),
    'inscription': const InscriptionScreen(),
    'motDePasse': const MotDePasseOublieScreen(),
    'accueil': const AccueilScreen(),
    'recherche': const RechercheScreen(),
    'detailAnnonce': const DetailAnnonceScreen(),
    'publier': const PublierAnnonceScreen(),
    'regles': const ReglesDeVieScreen(),
    'mesAnnonces': const MesAnnoncesScreen(),
    'postuler': const PostulerScreen(),
    'candidatures': const CandidaturesScreen(),
    'cohabitation': const CohabitationScreen(),
    'favoris': const FavorisScreen(),
    'messagerie': const MessagerieScreen(),
    'conversation': const ConversationScreen(),
    'profil': const ProfilScreen(),
    'modifierProfil': const ModifierProfilScreen(),
    'avis': const AvisScreen(),
    'evaluation': const EvaluationScreen(),
    'signalement': const SignalementScreen(),
    'administration': const AdministrationScreen(),
  };

  ecrans.forEach((String nom, Widget ecran) {
    testWidgets('rendu $nom', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(375, 812);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        MediaQuery(
          data: const MediaQueryData(textScaler: TextScaler.linear(0.52)),
          child: MaterialApp(theme: AppTheme.light, home: ecran),
        ),
      );
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);
    });
  });
}
