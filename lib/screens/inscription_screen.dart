import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/champ_texte.dart';

/// Page de création de compte, avec choix du rôle (propriétaire / colocataire).
class InscriptionScreen extends StatelessWidget {
  const InscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Créer un compte'),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
        children: <Widget>[
          Text(
            'Quelques informations pour commencer',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 6),
          Text(
            'Votre profil sera visible par les personnes avec qui vous échangez.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          const Text(
            'Je suis…',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            children: <Widget>[
              Expanded(
                child: _CarteRole(
                  icone: Icons.search_rounded,
                  titre: 'Colocataire',
                  description: 'Je cherche une chambre',
                  selectionne: true,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _CarteRole(
                  icone: Icons.key_outlined,
                  titre: 'Propriétaire',
                  description: 'J’ai une place libre',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Row(
            children: <Widget>[
              Expanded(
                child: ChampTexte(libelle: 'Prénom', placeholder: 'Awa'),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ChampTexte(libelle: 'Nom', placeholder: 'Diallo'),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Adresse e-mail',
            placeholder: 'vous@exemple.sn',
            icone: Icons.mail_outline_rounded,
            clavier: TextInputType.emailAddress,
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Téléphone',
            placeholder: '+221 77 000 00 00',
            icone: Icons.phone_outlined,
            clavier: TextInputType.phone,
            aide: 'Votre numéro n’est partagé qu’après acceptation.',
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Mot de passe',
            placeholder: 'Au moins 8 caractères',
            icone: Icons.lock_outline_rounded,
            motDePasse: true,
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Confirmer le mot de passe',
            placeholder: 'Ressaisissez votre mot de passe',
            icone: Icons.lock_outline_rounded,
            motDePasse: true,
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: false,
                  onChanged: (_) {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'J’accepte les conditions d’utilisation et la politique '
                  'de confidentialité de Deukendo.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          FilledButton(onPressed: () {}, child: const Text('Créer mon compte')),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: <Widget>[
              Text(
                'Déjà inscrit ?',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(onPressed: () {}, child: const Text('Se connecter')),
            ],
          ),
        ],
      ),
    );
  }
}

class _CarteRole extends StatelessWidget {
  const _CarteRole({
    required this.icone,
    required this.titre,
    required this.description,
    this.selectionne = false,
  });

  final IconData icone;
  final String titre;
  final String description;
  final bool selectionne;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: selectionne ? AppColors.tealLight : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: selectionne ? AppColors.teal : AppColors.border,
          width: selectionne ? 1.6 : 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            icone,
            size: 22,
            color: selectionne ? AppColors.teal : AppColors.textMuted,
          ),
          const SizedBox(height: 10),
          Text(
            titre,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            description,
            style: const TextStyle(fontSize: 11, color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
