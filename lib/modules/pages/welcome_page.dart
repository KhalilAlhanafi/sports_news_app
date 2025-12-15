import 'package:flutter/material.dart';
import 'package:sports_news_app/modules/pages/choose_sports_page.dart';
import 'dart:math' as math;

import 'package:sports_news_app/widget_tree.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  static const Color primaryGreen = Color(0xFF43A047);
  static const Color darkGreen = Color(0xFF2E7D32);

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
              return _buildResponsiveLayout(constraints);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildResponsiveLayout(BoxConstraints constraints) {
    final width = constraints.maxWidth;
    final isDesktop = width > 1024;
    final isTablet = width > 600 && width <= 1024;

    if (isDesktop) {
      return _buildDesktopLayout();
    } else if (isTablet) {
      return _buildTabletLayout();
    } else {
      return _buildMobileLayout();
    }
  }

  // ==================== DESKTOP LAYOUT ====================
  Widget _buildDesktopLayout() {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              // Left side - Content
              Expanded(
                flex: 5,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeadline(fontSize: 56),
                          const SizedBox(height: 24),
                          _buildSubtitle(fontSize: 20),
                          const SizedBox(height: 40),
                          const SizedBox(height: 48),
                          _buildActionButtons(isDesktop: true),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // Right side - Illustration
              Expanded(flex: 5, child: _buildIllustrationSection()),
            ],
          ),
        ),
        _buildFooter(isDesktop: true),
      ],
    );
  }

  // ==================== TABLET LAYOUT ====================
  Widget _buildTabletLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    SizedBox(height: 300, child: _buildIllustrationSection()),
                    const SizedBox(height: 40),
                    _buildHeadline(fontSize: 42, centered: true),
                    const SizedBox(height: 20),
                    _buildSubtitle(fontSize: 18, centered: true),
                    const SizedBox(height: 32),
                    const SizedBox(height: 40),
                    _buildActionButtons(isDesktop: false),
                    const SizedBox(height: 48),
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
                    _buildActionButtons(isDesktop: false, fullWidth: true),
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
    required bool isDesktop,
    bool fullWidth = false,
  }) {
    return Wrap(
      alignment: isDesktop ? WrapAlignment.start : WrapAlignment.center,
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
                padding: EdgeInsets.symmetric(
                  horizontal: isDesktop ? 40 : 32,
                  vertical: isDesktop ? 20 : 16,
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
                      fontSize: isDesktop ? 18 : 16,
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
              // Navigate to sign in
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: primaryGreen,
              side: const BorderSide(color: primaryGreen, width: 2),
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 40 : 32,
                vertical: isDesktop ? 20 : 16,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              'Sign In',
              style: TextStyle(
                fontSize: isDesktop ? 18 : 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
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
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
      ),
      child: isDesktop
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2024 SportsFeed. All rights reserved.',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                Row(
                  children: [
                    _buildFooterLink('Privacy Policy'),
                    const SizedBox(width: 24),
                    _buildFooterLink('Terms of Service'),
                    const SizedBox(width: 24),
                    _buildFooterLink('Contact'),
                  ],
                ),
              ],
            )
          : Column(
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

  Widget _buildFooterLink(String title) {
    return TextButton(
      onPressed: () {},
      child: Text(title, style: TextStyle(color: Colors.grey[600])),
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

// Custom AnimatedBuilder widget for cleaner animation code
class AnimatedBuilder extends AnimatedWidget {
  final Widget Function(BuildContext context, Widget? child) builder;
  final Widget? child;

  const AnimatedBuilder({
    super.key,
    required Animation<double> animation,
    required this.builder,
    this.child,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return builder(context, child);
  }
}
