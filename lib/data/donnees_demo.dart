/// Données statiques utilisées pour afficher les maquettes d'écrans.
/// Elles seront remplacées par les appels à l'API Spring Boot.
library;

class AnnonceDemo {
  const AnnonceDemo({
    required this.titre,
    required this.quartier,
    required this.ville,
    required this.prix,
    required this.charges,
    required this.type,
    required this.chambres,
    required this.disponibleLe,
    required this.note,
    required this.nombreAvis,
    required this.auteur,
    this.favori = false,
  });

  final String titre;
  final String quartier;
  final String ville;
  final int prix;
  final int charges;
  final String type;
  final int chambres;
  final String disponibleLe;
  final double note;
  final int nombreAvis;
  final String auteur;
  final bool favori;

  int get coutTotal => prix + charges;
}

class ConversationDemo {
  const ConversationDemo({
    required this.interlocuteur,
    required this.annonce,
    required this.dernierMessage,
    required this.heure,
    required this.nonLus,
  });

  final String interlocuteur;
  final String annonce;
  final String dernierMessage;
  final String heure;
  final int nonLus;
}

class MessageDemo {
  const MessageDemo({
    required this.contenu,
    required this.heure,
    required this.deMoi,
  });

  final String contenu;
  final String heure;
  final bool deMoi;
}

class CandidatureDemo {
  const CandidatureDemo({
    required this.candidat,
    required this.annonce,
    required this.date,
    required this.statut,
    required this.exigencesAcceptees,
  });

  final String candidat;
  final String annonce;
  final String date;
  final String statut;
  final bool exigencesAcceptees;
}

class AvisDemo {
  const AvisDemo({
    required this.auteur,
    required this.role,
    required this.note,
    required this.date,
    required this.commentaire,
    this.reponse,
  });

  final String auteur;
  final String role;
  final double note;
  final String date;
  final String commentaire;
  final String? reponse;
}

abstract final class DonneesDemo {
  static const List<AnnonceDemo> annonces = <AnnonceDemo>[
    AnnonceDemo(
      titre: 'Chambre meublée dans appartement partagé',
      quartier: 'Sacré-Cœur 3',
      ville: 'Dakar',
      prix: 95000,
      charges: 15000,
      type: 'Appartement',
      chambres: 3,
      disponibleLe: '1er décembre',
      note: 4.6,
      nombreAvis: 12,
      auteur: 'Aïssatou D.',
      favori: true,
    ),
    AnnonceDemo(
      titre: 'Place libre en colocation étudiante',
      quartier: 'Point E',
      ville: 'Dakar',
      prix: 70000,
      charges: 10000,
      type: 'Appartement',
      chambres: 4,
      disponibleLe: '15 décembre',
      note: 4.2,
      nombreAvis: 7,
      auteur: 'Moussa F.',
    ),
    AnnonceDemo(
      titre: 'Studio partagé proche université',
      quartier: 'Mermoz',
      ville: 'Dakar',
      prix: 60000,
      charges: 8000,
      type: 'Studio',
      chambres: 2,
      disponibleLe: 'Immédiatement',
      note: 4.8,
      nombreAvis: 23,
      auteur: 'Fatou S.',
    ),
    AnnonceDemo(
      titre: 'Grande chambre dans villa calme',
      quartier: 'Ouakam',
      ville: 'Dakar',
      prix: 120000,
      charges: 20000,
      type: 'Villa',
      chambres: 5,
      disponibleLe: '1er janvier',
      note: 4.4,
      nombreAvis: 9,
      auteur: 'Ibrahima N.',
      favori: true,
    ),
  ];

  static const List<String> reglesDeVie = <String>[
    'Non-fumeur à l’intérieur du logement',
    'Pas de fête après 22h en semaine',
    'Ménage des parties communes à tour de rôle',
    'Visiteurs annoncés au moins 24h à l’avance',
    'Participation aux charges le 5 de chaque mois',
  ];

  static const List<ConversationDemo> conversations = <ConversationDemo>[
    ConversationDemo(
      interlocuteur: 'Aïssatou D.',
      annonce: 'Chambre meublée · Sacré-Cœur 3',
      dernierMessage: 'Bonjour, la chambre est toujours disponible ?',
      heure: '14:32',
      nonLus: 2,
    ),
    ConversationDemo(
      interlocuteur: 'Moussa F.',
      annonce: 'Place libre · Point E',
      dernierMessage: 'On peut faire la visite samedi matin.',
      heure: 'Hier',
      nonLus: 0,
    ),
    ConversationDemo(
      interlocuteur: 'Fatou S.',
      annonce: 'Studio partagé · Mermoz',
      dernierMessage: 'Merci pour votre candidature.',
      heure: 'Lun',
      nonLus: 0,
    ),
  ];

  static const List<MessageDemo> messages = <MessageDemo>[
    MessageDemo(
      contenu: 'Bonjour, la chambre est toujours disponible ?',
      heure: '14:20',
      deMoi: true,
    ),
    MessageDemo(
      contenu: 'Bonjour ! Oui, elle est libre à partir du 1er décembre.',
      heure: '14:25',
      deMoi: false,
    ),
    MessageDemo(
      contenu: 'Le prix de 95 000 FCFA inclut-il les charges ?',
      heure: '14:28',
      deMoi: true,
    ),
    MessageDemo(
      contenu: 'Non, comptez 15 000 FCFA de charges en plus (eau, électricité).',
      heure: '14:30',
      deMoi: false,
    ),
    MessageDemo(
      contenu: 'Parfait. Une visite serait possible ce week-end ?',
      heure: '14:32',
      deMoi: true,
    ),
  ];

  static const List<CandidatureDemo> candidatures = <CandidatureDemo>[
    CandidatureDemo(
      candidat: 'Awa Diallo',
      annonce: 'Chambre meublée · Sacré-Cœur 3',
      date: '12 novembre 2026',
      statut: 'En attente',
      exigencesAcceptees: true,
    ),
    CandidatureDemo(
      candidat: 'Cheikh Ba',
      annonce: 'Chambre meublée · Sacré-Cœur 3',
      date: '10 novembre 2026',
      statut: 'Acceptée',
      exigencesAcceptees: true,
    ),
    CandidatureDemo(
      candidat: 'Ndèye Fall',
      annonce: 'Place libre · Point E',
      date: '8 novembre 2026',
      statut: 'Refusée',
      exigencesAcceptees: false,
    ),
  ];

  static const List<AvisDemo> avis = <AvisDemo>[
    AvisDemo(
      auteur: 'Moussa F.',
      role: 'Ancien colocataire',
      note: 5,
      date: 'Octobre 2026',
      commentaire:
          'Colocataire très respectueux des règles communes, paiement toujours à '
          'l’heure. Je recommande sans hésiter.',
      reponse: 'Merci beaucoup Moussa, ce fut une très bonne colocation.',
    ),
    AvisDemo(
      auteur: 'Fatou S.',
      role: 'Propriétaire',
      note: 4,
      date: 'Août 2026',
      commentaire:
          'Logement conforme à l’annonce et bonne communication pendant toute '
          'la durée du séjour.',
    ),
  ];

  static const List<String> criteresEvaluation = <String>[
    'Respect des règles de vie',
    'Propreté',
    'Communication',
    'Ponctualité des paiements',
    'Convivialité',
  ];
}
