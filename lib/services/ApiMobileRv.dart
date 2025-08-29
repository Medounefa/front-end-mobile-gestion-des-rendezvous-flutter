import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiMobileRv {
  static const String baseUrl = 'http://192.168.1.10:8000';

  static String? _token;

  static Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      if (_token != null) 'Authorization': 'Bearer $_token',
    };
  }

  // Authentification
  static Future<Map<String, dynamic>?> login(
      String email, String password) async {
    final url = Uri.parse("$baseUrl/login/");
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"username": email, "password": password}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('jwt_token', data['access']);
        return jsonDecode(response.body);
      } else {
        print("Erreur de login: ${response.statusCode}");
        print("Réponse: ${response.body}");
        return null;
      }
    } catch (e) {
      print("Exception lors du login: $e");
      return null;
    }
  }

  static Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt_token');
  }

  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt_token');
  }

  // static Future<http.Response?> getUserProfile() async {
  //   final token = await getToken();
  //   if (token == null) return null;

  //   final url = Uri.parse('$baseUrl/user/profile/');
  //   return await http.get(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //   );
  // }
  static Future<Map<String, dynamic>?> getUserProfile() async {
    final token = await _getToken();
    if (token == null) return null;

    final url = Uri.parse('$baseUrl/user/profile/');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print("Erreur lors du chargement du profil: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception dans getUserProfile: $e");
      return null;
    }
  }

  //register
  static Future<Map<String, dynamic>?> register(
      Map<String, dynamic> userData) async {
    final url = Uri.parse('$baseUrl/register/');

    try {
      final response = await http.post(
        url,
        headers: _headers(),
        body: jsonEncode(userData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        print('Erreur d\'inscription: ${response.statusCode}');
        print('Réponse: ${response.body}');
        return null;
      }
    } catch (e) {
      print('Exception lors de l\'inscription: $e');
      return null;
    }
  }

  //creer un utilisateur
  static Future<http.Response?> createUser({
    required String username,
    required String prenom,
    required String nom,
    required String email,
    required String password,
    required String adresse,
    required String numero,
    required String specialite,
    required String role, // admin, secretaire, medecin, patient
  }) async {
    final token = await _getToken();
    if (token == null) return null;

    final url = Uri.parse('$baseUrl/users/create/');
    final body = jsonEncode({
      'username': username,
      'prenom': prenom,
      'nom': nom,
      'email': email,
      'password': password,
      'adresse': adresse,
      'numero': numero,
      'specialite': specialite,
      'role': role,
    });

    return await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: body,
    );
  }

  // Récupérer tous les utilisateurs
  static Future<List<dynamic>> getUsers() async {
    final token = await _getToken();
    if (token == null) return [];

    final url = Uri.parse('$baseUrl/users/');
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Erreur getUsers: ${response.statusCode}");
      return [];
    }
  }

  // Récupérer tous les médecins
  static Future<List<Map<String, dynamic>>> getMedecins(String token) async {
    final url = Uri.parse('$baseUrl/medecins/');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // 🔑 Vérifie bien ce header
      },
    );

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception("Erreur chargement médecins: ${response.body}");
    }
  }

  // Récupérer tous les patients (pour secrétaire)
  static Future<List<dynamic>> getPatients(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/patients/'),
      headers: await _headers(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Erreur getPatients: ${response.body}");
      return [];
    }
  }

  //supprimer et modifier
  static Future<bool> deleteUser(int userId) async {
    final token = await _getToken();
    if (token == null) return false;

    final url = Uri.parse('$baseUrl/users/$userId/');
    final response = await http.delete(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );
    return response.statusCode == 204; // 204 = suppression réussie
  }

  // 📌 Mettre à jour un utilisateur
  static Future<bool> updateUser({
    required int id,
    required String username,
    required String prenom,
    required String nom,
    required String email,
    required String password,
    required String adresse,
    required String numero,
    required String specialite,
    required String role,
  }) async {
    final token = await _getToken();
    if (token == null) return false;

    final url = Uri.parse('$baseUrl/users/$id/');
    final body = jsonEncode({
      'username': username,
      'prenom': prenom,
      'nom': nom,
      'email': email,
      'password': password,
      'adresse': adresse,
      'numero': numero,
      'specialite': specialite,
      'role': role,
    });

    final response = await http.put(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: body,
    );

    return response.statusCode == 200; // 200 = modification réussie
  }

  //departement et hopitaux
  static Future<bool> ajouterDepartement(String nom) async {
    final url = Uri.parse('$baseUrl/departements/');
    final token = await _getToken();

    print("Token envoyé: $token");

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // ⚠️ IMPORTANT
      },
      body: jsonEncode({
        "nom": nom,
      }),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print("Département ajouté: ${response.body}");
      return true;
    } else {
      print(
          "Erreur ajout département: ${response.statusCode} - ${response.body}");
      return false;
    }
  }

  // 📌 Récupérer la liste des départements
  // static Future<List<dynamic>> getDepartements() async {
  //   final url = Uri.parse('$baseUrl/departements/');
  //   final response = await http.get(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $_token',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     print(
  //         "Erreur récupération départements: ${response.statusCode} - ${response.body}");
  //     return [];
  //   }
  // }

  // // 📌 Créer un hôpital
  // static Future<bool> createHopital(
  //     String nom, String adresse, int departementId) async {
  //   final response = await http.post(
  //     Uri.parse("$baseUrl/hopitaux/"),
  //     headers: _headers(),
  //     body: jsonEncode({
  //       "nom": nom,
  //       "adresse": adresse,
  //       "departement": departementId,
  //     }),
  //   );
  //   return response.statusCode == 201;
  // }

  static Future<List<dynamic>> getDepartements() async {
    final token = await _getToken();
    if (token == null) throw Exception("Token non trouvé");
    final response = await http.get(
      Uri.parse("$baseUrl/departements/"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Erreur getDepartements: ${response.statusCode}");
      return [];
    }
  }

  static Future<bool> modifierDepartement(int id, String nom) async {
    final token = await _getToken();
    final response = await http.put(
      Uri.parse("$baseUrl/departements/$id/"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"nom": nom}),
    );

    return response.statusCode == 200; // 200 OK
  }

  // 👉 Supprimer un département
  static Future<bool> supprimerDepartement(int id) async {
    final token = await _getToken();
    final response = await http.delete(
      Uri.parse("$baseUrl/departements/$id/"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    return response.statusCode == 204; // 204 No Content
  }

  // static Future<List<dynamic>> getDepartements(String token) async {
  //   final token = await _getToken();
  //   final response = await http.get(
  //     Uri.parse("$baseUrl/departements/"),
  //     headers: {
  //       "Authorization": "Bearer $token",
  //       "Content-Type": "application/json",
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     return jsonDecode(response.body);
  //   } else {
  //     print("Erreur getDepartements: ${response.statusCode}");
  //     return [];
  //   }
  // }

  static Future<bool> createHopital(
      String nom, String adresse, int departementId) async {
    final token = await _getToken();
    final response = await http.post(
      Uri.parse("$baseUrl/hopitaux/"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "nom": nom,
        "adresse": adresse,
        "departement": departementId,
      }),
    );

    return response.statusCode == 201;
  }

  // 📌 Récupérer la liste des hôpitaux
  static Future<List<dynamic>> getHopitaux() async {
    final token = await _getToken(); // récupère le token stocké
    if (token == null) throw Exception("Token non trouvé");

    final response = await http.get(
      Uri.parse("$baseUrl/hopitaux/"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("Erreur récupération hôpitaux: ${response.statusCode}");
      return [];
    }
  }

  static Future<bool> updateHopital(
      int id, String nom, String adresse, int departementId) async {
    final token = await _getToken();
    final response = await http.put(
      Uri.parse("$baseUrl/hopitaux/$id/"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "nom": nom,
        "adresse": adresse,
        "departement": departementId,
      }),
    );
    return response.statusCode == 200;
  }

  // Supprimer un hôpital
  static Future<bool> deleteHopital(int id) async {
    final token = await _getToken();
    final response = await http.delete(
      Uri.parse("$baseUrl/hopitaux/$id/"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
    );
    return response.statusCode == 204;
  }

  static Future<bool> priseDeRendezVous(
      String token, Map<String, dynamic> appointmentData) async {
    final url = Uri.parse('$baseUrl/rendezvous/create/');

    print("Token envoyé à l'API bbb: '$token'");
    print("Longueur token: ${token.length}");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // <- ici le token bien formaté
      },
      body: jsonEncode(appointmentData),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      print("Rendez-vous créé: ${response.body}");
      return true;
    } else {
      print(
          "Erreur création rendez-vous: ${response.statusCode} - ${response.body}");
      return false;
    }
  }

  static Future<List<dynamic>> getRendezVous(String token, String role) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('user_id'); // récupère l'ID de l'utilisateur

    if (userId == null) {
      print("Erreur : user_id non trouvé dans SharedPreferences");
      return [];
    }

    final response = await http.get(
      Uri.parse('$baseUrl/rendezvous/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List allRdv = jsonDecode(response.body);

      // Filtrage selon le rôle
      if (role == 'patient') {
        allRdv = allRdv.where((r) => r['patient_id'] == userId).toList();
      } else if (role == 'medecin') {
        allRdv = allRdv.where((r) => r['medecin_id'] == userId).toList();
      } // Secrétaire et Admin voient tout

      return allRdv;
    } else {
      print("Erreur API rendez-vous : ${response.statusCode}");
      return [];
    }
  }

  /// Annuler un rendez-vous
  static Future<bool> annulerRendezVous(String token, int rdvId) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/rendezvous/$rdvId/'),
      headers: await _headers(),
      body: jsonEncode({'statut': 'annulé'}),
    );

    return response.statusCode == 200;
  }

  /// Supprimer un rendez-vous
  static Future<bool> supprimerRendezVous(String token, int rdvId) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/rendezvous/$rdvId/'),
      headers: await _headers(),
    );
    return response.statusCode == 204;
  }

  /// Modifier un rendez-vous
  static Future<bool> modifierRendezVous(String token, int rdvId, String date,
      String heure, String description) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/rendezvous/$rdvId/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // <-- très important
      }, // <- token ici
      body: jsonEncode({
        'date': date,
        'heure': heure,
        'description': description,
      }),
    );

    print("Modifier RDV status: ${response.statusCode}");
    print("Modifier RDV body: ${response.body}");

    return response.statusCode == 200;
  }

  Future<List<Map<String, dynamic>>?> fetchUsersByRole(
      String token, String role) async {
    final url = Uri.parse('$baseUrl/users/?role=$role');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final List<dynamic> users = jsonDecode(response.body);
      return users.cast<Map<String, dynamic>>();
    } else {
      print('Erreur récupération $role: ${response.statusCode}');
      return null;
    }
  }

  //rv mediical
  // Future<bool> priseDeRendezVous(
  //     String token, Map<String, dynamic> appointmentData) async {
  //   final url = Uri.parse(
  //       '$baseUrl/rendezvous/create/'); // correspond à ton path Django
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token', // <-- important
  //     },
  //     body: jsonEncode(appointmentData),
  //   );

  //   if (response.statusCode == 201 || response.statusCode == 200) {
  //     return true;
  //   } else {
  //     print(
  //         "Erreur création rendez-vous: ${response.statusCode} - ${response.body}");
  //     return false;
  //   }
  // }

  // Future<bool> priseDeRendezVous(
  //     String token, Map<String, dynamic> appointmentData) async {
  //   try {
  //     final url = Uri.parse('$baseUrl/rendezvous/create/');
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Authorization': 'Bearer $token',
  //         'Content-Type': 'application/json',
  //       },
  //       body: jsonEncode(appointmentData),
  //     );

  //     if (response.statusCode == 201) {
  //       print("Rendez-vous créé: ${response.body}");
  //       return true;
  //     } else {
  //       print(
  //           "Erreur création rendez-vous: ${response.statusCode} - ${response.body}");
  //       return false;
  //     }
  //   } catch (e, stack) {
  //     print("Exception lors de la création du rendez-vous: $e");
  //     print(stack);
  //     return false;
  //   }
  // }

  // static Future<bool> createUser(
  //     Map<String, dynamic> userData, String token) async {
  //   final url = Uri.parse('$baseUrl/create-user/');
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token',
  //     },
  //     body: jsonEncode(userData),
  //   );

  //   if (response.statusCode == 201) {
  //     return true; // succès
  //   } else {
  //     print("Erreur création user : ${response.statusCode} ${response.body}");
  //     return false;
  //   }
  // }

  //Liste des utilisateurs

  // GET generic
  static Future<List<dynamic>> fetchList(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint/');
    final response = await http.get(url, headers: _headers());
    return jsonDecode(response.body);
  }

  // POST generic
  static Future<http.Response> create(
      String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/$endpoint/');
    return await http.post(url, headers: _headers(), body: jsonEncode(data));
  }

  // PUT generic
  static Future<http.Response> update(
      String endpoint, int id, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/$endpoint/$id/');
    return await http.put(url, headers: _headers(), body: jsonEncode(data));
  }

  // DELETE generic
  static Future<http.Response> delete(String endpoint, int id) async {
    final url = Uri.parse('$baseUrl/$endpoint/$id/');
    return await http.delete(url, headers: _headers());
  }

  // Fonctions spécifiques (exemples)
  static Future<http.Response> createRendezVous(
      Map<String, dynamic> data) async {
    return await create('rendezvous', data);
  }

  static Future<http.Response> assignerMedecinSecretaire(
      Map<String, dynamic> data) async {
    return await create('assignations', data);
  }

  // static Future<http.Response> ajouterDepartement(
  //     Map<String, dynamic> data) async {
  //   return await create('departements', data);
  // }

  static Future<http.Response> ajouterHopital(Map<String, dynamic> data) async {
    return await create('hopitaux', data);
  }

  // static Future<http.Response> ajouterDisponibilite(
  //     Map<String, dynamic> data) async {
  //   return await create('disponibilites', data);
  // }

  static Future<http.Response> envoyerNotification(
      Map<String, dynamic> data) async {
    return await create('notifications', data);
  }

  static Future<http.Response> ajouterRole(Map<String, dynamic> data) async {
    return await create('roles', data); // si tu as un endpoint pour ça
  }

  static Future<bool> ajouterRapport(
    String s, {
    required String token,
    required String typeRapport,
    required String dateDebut,
    required String dateFin,
    required String description,
    required int creePar,
    int? departementId,
    int? hopitalId,
  }) async {
    final url = Uri.parse("$baseUrl/rapports-admin/");

    Map<String, dynamic> data = {
      "type_rapport": typeRapport,
      "date_debut": dateDebut,
      "date_fin": dateFin,
      "description": description,
      "cree_par": creePar,
    };

    if (departementId != null) {
      data["departement"] = departementId;
    }
    if (hopitalId != null) {
      data["hopital"] = hopitalId;
    }

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        // Création réussie
        return true;
      } else {
        print("Erreur API ajouterRapport: ${response.statusCode}");
        print("Response body: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Exception API ajouterRapport: $e");
      return false;
    }
  }

//   static Future<void> ajouterDisponibilite(
//       String token, String jour, String heureDebut, String heureFin) async {
//     final url = Uri.parse('$baseUrl/disponibilites/');
//     final response = await http.post(
//       url,
//       headers: {
//         'Authorization': 'Bearer $token',
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         "jour": jour,
//         "heure_debut": heureDebut,
//         "heure_fin": heureFin,
//       }),
//     );

//     if (response.statusCode != 201) {
//       throw Exception('Erreur ajout disponibilité: ${response.body}');
//     }
//   }
// }

  Future<dynamic> addDisponibilite({
    required String token,
    required String date,
    required String heureDebut,
    required String heureFin,
  }) async {
    final url = Uri.parse('$baseUrl/disponibilites/');

    final response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
      body: jsonEncode({
        "date": date,
        "heure_debut": heureDebut,
        "heure_fin": heureFin,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body); // ✅ on retourne la réponse
    } else {
      throw Exception("Erreur ${response.statusCode}: ${response.body}");
    }
  }
}
