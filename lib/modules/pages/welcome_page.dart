import 'package:flutter/material.dart';
import 'package:sports_news_app/modules/pages/choose_sports_page.dart';
import 'dart:math' as math;

import 'package:sports_news_app/widget_tree.dart'; // We'll create this

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  static const Color primaryGreen = Color(0xFF43A047);
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color adminColor = Color(0xFF9C27B0); // Purple for admin

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _pulseController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
        );

    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF5F5F5), Color(0xFFE8F5E9), Colors.white],
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // For mobile only as requested
              return _buildMobileLayout();
            },
          ),
        ),
      ),
    );
  }

  // ==================== MOBILE LAYOUT ====================
  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildMobileNavBar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    SizedBox(height: 220, child: _buildIllustrationSection()),
                    const SizedBox(height: 32),
                    _buildHeadline(fontSize: 32, centered: true),
                    const SizedBox(height: 16),
                    _buildSubtitle(fontSize: 16, centered: true),
                    const SizedBox(height: 32),
                    _buildActionButtons(fullWidth: true),
                    const SizedBox(height: 24),
                    _buildAdminLoginOption(),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          _buildFooter(isDesktop: false),
        ],
      ),
    );
  }

  Widget _buildMobileNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: primaryGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.sports_soccer,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                'SportsFeed',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: darkGreen,
                ),
              ),
            ],
          ),
          // Admin login icon in navbar (small)
          IconButton(
            onPressed: () {
              _showAdminLoginDialog(context);
            },
            icon: Icon(
              Icons.admin_panel_settings,
              color: adminColor,
              size: 24,
            ),
            tooltip: 'Admin Login',
          ),
        ],
      ),
    );
  }

  // ==================== HEADLINE & SUBTITLE ====================
  Widget _buildHeadline({required double fontSize, bool centered = false}) {
    return Text(
      'Your Personalized\nSports News Hub',
      textAlign: centered ? TextAlign.center : TextAlign.left,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: const Color(0xFF1A1A1A),
      ),
    );
  }

  Widget _buildSubtitle({required double fontSize, bool centered = false}) {
    return Text(
      'Stay updated with the latest news, scores, and highlights from your favorite sports, leagues, teams, and players - all in one place.',
      textAlign: centered ? TextAlign.center : TextAlign.left,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.grey[600],
        height: 1.6,
      ),
    );
  }

  // ==================== ACTION BUTTONS ====================
  Widget _buildActionButtons({
    bool fullWidth = false,
  }) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 16,
      runSpacing: 16,
      children: [
        SizedBox(
          width: fullWidth ? double.infinity : null,
          child: AnimatedBuilder(
            animation: _pulseAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _pulseAnimation.value,
                child: child,
              );
            },
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const WidgetTree()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8,
                shadowColor: primaryGreen.withOpacity(0.4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: fullWidth ? double.infinity : null,
          child: OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChooseSportsPage()),
              );
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: primaryGreen,
              side: const BorderSide(color: primaryGreen, width: 2),
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ==================== ADMIN LOGIN OPTION ====================
  Widget _buildAdminLoginOption() {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 16),
        Text(
          'Administrator Access',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              _showAdminLoginDialog(context);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: adminColor,
              side: BorderSide(color: adminColor, width: 1.5),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            icon: const Icon(Icons.admin_panel_settings, size: 20),
            label: const Text(
              'Admin / Super Admin Login',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAdminLoginDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AdminLoginDialog(
          onLogin: (role) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminDashboardPage(
                  userRole: role,
                  assignedSport: role == 'admin' ? 'Football' : null,
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ==================== ILLUSTRATION SECTION ====================
  Widget _buildIllustrationSection() {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background circles
          ...List.generate(3, (index) {
            return AnimatedBuilder(
              animation: _pulseController,
              builder: (context, child) {
                final scale =
                    1.0 + (index * 0.15) + (_pulseAnimation.value - 1);
                return Transform.scale(
                  scale: scale,
                  child: Container(
                    width: 200 + (index * 80),
                    height: 200 + (index * 80),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: primaryGreen.withOpacity(0.1 - (index * 0.03)),
                        width: 2,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
          // Sports icons arranged in a circle
          _buildFloatingSportsIcons(),
          // Center logo
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [primaryGreen, darkGreen],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: primaryGreen.withOpacity(0.4),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(Icons.sports, color: Colors.white, size: 60),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingSportsIcons() {
    final sports = [
      {'icon': Icons.sports_soccer, 'angle': 0.0},
      {'icon': Icons.sports_basketball, 'angle': math.pi / 2},
      {'icon': Icons.sports_tennis, 'angle': math.pi},
      {'icon': Icons.sports_volleyball, 'angle': 3 * math.pi / 2},
    ];

    return AnimatedBuilder(
      animation: _pulseController,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: sports.map((sport) {
            final angle = sport['angle'] as double;
            final radius = 130.0;
            final x = math.cos(angle) * radius;
            final y = math.sin(angle) * radius;
            final bounce = math.sin(_pulseController.value * math.pi) * 5;

            return Transform.translate(
              offset: Offset(x, y + bounce),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryGreen.withOpacity(0.2),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  sport['icon'] as IconData,
                  color: primaryGreen,
                  size: 32,
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  // ==================== FOOTER ====================
  Widget _buildFooter({required bool isDesktop}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.facebook),
              _buildSocialIcon(Icons.telegram),
              _buildSocialIcon(Icons.email_outlined),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            '© 2024 SportsFeed. All rights reserved.',
            style: TextStyle(color: Colors.grey[600], fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, color: primaryGreen),
      ),
    );
  }
}

// ==================== ADMIN LOGIN DIALOG ====================
class AdminLoginDialog extends StatefulWidget {
  final Function(String role) onLogin;

  const AdminLoginDialog({super.key, required this.onLogin});

  @override
  State<AdminLoginDialog> createState() => _AdminLoginDialogState();
}

class _AdminLoginDialogState extends State<AdminLoginDialog> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'admin';
  String? _selectedSport;
  final List<String> _sports = ['Football', 'Basketball', 'Tennis', 'Volleyball'];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF9C27B0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.admin_panel_settings,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Admin Login',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'admin@example.com',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '••••••••',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Role',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 12,
                children: [
                  _buildRoleChip('admin', Icons.admin_panel_settings),
                  _buildRoleChip('super_admin', Icons.supervisor_account),
                ],
              ),
              if (_selectedRole == 'admin') ...[
                const SizedBox(height: 20),
                const Text(
                  'Assigned Sport',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _selectedSport,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                  items: _sports
                      .map((sport) => DropdownMenuItem(
                            value: sport,
                            child: Text(sport),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedSport = value;
                    });
                  },
                  hint: const Text('Select sport'),
                ),
              ],
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // For demo purposes, just login with any credentials
                    widget.onLogin(_selectedRole);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF9C27B0),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoleChip(String role, IconData icon) {
    final isSelected = _selectedRole == role;
    final color = const Color(0xFF9C27B0);

    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: isSelected ? Colors.white : color),
          const SizedBox(width: 6),
          Text(
            role == 'admin' ? 'Admin' : 'Super Admin',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[800],
              fontSize: 13,
            ),
          ),
        ],
      ),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedRole = role;
          if (role == 'super_admin') {
            _selectedSport = null;
          }
        });
      },
      selectedColor: color,
      backgroundColor: Colors.grey[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(
          color: isSelected ? color : Colors.grey[300]!,
        ),
      ),
    );
  }
}

