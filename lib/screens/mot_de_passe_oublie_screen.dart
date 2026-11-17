import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/champ_texte.dart';

/// Page de réinitialisation du mot de passe.
class MotDePasseOublieScreen extends StatelessWidget {
  const MotDePasseOublieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(leading: const BackButton(), title: const Text('')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 56,
              height: 56,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.tealLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.lock_reset_rounded,
                color: AppColors.teal,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Text(
            'Mot de passe oublié',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 8),
          Text(
            'Saisissez l’adresse e-mail de votre compte. Nous vous enverrons '
            'un lien pour choisir un nouveau mot de passe.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 28),
          const ChampTexte(
            libelle: 'Adresse e-mail',
            placeholder: 'vous@exemple.sn',
            icone: Icons.mail_outline_rounded,
            clavier: TextInputType.emailAddress,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {},
            child: const Text('Envoyer le lien'),
          ),
          const SizedBox(height: 14),
          OutlinedButton(
            onPressed: () {},
            child: const Text('Revenir à la connexion'),
          ),
        ],
      ),
    );
  }
}
