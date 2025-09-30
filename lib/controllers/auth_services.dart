import 'package:bodas/routes/linkspaper.dart';

final supabase = Supabase.instance.client;

class AuthService {
  final SupabaseClient _supabase = supabase;

  Future<(String?, UserModel?)> signIn(String email, String password) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user != null) {
        final userData = await _supabase
            .from('users')
            .select("*")
            .eq('id', response.user!.id)
            .single();

        final user = UserModel.fromJson(userData);
        return (response.session?.accessToken, user);
      }
      return (null, null);
    } catch (e) {
      throw Exception('Error signing in: $e');
    }
  }

  Future<UserModel?> signUp(
      String email, String password, String name, int role) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // Create user profile in users table with default role (2 for regular users)
        await _supabase.from('users').insert({
          'id': response.user!.id,
          'email': email,
          'nombre': name,
          'password': password,
          'rol_id': role, // Default role for regular users if not specified
          'created_at': DateTime.now().toIso8601String(),
          'updated_at': DateTime.now().toIso8601String(),
          'is_deleted': false,
        });

        final userData = await _supabase
            .from('users')
            .select()
            .eq('id', response.user!.id)
            .single();

        return UserModel.fromJson(userData);
      }
      return null;
    } catch (e) {
      throw Exception('Error signing up: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user');
    } catch (e) {
      throw Exception('Error signing out: $e');
    }
  }

  Future<UserModel?> getCurrentUser() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user != null) {
        final userData =
            await _supabase.from('users').select().eq('id', user.id).single();
        return UserModel.fromJson(userData);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<UserInfo?> getCurrentUserInfo() async {
    try {
      final user = _supabase.auth.currentUser;
      if (user != null) {
        final userData = await _supabase
            .from('user_info')
            .select()
            .eq('id', user.id)
            .single();
        return UserInfo.fromJson(userData);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<(String?, UserInfo?)> signInWithInfo(
      String email, String password) async {
    try {
      // Convert email to lowercase to prevent case sensitivity issues
      final lowercasedEmail = email.toLowerCase();

      final response = await _supabase.auth.signInWithPassword(
        email: lowercasedEmail,
        password: password,
      );

      if (response.user != null) {
        try {
          // Get user info from user_info view
          final userData = await _supabase
              .from('user_info')
              .select()
              .eq('id', response.user!.id)
              .single();

          // Log user_info data
          debugPrint('User Info Data: $userData');

          if (userData.isEmpty) {
            debugPrint('User info not found for user ID: ${response.user!.id}');
            throw Exception('User info not found');
          }

          // Get bodas from listar_boda view
          final bodasData = await _supabase
              .from('listar_boda')
              .select()
              .eq('user_id', response.user!.id)
              .eq('is_deleted', false);

          // Log listar_boda data
          debugPrint(
              'Listar Boda Data for user ID ${response.user!.id}: $bodasData');

          // Create UserInfo
          final userInfo = UserInfo(
            id: userData['id'] ?? '',
            nombre: userData['nombre'] ?? '',
            email: userData['email'] ?? '',
            rol: userData['user_rol'] ?? 'User',
          );

          return (response.session?.accessToken, userInfo);
        } on PostgrestException catch (e) {
          // Handle PostgrestException specifically if needed, e.g. logging
          debugPrint('Database error while fetching user data: ${e.message}');
          throw Exception(
              'Failed to retrieve user information from the database.');
        } catch (e) {
          // Catch any other errors during user data fetching
          debugPrint('Error fetching user data: $e');
          throw Exception(
              'An unexpected error occurred while fetching user data.');
        }
      }
      return (null, null); // User is null
    } on AuthException catch (e) {
      // Handle AuthException specifically
      debugPrint('Authentication error: ${e.message}');
      throw Exception(
          'Sign in failed. Please check your credentials and try again.');
    } catch (e) {
      // Catch any other errors during sign in
      debugPrint('Error signing in: $e');
      throw Exception('An unexpected error occurred during sign in.');
    }
  }

  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;
}

class AuthNotifier extends StateNotifier<AsyncValue<UserModel?>> {
  final AuthService _authService;
  final Ref ref;

  AuthNotifier(this.ref)
      : _authService = ref.read(authServiceProvider),
        super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final user = await _authService.getCurrentUser();
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final (token, user) = await _authService.signIn(email, password);
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user', user.toJson().toString());
        state = AsyncValue.data(user);
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signUp(
      String email, String password, String name, int role) async {
    state = const AsyncValue.loading();
    try {
      final user = await _authService.signUp(email, password, name, role);
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _authService.signOut();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

class AuthInfoNotifier extends StateNotifier<AsyncValue<UserInfo?>> {
  final AuthService _authService;
  final Ref ref;

  AuthInfoNotifier(this.ref)
      : _authService = ref.read(authServiceProvider),
        super(const AsyncValue.loading()) {
    _init();
  }

  Future<void> _init() async {
    try {
      final user = await _authService.getCurrentUserInfo();
      state = AsyncValue.data(user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    try {
      final (token, user) = await _authService.signInWithInfo(email, password);
      if (user != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_info', user.toJson().toString());
        state = AsyncValue.data(user);
      } else {
        state = const AsyncValue.data(null);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _authService.signOut();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
