import 'package:material_ui/material_ui.dart';

import '../theme/app_colors.dart';

/// Champ de formulaire avec libellé au-dessus.
class ChampTexte extends StatelessWidget {
  const ChampTexte({
    super.key,
    required this.libelle,
    required this.placeholder,
    this.icone,
    this.motDePasse = false,
    this.clavier,
    this.lignes = 1,
    this.suffixe,
    this.aide,
  });

  final String libelle;
  final String placeholder;
  final IconData? icone;
  final bool motDePasse;
  final TextInputType? clavier;
  final int lignes;
  final Widget? suffixe;
  final String? aide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          libelle,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: motDePasse,
          keyboardType: clavier,
          maxLines: motDePasse ? 1 : lignes,
          decoration: InputDecoration(
            hintText: placeholder,
            prefixIcon: icone == null
                ? null
                : Icon(icone, size: 20, color: AppColors.textMuted),
            suffixIcon: suffixe,
          ),
        ),
        if (aide != null) ...<Widget>[
          const SizedBox(height: 6),
          Text(aide!, style: Theme.of(context).textTheme.bodySmall),
        ],
      ],
    );
  }
}
