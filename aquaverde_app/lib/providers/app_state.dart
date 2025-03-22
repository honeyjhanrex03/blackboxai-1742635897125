import 'package:flutter/material.dart';
import 'package:shared_preferences.dart';

class AppState with ChangeNotifier {
  final SharedPreferences _prefs;
  bool _isAuthenticated = false;
  String? _userEmail;
  String? _userName;
  List<Map<String, dynamic>> _devices = [];
  bool _isDarkMode = false;

  AppState(this._prefs) {
    _loadInitialData();
  }

  // Getters
  bool get isAuthenticated => _isAuthenticated;
  String? get userEmail => _userEmail;
  String? get userName => _userName;
  List<Map<String, dynamic>> get devices => _devices;
  bool get isDarkMode => _isDarkMode;

  // Load initial data from SharedPreferences
  void _loadInitialData() {
    _isAuthenticated = _prefs.getBool('isAuthenticated') ?? false;
    _userEmail = _prefs.getString('userEmail');
    _userName = _prefs.getString('userName');
    _isDarkMode = _prefs.getBool('isDarkMode') ?? false;
    _loadDevices();
    notifyListeners();
  }

  // Load devices from SharedPreferences
  void _loadDevices() {
    final devicesJson = _prefs.getString('devices');
    if (devicesJson != null) {
      _devices = List<Map<String, dynamic>>.from(
        (devicesJson as List).map((device) => Map<String, dynamic>.from(device)),
      );
    }
  }

  // Authentication methods
  Future<void> login(String email, String password) async {
    // TODO: Implement actual login logic
    _isAuthenticated = true;
    _userEmail = email;
    await _prefs.setBool('isAuthenticated', true);
    await _prefs.setString('userEmail', email);
    notifyListeners();
  }

  Future<void> signup(String name, String email, String password) async {
    // TODO: Implement actual signup logic
    _isAuthenticated = true;
    _userEmail = email;
    _userName = name;
    await _prefs.setBool('isAuthenticated', true);
    await _prefs.setString('userEmail', email);
    await _prefs.setString('userName', name);
    notifyListeners();
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _userEmail = null;
    _userName = null;
    await _prefs.clear();
    notifyListeners();
  }

  // Device management methods
  Future<void> addDevice(Map<String, dynamic> device) async {
    _devices.add(device);
    await _saveDevices();
    notifyListeners();
  }

  Future<void> updateDevice(int index, Map<String, dynamic> device) async {
    if (index >= 0 && index < _devices.length) {
      _devices[index] = device;
      await _saveDevices();
      notifyListeners();
    }
  }

  Future<void> removeDevice(int index) async {
    if (index >= 0 && index < _devices.length) {
      _devices.removeAt(index);
      await _saveDevices();
      notifyListeners();
    }
  }

  Future<void> _saveDevices() async {
    await _prefs.setString('devices', _devices.toString());
  }

  // Theme management
  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _prefs.setBool('isDarkMode', _isDarkMode);
    notifyListeners();
  }

  // Mock data for testing
  void addMockDevices() {
    _devices = [
      {
        'id': '1',
        'name': 'BLOOP 1',
        'fishName': 'Goldfish Tank',
        'status': 'online',
        'isEmpty': false,
        'schedules': [
          {
            'time': '7:00',
            'period': 'am',
            'days': ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
            'isActive': true,
          },
          {
            'time': '12:00',
            'period': 'pm',
            'days': ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
            'isActive': false,
          },
        ],
      },
      {
        'id': '2',
        'name': 'BLOOP 2',
        'fishName': 'Koi Pond',
        'status': 'offline',
        'isEmpty': true,
        'schedules': [
          {
            'time': '8:00',
            'period': 'am',
            'days': ['M', 'W', 'F'],
            'isActive': true,
          },
        ],
      },
    ];
    _saveDevices();
    notifyListeners();
  }
}