import 'package:material_ui/material_ui.dart';

import '../data/donnees_demo.dart';
import '../theme/app_colors.dart';
import '../widgets/champ_texte.dart';
import '../widgets/format.dart';
import '../widgets/photo_placeholder.dart';

/// Envoi d'une candidature : acceptation des règles obligatoires + message.
class PostulerScreen extends StatelessWidget {
  const PostulerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AnnonceDemo annonce = DonneesDemo.annonces.first;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Postuler'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.background,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 60,
                  height: 60,
                  child: PhotoPlaceholder(hauteur: 60, rayon: 10),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        annonce.titre,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${annonce.quartier} · ${formatFcfa(annonce.coutTotal)} / mois',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Text(
            'Règles à accepter',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 6),
          Text(
            'Votre candidature ne peut pas être envoyée tant que les règles '
            'obligatoires ne sont pas acceptées.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16),
          for (int i = 0; i < DonneesDemo.reglesDeVie.length; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: i < 3,
                      onChanged: (_) {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            DonneesDemo.reglesDeVie[i],
                            style: const TextStyle(
                              fontSize: 14,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          if (i < 3)
                            Text(
                              'Obligatoire',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Message de présentation',
            placeholder:
                'Présentez-vous en quelques lignes : activité, rythme de vie, '
                'date d’entrée souhaitée…',
            lignes: 6,
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Date d’entrée souhaitée',
            placeholder: '1er décembre 2026',
            icone: Icons.calendar_today_outlined,
          ),
          const SizedBox(height: 18),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.tealLight,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Icon(
                  Icons.visibility_outlined,
                  size: 18,
                  color: AppColors.teal,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Votre profil et vos avis seront visibles par l’annonceur. '
                    'Votre téléphone ne sera partagé que si votre candidature est '
                    'retenue.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 26),
          FilledButton(
            onPressed: () {},
            child: const Text('Envoyer ma candidature'),
          ),
        ],
      ),
    );
  }
}
