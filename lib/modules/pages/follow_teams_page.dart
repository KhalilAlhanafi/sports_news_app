import 'package:flutter/material.dart';

// Team Model
class Team {
  final String id;
  final String name;
  final String country;
  final String logoUrl;
  final TeamType type;
  final String? league;
  bool isFollowing;

  Team({
    required this.id,
    required this.name,
    required this.country,
    required this.logoUrl,
    required this.type,
    this.league,
    this.isFollowing = false,
  });
}

enum TeamType { club, national }

class FollowTeamsPage extends StatefulWidget {
  const FollowTeamsPage({super.key});

  @override
  State<FollowTeamsPage> createState() => _FollowTeamsPageState();
}

class _FollowTeamsPageState extends State<FollowTeamsPage>
    with SingleTickerProviderStateMixin {
  static const Color primaryGreen = Color(0xFF43A047);
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFF81C784);

  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<Team> _allTeams = [];
  Set<String> _followedTeamIds = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _initializeTeams();
  }

  void _initializeTeams() {
    _allTeams = [
      // English Clubs
      Team(
        id: 'man_utd',
        name: 'Manchester United',
        country: 'England',
        logoUrl: '🔴',
        type: TeamType.club,
        league: 'Premier League',
      ),
      Team(
        id: 'man_city',
        name: 'Manchester City',
        country: 'England',
        logoUrl: '🩵',
        type: TeamType.club,
        league: 'Premier League',
      ),
      Team(
        id: 'liverpool',
        name: 'Liverpool',
        country: 'England',
        logoUrl: '🔴',
        type: TeamType.club,
        league: 'Premier League',
      ),
      Team(
        id: 'chelsea',
        name: 'Chelsea',
        country: 'England',
        logoUrl: '🔵',
        type: TeamType.club,
        league: 'Premier League',
      ),
      Team(
        id: 'arsenal',
        name: 'Arsenal',
        country: 'England',
        logoUrl: '🔴',
        type: TeamType.club,
        league: 'Premier League',
      ),
      // Spanish Clubs
      Team(
        id: 'real_madrid',
        name: 'Real Madrid',
        country: 'Spain',
        logoUrl: '⚪',
        type: TeamType.club,
        league: 'La Liga',
      ),
      Team(
        id: 'barcelona',
        name: 'FC Barcelona',
        country: 'Spain',
        logoUrl: '🔵🔴',
        type: TeamType.club,
        league: 'La Liga',
      ),
      Team(
        id: 'atletico',
        name: 'Atlético Madrid',
        country: 'Spain',
        logoUrl: '🔴⚪',
        type: TeamType.club,
        league: 'La Liga',
      ),
      // German Clubs
      Team(
        id: 'bayern',
        name: 'Bayern Munich',
        country: 'Germany',
        logoUrl: '🔴',
        type: TeamType.club,
        league: 'Bundesliga',
      ),
      Team(
        id: 'dortmund',
        name: 'Borussia Dortmund',
        country: 'Germany',
        logoUrl: '🟡',
        type: TeamType.club,
        league: 'Bundesliga',
      ),
      // Italian Clubs
      Team(
        id: 'juventus',
        name: 'Juventus',
        country: 'Italy',
        logoUrl: '⚫⚪',
        type: TeamType.club,
        league: 'Serie A',
      ),
      Team(
        id: 'ac_milan',
        name: 'AC Milan',
        country: 'Italy',
        logoUrl: '🔴⚫',
        type: TeamType.club,
        league: 'Serie A',
      ),
      Team(
        id: 'inter',
        name: 'Inter Milan',
        country: 'Italy',
        logoUrl: '🔵⚫',
        type: TeamType.club,
        league: 'Serie A',
      ),
      // French Clubs
      Team(
        id: 'psg',
        name: 'Paris Saint-Germain',
        country: 'France',
        logoUrl: '🔵🔴',
        type: TeamType.club,
        league: 'Ligue 1',
      ),
      Team(
        id: 'monaco',
        name: 'AS Monaco',
        country: 'France',
        logoUrl: '🔴⚪',
        type: TeamType.club,
        league: 'Ligue 1',
      ),
      // National Teams - South America
      Team(
        id: 'brazil',
        name: 'Brazil',
        country: 'South America',
        logoUrl: '🇧🇷',
        type: TeamType.national,
      ),
      Team(
        id: 'argentina',
        name: 'Argentina',
        country: 'South America',
        logoUrl: '🇦🇷',
        type: TeamType.national,
      ),
      // National Teams - Europe
      Team(
        id: 'germany_nt',
        name: 'Germany',
        country: 'Europe',
        logoUrl: '🇩🇪',
        type: TeamType.national,
      ),
      Team(
        id: 'france_nt',
        name: 'France',
        country: 'Europe',
        logoUrl: '🇫🇷',
        type: TeamType.national,
      ),
      Team(
        id: 'italy_nt',
        name: 'Italy',
        country: 'Europe',
        logoUrl: '🇮🇹',
        type: TeamType.national,
      ),
      Team(
        id: 'spain_nt',
        name: 'Spain',
        country: 'Europe',
        logoUrl: '🇪🇸',
        type: TeamType.national,
      ),
      Team(
        id: 'england_nt',
        name: 'England',
        country: 'Europe',
        logoUrl: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        type: TeamType.national,
      ),
      Team(
        id: 'portugal_nt',
        name: 'Portugal',
        country: 'Europe',
        logoUrl: '🇵🇹',
        type: TeamType.national,
      ),
      Team(
        id: 'netherlands_nt',
        name: 'Netherlands',
        country: 'Europe',
        logoUrl: '🇳🇱',
        type: TeamType.national,
      ),
      Team(
        id: 'belgium_nt',
        name: 'Belgium',
        country: 'Europe',
        logoUrl: '🇧🇪',
        type: TeamType.national,
      ),
      // National Teams - North/Central America
      Team(
        id: 'mexico_nt',
        name: 'Mexico',
        country: 'North America',
        logoUrl: '🇲🇽',
        type: TeamType.national,
      ),
      Team(
        id: 'usa_nt',
        name: 'USA',
        country: 'North America',
        logoUrl: '🇺🇸',
        type: TeamType.national,
      ),
      // National Teams - Africa
      Team(
        id: 'nigeria_nt',
        name: 'Nigeria',
        country: 'Africa',
        logoUrl: '🇳🇬',
        type: TeamType.national,
      ),
      // National Teams - Asia
      Team(
        id: 'japan_nt',
        name: 'Japan',
        country: 'Asia',
        logoUrl: '🇯🇵',
        type: TeamType.national,
      ),
      Team(
        id: 'south_korea_nt',
        name: 'South Korea',
        country: 'Asia',
        logoUrl: '🇰🇷',
        type: TeamType.national,
      ),
      Team(
        id: 'syria_nt',
        name: 'Syria',
        country: 'Asia',
        logoUrl: '🇸🇾',
        type: TeamType.national,
      ),
      Team(
        id: 'palestine_nt',
        name: 'Palestine',
        country: 'Asia',
        logoUrl: '🇵🇸',
        type: TeamType.national,
      ),
    ];
  }

  List<Team> get _filteredTeams {
    if (_searchQuery.isEmpty) {
      return _allTeams;
    }
    return _allTeams.where((team) {
      return team.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          team.country.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          (team.league?.toLowerCase().contains(_searchQuery.toLowerCase()) ??
              false);
    }).toList();
  }

  List<Team> get _clubTeams =>
      _filteredTeams.where((t) => t.type == TeamType.club).toList();

  List<Team> get _nationalTeams =>
      _filteredTeams.where((t) => t.type == TeamType.national).toList();

  void _toggleFollow(Team team) {
    setState(() {
      if (_followedTeamIds.contains(team.id)) {
        _followedTeamIds.remove(team.id);
        team.isFollowing = false;
      } else {
        _followedTeamIds.add(team.id);
        team.isFollowing = true;
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return _buildResponsiveLayout(constraints);
          },
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
    return Row(
      children: [
        // Sidebar
        _buildDesktopSidebar(),
        // Main Content
        Expanded(
          child: Column(
            children: [
              _buildDesktopHeader(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: _buildMainContent(isDesktop: true),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopSidebar() {
    return Container(
      width: 280,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo
          Container(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryGreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.sports_soccer,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'SportsFeed',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          // Onboarding Progress
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Setup Progress',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                _buildProgressItem('Choose Sports', true, 1),
                _buildProgressItem('Select Leagues', true, 2),
                _buildProgressItem('Follow Teams', false, 3, isActive: true),
                _buildProgressItem('Follow Players', false, 4),
              ],
            ),
          ),
          const Spacer(),
          // Following Summary
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryGreen.withOpacity(0.1),
                  lightGreen.withOpacity(0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: lightGreen.withOpacity(0.3)),
            ),
            child: Column(
              children: [
                Icon(Icons.groups_outlined, color: primaryGreen, size: 40),
                const SizedBox(height: 12),
                Text(
                  '${_followedTeamIds.length}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
                const Text(
                  'Teams Following',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressItem(
    String title,
    bool isCompleted,
    int step, {
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: isCompleted
                  ? primaryGreen
                  : isActive
                  ? primaryGreen.withOpacity(0.2)
                  : Colors.grey[200],
              shape: BoxShape.circle,
              border: isActive
                  ? Border.all(color: primaryGreen, width: 2)
                  : null,
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : Text(
                      '$step',
                      style: TextStyle(
                        color: isActive ? primaryGreen : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: TextStyle(
              color: isActive ? darkGreen : Colors.grey[600],
              fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(child: _buildSearchBar(isDesktop: true)),
          const SizedBox(width: 24),
          _buildFollowingChip(),
          const SizedBox(width: 16),
          _buildContinueButton(),
        ],
      ),
    );
  }

  // ==================== TABLET LAYOUT ====================
  Widget _buildTabletLayout() {
    return Column(
      children: [
        _buildMobileHeader(),
        _buildSearchBar(isDesktop: false),
        _buildTabBar(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildTabContent(crossAxisCount: 2),
          ),
        ),
        _buildBottomBar(),
      ],
    );
  }

  // ==================== MOBILE LAYOUT ====================
  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildMobileHeader(),
        _buildSearchBar(isDesktop: false),
        _buildTabBar(),
        Expanded(child: _buildTabContent(crossAxisCount: 1)),
        _buildBottomBar(),
      ],
    );
  }

  Widget _buildMobileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios, color: darkGreen),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Follow Teams',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Step 3 of 4',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              _buildFollowingChip(),
            ],
          ),
          const SizedBox(height: 16),
          // Progress bar
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: 0.75,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(primaryGreen),
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar({required bool isDesktop}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 0 : 20,
        vertical: isDesktop ? 0 : 16,
      ),
      color: isDesktop ? Colors.transparent : Colors.white,
      child: Container(
        decoration: BoxDecoration(
          color: isDesktop ? Colors.grey[100] : Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          decoration: InputDecoration(
            hintText: 'Search teams, countries, or leagues...',
            hintStyle: TextStyle(color: Colors.grey[500]),
            prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.clear, color: Colors.grey[500]),
                    onPressed: () {
                      setState(() {
                        _searchController.clear();
                        _searchQuery = '';
                      });
                    },
                  )
                : null,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFollowingChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: primaryGreen.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: primaryGreen.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: primaryGreen, size: 18),
          const SizedBox(width: 6),
          Text(
            '${_followedTeamIds.length} Following',
            style: const TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      onPressed: _followedTeamIds.isNotEmpty
          ? () {
              // Navigate to next page
            }
          : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        disabledBackgroundColor: Colors.grey[300],
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Continue',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(width: 8),
          Icon(Icons.arrow_forward, size: 20),
        ],
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        controller: _tabController,
        labelColor: primaryGreen,
        unselectedLabelColor: Colors.grey[600],
        indicatorColor: primaryGreen,
        indicatorWeight: 3,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        tabs: [
          Tab(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.sports_soccer, size: 20),
                  const SizedBox(width: 8),
                  const Text('All'),
                  if (_filteredTeams.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${_filteredTeams.length}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Tab(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.stadium_outlined, size: 20),
                  const SizedBox(width: 8),
                  const Text('Clubs'),
                  if (_clubTeams.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${_clubTeams.length}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
          ),
          Tab(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.flag_outlined, size: 20),
                  const SizedBox(width: 8),
                  const Text('National'),
                  if (_nationalTeams.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '${_nationalTeams.length}',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent({required bool isDesktop}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.groups_outlined,
                    color: primaryGreen,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Follow Your Favorite Teams',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Select teams to get personalized news and updates',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Tab Bar
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[600],
              indicator: BoxDecoration(
                color: primaryGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Colors.transparent,
              labelStyle: const TextStyle(fontWeight: FontWeight.w600),
              padding: const EdgeInsets.all(4),
              tabs: const [
                Tab(text: 'All Teams'),
                Tab(text: 'Club Teams'),
                Tab(text: 'National Teams'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildTeamsList(_filteredTeams, isDesktop: isDesktop),
                _buildTeamsList(_clubTeams, isDesktop: isDesktop),
                _buildTeamsList(_nationalTeams, isDesktop: isDesktop),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent({required int crossAxisCount}) {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildTeamsGrid(_filteredTeams, crossAxisCount: crossAxisCount),
        _buildTeamsGrid(_clubTeams, crossAxisCount: crossAxisCount),
        _buildTeamsGrid(_nationalTeams, crossAxisCount: crossAxisCount),
      ],
    );
  }

  Widget _buildTeamsList(List<Team> teams, {required bool isDesktop}) {
    if (teams.isEmpty) {
      return _buildEmptyState();
    }

    // Group teams by country/league
    Map<String, List<Team>> groupedTeams = {};
    for (var team in teams) {
      String key = team.type == TeamType.club
          ? team.league ?? team.country
          : team.country;
      groupedTeams.putIfAbsent(key, () => []).add(team);
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      itemCount: groupedTeams.length,
      itemBuilder: (context, index) {
        String groupName = groupedTeams.keys.elementAt(index);
        List<Team> groupTeams = groupedTeams[groupName]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (index > 0) const SizedBox(height: 24),
            // Section Header
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: primaryGreen.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      groupName,
                      style: const TextStyle(
                        color: primaryGreen,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(height: 1, color: Colors.grey[200]),
                  ),
                ],
              ),
            ),
            // Teams Grid
            if (isDesktop)
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: groupTeams.map((team) {
                  return SizedBox(width: 320, child: _buildTeamCard(team));
                }).toList(),
              )
            else
              ...groupTeams.map(
                (team) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _buildTeamCard(team),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildTeamsGrid(List<Team> teams, {required int crossAxisCount}) {
    if (teams.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: teams.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildTeamCard(teams[index]),
        );
      },
    );
  }

  Widget _buildTeamCard(Team team) {
    final isFollowing = _followedTeamIds.contains(team.id);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isFollowing ? primaryGreen : Colors.grey[200]!,
          width: isFollowing ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isFollowing
                ? primaryGreen.withOpacity(0.15)
                : Colors.black.withOpacity(0.05),
            blurRadius: isFollowing ? 12 : 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _toggleFollow(team),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Team Logo
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: team.type == TeamType.national
                        ? Colors.grey[100]
                        : _getTeamColor(team.name).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: team.type == TeamType.national
                          ? Colors.grey[300]!
                          : _getTeamColor(team.name).withOpacity(0.3),
                    ),
                  ),
                  child: Center(
                    child: team.type == TeamType.national
                        ? Text(
                            team.logoUrl,
                            style: const TextStyle(fontSize: 28),
                          )
                        : Text(
                            _getTeamInitials(team.name),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: _getTeamColor(team.name),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 16),
                // Team Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        team.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          if (team.type == TeamType.club) ...[
                            Icon(
                              Icons.location_on_outlined,
                              size: 14,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              team.country,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                            if (team.league != null) ...[
                              Container(
                                width: 4,
                                height: 4,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  team.league!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[500],
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ] else ...[
                            Icon(
                              Icons.public,
                              size: 14,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 4),
                            Text(
                              team.country,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Follow Button (flexible to avoid overflow)
                Flexible(
                  fit: FlexFit.loose,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      child: isFollowing
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: primaryGreen,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  color: primaryGreen,
                                  width: 1.5,
                                ),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: primaryGreen,
                                    size: 18,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Follow',
                                    style: TextStyle(
                                      color: primaryGreen,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.search_off, size: 48, color: Colors.grey[400]),
          ),
          const SizedBox(height: 24),
          const Text(
            'No teams found',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try searching with different keywords',
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          ),
          const SizedBox(height: 24),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _searchController.clear();
                _searchQuery = '';
              });
            },
            icon: const Icon(Icons.refresh),
            label: const Text('Clear search'),
            style: TextButton.styleFrom(foregroundColor: primaryGreen),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Skip button
            TextButton(
              onPressed: () {
                // Skip and continue
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Spacer(),
            // Continue button
            ElevatedButton(
              onPressed: _followedTeamIds.isNotEmpty
                  ? () {
                      // Navigate to next page
                      _showSuccessDialog();
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryGreen,
                foregroundColor: Colors.white,
                disabledBackgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _followedTeamIds.isEmpty
                        ? 'Select Teams'
                        : 'Continue (${_followedTeamIds.length})',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryGreen.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: primaryGreen,
                size: 60,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Great Choice!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text(
              'You\'re now following ${_followedTeamIds.length} teams.\nLet\'s select your favorite players next!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate to follow players page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Follow Players',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTeamColor(String teamName) {
    final colors = {
      'Manchester United': Colors.red[700]!,
      'Manchester City': Colors.lightBlue[400]!,
      'Liverpool': Colors.red[600]!,
      'Chelsea': Colors.blue[700]!,
      'Arsenal': Colors.red[600]!,
      'Real Madrid': Colors.purple[700]!,
      'FC Barcelona': Colors.blue[800]!,
      'Atlético Madrid': Colors.red[700]!,
      'Bayern Munich': Colors.red[700]!,
      'Borussia Dortmund': Colors.yellow[700]!,
      'Juventus': Colors.black87,
      'AC Milan': Colors.red[700]!,
      'Inter Milan': Colors.blue[800]!,
      'Paris Saint-Germain': Colors.blue[900]!,
      'AS Monaco': Colors.red[600]!,
    };
    return colors[teamName] ?? primaryGreen;
  }

  String _getTeamInitials(String teamName) {
    final words = teamName.split(' ');
    if (words.length >= 2) {
      return '${words[0][0]}${words[1][0]}'.toUpperCase();
    }
    return teamName.substring(0, 2).toUpperCase();
  }
}
