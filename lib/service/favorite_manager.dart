import 'package:shared_preferences/shared_preferences.dart';

class FavoritesService {
  static const String favoritesKey = 'favorites';

  Future<void> addFavorite(String breed) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList(favoritesKey) ?? [];
    if (!favorites.contains(breed)) {
      favorites.add(breed);
    }
    await prefs.setStringList(favoritesKey, favorites);
  }

  Future<void> removeFavorite(String breed) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList(favoritesKey) ?? [];
    favorites.remove(breed);
    await prefs.setStringList(favoritesKey, favorites);
  }

  Future<List<String>> getFavorites() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(favoritesKey) ?? [];
  }

  Future<bool> isFavorite(String breed) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList(favoritesKey) ?? [];
    return favorites.contains(breed);
  }
}