// ==================== ADMIN DASHBOARD PAGE ====================
class AdminDashboardPage extends StatefulWidget {
  final String userRole;
  final String? assignedSport;

  const AdminDashboardPage({
    super.key,
    required this.userRole,
    this.assignedSport,
  });

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int _selectedTab = 0;
  final Color _adminColor = const Color(0xFF9C27B0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: _adminColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.admin_panel_settings,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Admin Dashboard',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.userRole == 'super_admin'
                      ? 'Super Admin'
                      : 'Admin - ${widget.assignedSport ?? "No sport assigned"}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: _buildTabContent(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        selectedItemColor: _adminColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'Posts',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.sports),
            label: 'Sports',
          ),
          if (widget.userRole == 'super_admin')
            const BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Admins',
            ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    switch (_selectedTab) {
      case 0:
        return _buildDashboardTab();
      case 1:
        return _buildPostsTab();
      case 2:
        return _buildSportsTab();
      case 3:
        return _buildAdminsTab();
      default:
        return _buildDashboardTab();
    }
  }

  Widget _buildDashboardTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome, ${widget.userRole == 'super_admin' ? 'Super Admin' : 'Admin'}',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            widget.userRole == 'super_admin'
                ? 'You have full access to manage everything'
                : 'You can manage posts for ${widget.assignedSport}',
            style: TextStyle(color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          // Stats Cards
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Total Posts',
                  '127',
                  Icons.newspaper,
                  Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Active Users',
                  '2,458',
                  Icons.people,
                  Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildStatCard(
                  'Today\'s Posts',
                  '12',
                  Icons.today,
                  Colors.orange,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildStatCard(
                  'Likes',
                  '3,847',
                  Icons.thumb_up,
                  Colors.pink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Quick Actions
          const Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          _buildQuickActionButton(
            'Create New Post',
            Icons.add_circle,
            () {},
          ),
          _buildQuickActionButton(
            'Manage Sports',
            Icons.sports,
            () {},
          ),
          if (widget.userRole == 'super_admin')
            _buildQuickActionButton(
              'Add New Admin',
              Icons.person_add,
              () {},
            ),
        ],
      ),
    );
  }
