/// Formatage des montants en FCFA : 95000 -> « 95 000 FCFA ».
String formatFcfa(int montant) {
  final String chiffres = montant.abs().toString();
  final StringBuffer tampon = StringBuffer();
  for (int i = 0; i < chiffres.length; i++) {
    if (i > 0 && (chiffres.length - i) % 3 == 0) {
      tampon.write(' ');
    }
    tampon.write(chiffres[i]);
  }
  return '${montant < 0 ? '-' : ''}$tampon FCFA';
}

/// Initiales affichées dans les avatars : « Aïssatou D. » -> « AD ».
String initiales(String nomComplet) {
  final List<String> parties = nomComplet
      .trim()
      .split(RegExp(r'\s+'))
      .where((String p) => p.isNotEmpty)
      .toList();
  if (parties.isEmpty) return '?';
  if (parties.length == 1) return parties.first[0].toUpperCase();
  return (parties.first[0] + parties.last[0]).toUpperCase();
}
