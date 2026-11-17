import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../widgets/carte_annonce.dart';

/// Annonces mises en favori par l'utilisateur.
class FavorisScreen extends StatelessWidget {
  const FavorisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AnnonceDemo> favoris = DonneesDemo.annonces
        .where((AnnonceDemo a) => a.favori)
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Mes favoris')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: <Widget>[
          Text(
            '${favoris.length} annonces enregistrées',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          for (final AnnonceDemo annonce in favoris) ...<Widget>[
            CarteAnnonce(annonce: annonce),
            const SizedBox(height: 14),
          ],
        ],
      ),
    );
  }
}
