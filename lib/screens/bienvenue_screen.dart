import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Premier écran avant connexion : présentation et accès au compte.
class BienvenueScreen extends StatelessWidget {
  const BienvenueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 24, 28, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Text(
                  'D',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              const SizedBox(height: 44),
              const Text(
                'Deukendo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'La colocation plus simple et plus rassurante.',
                style: TextStyle(
                  color: Color(0xFFD6E0EC),
                  fontSize: 17,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 28),
              _argument(
                Icons.search_rounded,
                'Trouvez une chambre',
                'Par quartier, budget et date d’entrée.',
              ),
              _argument(
                Icons.group_outlined,
                'Choisissez vos colocataires',
                'Règles de vie annoncées dès le départ.',
              ),
              _argument(
                Icons.shield_outlined,
                'Échangez en confiance',
                'Avis, modération et signalement.',
              ),
              const SizedBox(height: 44),
              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.navy,
                ),
                child: const Text('Créer un compte'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white.withValues(alpha: 0.4)),
                ),
                child: const Text('J’ai déjà un compte'),
              ),
              const SizedBox(height: 14),
              Center(
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFFB9C7DA),
                  ),
                  child: const Text('Continuer sans compte'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _argument(IconData icone, String titre, String texte) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icone, size: 18, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  titre,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  texte,
                  style: const TextStyle(
                    color: Color(0xFFB9C7DA),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
