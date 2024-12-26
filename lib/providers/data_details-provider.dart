import 'package:flutter/material.dart';
import 'package:flutter_coding_challenge/Model/List_model.dart';

class DataDetailsProvider extends ChangeNotifier {
  ListModel? _selectedItem;
  bool _isLoading = false;
  String _error = '';

  ListModel? get selectedItem => _selectedItem;
  bool get isLoading => _isLoading;
  String get error => _error;

  void setSelectedItem(ListModel? item) {
    _selectedItem = item;
    notifyListeners();
  }

  void updateSelectedItem({
    int? id,
    String? title,
    String? description,
    String? companyName,
    String? applyUrl,
    String? deadline,
    String? createDate,
    int? salary,
  }) {
    if (_selectedItem != null) {
      _selectedItem = ListModel(
        id: id ?? _selectedItem!.id,
        title: title ?? _selectedItem!.title,
        description: description ?? _selectedItem!.description,
        companyName: companyName ?? _selectedItem!.companyName,
        applyUrl: applyUrl ?? _selectedItem!.applyUrl,
        deadline: deadline ?? _selectedItem!.deadline,
        createDate: createDate ?? _selectedItem!.createDate,
        salary: salary ?? _selectedItem!.salary,
      );
      notifyListeners();
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

  void clearSelectedItem() {
    _selectedItem = null;
    notifyListeners();
  }
}