import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/Model/List_model.dart';

class DatalistProvider extends ChangeNotifier {
  List<ListModel> _items = [];
  bool _isLoading = false;
  String _error = '';

  List<ListModel> get items => _items;
  bool get isLoading => _isLoading;
  String get error => _error;

  void setItems(List<ListModel> newItems) {
    _items = newItems;
    notifyListeners();
  }

  void addItem(ListModel item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void updateItem(int index, ListModel updatedItem) {
    if (index >= 0 && index < _items.length) {
      _items[index] = updatedItem;
      notifyListeners();
    }
  }

  ListModel? getItemById(int id) {
    try {
      return _items.firstWhere((item) => item.id == id);
    } catch (e) {
      return null;
    }
  }

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void setError(String errorMessage) {
    _error = errorMessage;
    notifyListeners();
  }

  void clearError() {
    _error = '';
    notifyListeners();
  }
}