Widget _buildPostsTab() {
  final mockPosts = [
    {
      'id': '1',
      'title': 'Football Championship Final',
      'sport': 'Football',
      'time': '2 hours ago',
      'likes': 245,
      'author': 'Admin John',
    },
    {
      'id': '2',
      'title': 'Basketball League Updates',
      'sport': 'Basketball',
      'time': '5 hours ago',
      'likes': 189,
      'author': 'Admin Mike',
    },
    {
      'id': '3',
      'title': 'Tennis Tournament Results',
      'sport': 'Tennis',
      'time': '1 day ago',
      'likes': 312,
      'author': 'Super Admin',
    },
    {
      'id': '4',
      'title': 'Volleyball Match Highlights',
      'sport': 'Volleyball',
      'time': '2 days ago',
      'likes': 156,
      'author': 'Admin Sarah',
    },
  ];

  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: mockPosts.length,
    itemBuilder: (context, index) {
      final post = mockPosts[index];
      final postSport = post['sport'] as String;
      final postTitle = post['title'] as String;
      final postTime = post['time'] as String;
      final postLikes = post['likes'] as int;
      final postAuthor = post['author'] as String;
      
      final canEdit = widget.userRole == 'super_admin' ||
          (widget.userRole == 'admin' &&
              widget.assignedSport == postSport);

      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _getSportColor(postSport).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              _getSportIcon(postSport),
              color: _getSportColor(postSport),
            ),
          ),
          title: Text(
            postTitle,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(
                '$postSport • $postTime',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.thumb_up, size: 14, color: Colors.grey[500]),
                  const SizedBox(width: 4),
                  Text(
                    '$postLikes likes',
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                  const SizedBox(width: 12),
                  Icon(Icons.person, size: 14, color: Colors.grey[500]),
                  const SizedBox(width: 4),
                  Text(
                    postAuthor,
                    style: TextStyle(color: Colors.grey[600], fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          trailing: canEdit
              ? PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    const PopupMenuItem(
                      value: 'delete',
                      child: Text('Delete'),
                    ),
                  ],
                )
              : null,
        ),
      );
    },
  );
}
Widget _buildSportsTab() {
  final mockSports = [
    {'name': 'Football', 'posts': 45, 'leagues': 12, 'icon': Icons.sports_soccer},
    {'name': 'Basketball', 'posts': 32, 'leagues': 8, 'icon': Icons.sports_basketball},
    {'name': 'Tennis', 'posts': 28, 'leagues': 6, 'icon': Icons.sports_tennis},
    {'name': 'Volleyball', 'posts': 22, 'leagues': 5, 'icon': Icons.sports_volleyball},
  ];

  return ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: mockSports.length,
    itemBuilder: (context, index) {
      final sport = mockSports[index];
      final sportName = sport['name'] as String;
      final sportIcon = sport['icon'] as IconData;
      final posts = sport['posts'] as int;
      final leagues = sport['leagues'] as int;
      
      return Card(
        margin: const EdgeInsets.only(bottom: 12),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _getSportColor(sportName).withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              sportIcon,
              color: _getSportColor(sportName),
            ),
          ),
          title: Text(
            sportName,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Row(
            children: [
              _buildSportStat('Posts', posts),
              const SizedBox(width: 16),
              _buildSportStat('Leagues', leagues),
            ],
          ),
          trailing: widget.userRole == 'super_admin'
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit),
                )
              : null,
        ),
      );
    },
  );
}

  Widget _buildAdminsTab() {
    final mockAdmins = [
      {
        'name': 'John Doe',
        'email': 'john@admin.com',
        'role': 'admin',
        'sport': 'Football',
        'status': 'Active',
      },
      {
        'name': 'Sarah Smith',
        'email': 'sarah@admin.com',
        'role': 'admin',
        'sport': 'Basketball',
        'status': 'Active',
      },
      {
        'name': 'Mike Johnson',
        'email': 'mike@admin.com',
        'role': 'admin',
        'sport': 'Tennis',
        'status': 'Inactive',
      },
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: _adminColor,
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 50),
            ),
            icon: const Icon(Icons.person_add),
            label: const Text('Add New Admin'),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: mockAdmins.length,
            itemBuilder: (context, index) {
              final admin = mockAdmins[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: CircleAvatar(
                    backgroundColor: _adminColor.withOpacity(0.1),
                    child: Icon(
                      Icons.person,
                      color: _adminColor,
                    ),
                  ),
                  title: Text(
                    admin['name']!,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(admin['email']!),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: _getSportColor(admin['sport']!)
                                  .withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              admin['sport']!,
                              style: TextStyle(
                                color: _getSportColor(admin['sport']!),
                                fontSize: 12,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: admin['status'] == 'Active'
                                  ? Colors.green.withOpacity(0.1)
                                  : Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              admin['status']!,
                              style: TextStyle(
                                color: admin['status'] == 'Active'
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem(
                        value: 'deactivate',
                        child: Text('Deactivate'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                const Spacer(),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(String title, IconData icon, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: _adminColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: _adminColor),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );
  }

  Widget _buildSportStat(String label, dynamic value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey[600], fontSize: 12),
        ),
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Color _getSportColor(String sport) {
    switch (sport.toLowerCase()) {
      case 'football':
        return const Color(0xFF43A047);
      case 'basketball':
        return Colors.orange[700]!;
      case 'tennis':
        return Colors.yellow[800]!;
      case 'volleyball':
        return Colors.blue[700]!;
      default:
        return Colors.grey;
    }
  }

  IconData _getSportIcon(String sport) {
    switch (sport.toLowerCase()) {
      case 'football':
        return Icons.sports_soccer;
      case 'basketball':
        return Icons.sports_basketball;
      case 'tennis':
        return Icons.sports_tennis;
      case 'volleyball':
        return Icons.sports_volleyball;
      default:
        return Icons.sports;
    }
  }
}