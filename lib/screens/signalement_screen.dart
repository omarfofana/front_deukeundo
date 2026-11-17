import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/champ_texte.dart';

/// Signalement d'une annonce, d'un avis ou d'un utilisateur.
class SignalementScreen extends StatelessWidget {
  const SignalementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> motifs = <String>[
      'Annonce frauduleuse ou fausse',
      'Logement déjà occupé',
      'Demande d’argent avant visite',
      'Propos déplacés ou harcèlement',
      'Discrimination',
      'Autre',
    ];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: const CloseButton(),
        title: const Text('Signaler'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          Text(
            'Que souhaitez-vous signaler ?',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 6),
          Text(
            'Votre signalement est confidentiel. Il sera examiné par l’équipe '
            'de modération.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 22),
          RadioGroup<int>(
            groupValue: 0,
            onChanged: (_) {},
            child: Column(
              children: <Widget>[
                for (int i = 0; i < motifs.length; i++)
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: i == 0 ? AppColors.tealLight : AppColors.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: i == 0 ? AppColors.teal : AppColors.border,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Radio<int>(value: i),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            motifs[i],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: i == 0
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const ChampTexte(
            libelle: 'Précisions',
            placeholder: 'Décrivez ce qui s’est passé…',
            lignes: 5,
          ),
          const SizedBox(height: 18),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.attach_file_rounded, size: 18),
            label: const Text('Joindre une capture d’écran'),
          ),
          const SizedBox(height: 26),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(backgroundColor: AppColors.danger),
            child: const Text('Envoyer le signalement'),
          ),
        ],
      ),
    );
  }
}
