import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';
import '../widgets/avatar_utilisateur.dart';
import '../widgets/champ_texte.dart';
import '../widgets/titre_section.dart';

/// Édition des informations du profil et des préférences de vie.
class ModifierProfilScreen extends StatelessWidget {
  const ModifierProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Modifier mon profil'),
        actions: <Widget>[
          TextButton(onPressed: () {}, child: const Text('Enregistrer')),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                const AvatarUtilisateur(nom: 'Awa Diallo', taille: 92),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.teal,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      size: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const TitreSection(titre: 'Informations personnelles'),
          const SizedBox(height: 14),
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
            placeholder: 'awa.diallo@exemple.sn',
            icone: Icons.mail_outline_rounded,
            clavier: TextInputType.emailAddress,
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'Téléphone',
            placeholder: '+221 77 000 00 00',
            icone: Icons.phone_outlined,
            clavier: TextInputType.phone,
          ),
          const SizedBox(height: 18),
          const ChampTexte(
            libelle: 'À propos de moi',
            placeholder: 'Quelques mots sur votre rythme de vie, vos habitudes…',
            lignes: 4,
          ),
          const SizedBox(height: 26),
          const TitreSection(
            titre: 'Préférences de vie',
            sousTitre: 'Servent au matching avec les colocataires',
          ),
          const SizedBox(height: 14),
          _bascule('Non-fumeur', true),
          _bascule('Accepte les animaux', false),
          _bascule('Accepte les visiteurs', true),
          _bascule('Profil visible dans la recherche', true),
          const SizedBox(height: 26),
          const TitreSection(titre: 'Sécurité'),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.lock_outline_rounded, size: 18),
            label: const Text('Changer mon mot de passe'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(foregroundColor: AppColors.danger),
            icon: const Icon(Icons.delete_outline_rounded, size: 18),
            label: const Text('Supprimer mon compte'),
          ),
        ],
      ),
    );
  }

  Widget _bascule(String libelle, bool valeur) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              libelle,
              style: const TextStyle(fontSize: 14, color: AppColors.textPrimary),
            ),
          ),
          Switch(value: valeur, onChanged: (_) {}),
        ],
      ),
    );
  }
}
