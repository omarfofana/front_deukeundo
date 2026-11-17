import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Message affiché quand une liste est vide.
class EtatVide extends StatelessWidget {
  const EtatVide({
    super.key,
    required this.icone,
    required this.titre,
    required this.message,
    this.actionLibelle,
  });

  final IconData icone;
  final String titre;
  final String message;
  final String? actionLibelle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: AppColors.tealLight,
                shape: BoxShape.circle,
              ),
              child: Icon(icone, size: 32, color: AppColors.teal),
            ),
            const SizedBox(height: 16),
            Text(titre, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 6),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            if (actionLibelle != null) ...<Widget>[
              const SizedBox(height: 20),
              SizedBox(
                width: 220,
                child: FilledButton(
                  onPressed: () {},
                  child: Text(actionLibelle!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
