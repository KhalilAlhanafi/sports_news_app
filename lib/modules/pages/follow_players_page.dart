import 'package:flutter/material.dart';
import 'package:sports_news_app/widget_tree.dart';

// Player Model
class Player {
  final String id;
  final String name;
  final String nationality;
  final String team;
  final SportType sport;
  final String position;
  final String imageEmoji;
  final String flagEmoji;
  final String? jerseyNumber;
  final bool isFeatured;
  bool isFollowing;

  Player({
    required this.id,
    required this.name,
    required this.nationality,
    required this.team,
    required this.sport,
    required this.position,
    required this.imageEmoji,
    required this.flagEmoji,
    this.jerseyNumber,
    this.isFeatured = false,
    this.isFollowing = false,
  });
}

enum SportType { football, basketball, tennis, volleyball }

class FollowPlayersPage extends StatefulWidget {
  const FollowPlayersPage({super.key});

  @override
  State<FollowPlayersPage> createState() => _FollowPlayersPageState();
}

class _FollowPlayersPageState extends State<FollowPlayersPage>
    with SingleTickerProviderStateMixin {
  static const Color primaryGreen = Color(0xFF43A047);
  static const Color darkGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFF81C784);

  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  List<Player> _allPlayers = [];
  Set<String> _followedPlayerIds = {};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    _initializePlayers();
  }

  void _initializePlayers() {
    _allPlayers = [
      // ==================== FOOTBALL PLAYERS (20) ====================
      Player(
        id: 'messi',
        name: 'Lionel Messi',
        nationality: 'Argentina',
        team: 'Inter Miami',
        sport: SportType.football,
        position: 'Forward',
        imageEmoji: '🇦🇷',
        flagEmoji: '🇦🇷',
        jerseyNumber: '10',
        isFeatured: true,
      ),
      Player(
        id: 'ronaldo',
        name: 'Cristiano Ronaldo',
        nationality: 'Portugal',
        team: 'Al-Nassr',
        sport: SportType.football,
        position: 'Forward',
        imageEmoji: '🇵🇹',
        flagEmoji: '🇵🇹',
        jerseyNumber: '7',
        isFeatured: true,
      ),
      Player(
        id: 'mbappe',
        name: 'Kylian Mbappé',
        nationality: 'France',
        team: 'Real Madrid',
        sport: SportType.football,
        position: 'Forward',
        imageEmoji: '🇫🇷',
        flagEmoji: '🇫🇷',
        jerseyNumber: '9',
        isFeatured: true,
      ),
      Player(
        id: 'haaland',
        name: 'Erling Haaland',
        nationality: 'Norway',
        team: 'Manchester City',
        sport: SportType.football,
        position: 'Striker',
        imageEmoji: '🇳🇴',
        flagEmoji: '🇳🇴',
        jerseyNumber: '9',
        isFeatured: true,
      ),
      Player(
        id: 'bellingham',
        name: 'Jude Bellingham',
        nationality: 'England',
        team: 'Real Madrid',
        sport: SportType.football,
        position: 'Midfielder',
        imageEmoji: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        flagEmoji: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        jerseyNumber: '5',
        isFeatured: true,
      ),
      Player(
        id: 'vinicius',
        name: 'Vinícius Jr',
        nationality: 'Brazil',
        team: 'Real Madrid',
        sport: SportType.football,
        position: 'Winger',
        imageEmoji: '🇧🇷',
        flagEmoji: '🇧🇷',
        jerseyNumber: '7',
      ),
      Player(
        id: 'salah',
        name: 'Mohamed Salah',
        nationality: 'Egypt',
        team: 'Liverpool',
        sport: SportType.football,
        position: 'Forward',
        imageEmoji: '🇪🇬',
        flagEmoji: '🇪🇬',
        jerseyNumber: '11',
      ),
      Player(
        id: 'debruyne',
        name: 'Kevin De Bruyne',
        nationality: 'Belgium',
        team: 'Manchester City',
        sport: SportType.football,
        position: 'Midfielder',
        imageEmoji: '🇧🇪',
        flagEmoji: '🇧🇪',
        jerseyNumber: '17',
      ),
      Player(
        id: 'neymar',
        name: 'Neymar Jr',
        nationality: 'Brazil',
        team: 'Al-Hilal',
        sport: SportType.football,
        position: 'Forward',
        imageEmoji: '🇧🇷',
        flagEmoji: '🇧🇷',
        jerseyNumber: '10',
      ),
      Player(
        id: 'lewandowski',
        name: 'Robert Lewandowski',
        nationality: 'Poland',
        team: 'Barcelona',
        sport: SportType.football,
        position: 'Striker',
        imageEmoji: '🇵🇱',
        flagEmoji: '🇵🇱',
        jerseyNumber: '9',
      ),
      Player(
        id: 'kane',
        name: 'Harry Kane',
        nationality: 'England',
        team: 'Bayern Munich',
        sport: SportType.football,
        position: 'Striker',
        imageEmoji: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        flagEmoji: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        jerseyNumber: '9',
      ),
      Player(
        id: 'modric',
        name: 'Luka Modrić',
        nationality: 'Croatia',
        team: 'Real Madrid',
        sport: SportType.football,
        position: 'Midfielder',
        imageEmoji: '🇭🇷',
        flagEmoji: '🇭🇷',
        jerseyNumber: '10',
      ),
      Player(
        id: 'pedri',
        name: 'Pedri',
        nationality: 'Spain',
        team: 'Barcelona',
        sport: SportType.football,
        position: 'Midfielder',
        imageEmoji: '🇪🇸',
        flagEmoji: '🇪🇸',
        jerseyNumber: '8',
      ),
      Player(
        id: 'saka',
        name: 'Bukayo Saka',
        nationality: 'England',
        team: 'Arsenal',
        sport: SportType.football,
        position: 'Winger',
        imageEmoji: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        flagEmoji: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        jerseyNumber: '7',
      ),
      Player(
        id: 'foden',
        name: 'Phil Foden',
        nationality: 'England',
        team: 'Manchester City',
        sport: SportType.football,
        position: 'Midfielder',
        imageEmoji: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        flagEmoji: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        jerseyNumber: '47',
      ),
      Player(
        id: 'rodri',
        name: 'Rodri',
        nationality: 'Spain',
        team: 'Manchester City',
        sport: SportType.football,
        position: 'Midfielder',
        imageEmoji: '🇪🇸',
        flagEmoji: '🇪🇸',
        jerseyNumber: '16',
      ),
      Player(
        id: 'yamal',
        name: 'Lamine Yamal',
        nationality: 'Spain',
        team: 'Barcelona',
        sport: SportType.football,
        position: 'Winger',
        imageEmoji: '🇪🇸',
        flagEmoji: '🇪🇸',
        jerseyNumber: '19',
      ),
      Player(
        id: 'osimhen',
        name: 'Victor Osimhen',
        nationality: 'Nigeria',
        team: 'Galatasaray',
        sport: SportType.football,
        position: 'Striker',
        imageEmoji: '🇳🇬',
        flagEmoji: '🇳🇬',
        jerseyNumber: '45',
      ),
      Player(
        id: 'son',
        name: 'Son Heung-min',
        nationality: 'South Korea',
        team: 'Tottenham',
        sport: SportType.football,
        position: 'Forward',
        imageEmoji: '🇰🇷',
        flagEmoji: '🇰🇷',
        jerseyNumber: '7',
      ),
      Player(
        id: 'martinez',
        name: 'Lautaro Martínez',
        nationality: 'Argentina',
        team: 'Inter Milan',
        sport: SportType.football,
        position: 'Striker',
        imageEmoji: '🇦🇷',
        flagEmoji: '🇦🇷',
        jerseyNumber: '10',
      ),

      // ==================== BASKETBALL PLAYERS (15) ====================
      Player(
        id: 'lebron',
        name: 'LeBron James',
        nationality: 'USA',
        team: 'Los Angeles Lakers',
        sport: SportType.basketball,
        position: 'Small Forward',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '23',
        isFeatured: true,
      ),
      Player(
        id: 'curry',
        name: 'Stephen Curry',
        nationality: 'USA',
        team: 'Golden State Warriors',
        sport: SportType.basketball,
        position: 'Point Guard',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '30',
        isFeatured: true,
      ),
      Player(
        id: 'durant',
        name: 'Kevin Durant',
        nationality: 'USA',
        team: 'Phoenix Suns',
        sport: SportType.basketball,
        position: 'Small Forward',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '35',
        isFeatured: true,
      ),
      Player(
        id: 'giannis',
        name: 'Giannis Antetokounmpo',
        nationality: 'Greece',
        team: 'Milwaukee Bucks',
        sport: SportType.basketball,
        position: 'Power Forward',
        imageEmoji: '🇬🇷',
        flagEmoji: '🇬🇷',
        jerseyNumber: '34',
        isFeatured: true,
      ),
      Player(
        id: 'luka',
        name: 'Luka Dončić',
        nationality: 'Slovenia',
        team: 'Dallas Mavericks',
        sport: SportType.basketball,
        position: 'Point Guard',
        imageEmoji: '🇸🇮',
        flagEmoji: '🇸🇮',
        jerseyNumber: '77',
        isFeatured: true,
      ),
      Player(
        id: 'jokic',
        name: 'Nikola Jokić',
        nationality: 'Serbia',
        team: 'Denver Nuggets',
        sport: SportType.basketball,
        position: 'Center',
        imageEmoji: '🇷🇸',
        flagEmoji: '🇷🇸',
        jerseyNumber: '15',
        isFeatured: true,
      ),
      Player(
        id: 'embiid',
        name: 'Joel Embiid',
        nationality: 'Cameroon',
        team: 'Philadelphia 76ers',
        sport: SportType.basketball,
        position: 'Center',
        imageEmoji: '🇨🇲',
        flagEmoji: '🇨🇲',
        jerseyNumber: '21',
      ),
      Player(
        id: 'tatum',
        name: 'Jayson Tatum',
        nationality: 'USA',
        team: 'Boston Celtics',
        sport: SportType.basketball,
        position: 'Small Forward',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '0',
      ),
      Player(
        id: 'edwards',
        name: 'Anthony Edwards',
        nationality: 'USA',
        team: 'Minnesota Timberwolves',
        sport: SportType.basketball,
        position: 'Shooting Guard',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '5',
      ),
      Player(
        id: 'sga',
        name: 'Shai Gilgeous-Alexander',
        nationality: 'Canada',
        team: 'Oklahoma City Thunder',
        sport: SportType.basketball,
        position: 'Point Guard',
        imageEmoji: '🇨🇦',
        flagEmoji: '🇨🇦',
        jerseyNumber: '2',
      ),
      Player(
        id: 'wemby',
        name: 'Victor Wembanyama',
        nationality: 'France',
        team: 'San Antonio Spurs',
        sport: SportType.basketball,
        position: 'Center',
        imageEmoji: '🇫🇷',
        flagEmoji: '🇫🇷',
        jerseyNumber: '1',
      ),
      Player(
        id: 'morant',
        name: 'Ja Morant',
        nationality: 'USA',
        team: 'Memphis Grizzlies',
        sport: SportType.basketball,
        position: 'Point Guard',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '12',
      ),
      Player(
        id: 'booker',
        name: 'Devin Booker',
        nationality: 'USA',
        team: 'Phoenix Suns',
        sport: SportType.basketball,
        position: 'Shooting Guard',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '1',
      ),
      Player(
        id: 'brown',
        name: 'Jaylen Brown',
        nationality: 'USA',
        team: 'Boston Celtics',
        sport: SportType.basketball,
        position: 'Shooting Guard',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '7',
      ),
      Player(
        id: 'davis',
        name: 'Anthony Davis',
        nationality: 'USA',
        team: 'Los Angeles Lakers',
        sport: SportType.basketball,
        position: 'Power Forward',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '3',
      ),

      // ==================== TENNIS PLAYERS (15) ====================
      Player(
        id: 'djokovic',
        name: 'Novak Djokovic',
        nationality: 'Serbia',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles',
        imageEmoji: '🇷🇸',
        flagEmoji: '🇷🇸',
        isFeatured: true,
      ),
      Player(
        id: 'alcaraz',
        name: 'Carlos Alcaraz',
        nationality: 'Spain',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles',
        imageEmoji: '🇪🇸',
        flagEmoji: '🇪🇸',
        isFeatured: true,
      ),
      Player(
        id: 'sinner',
        name: 'Jannik Sinner',
        nationality: 'Italy',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles',
        imageEmoji: '🇮🇹',
        flagEmoji: '🇮🇹',
        isFeatured: true,
      ),
      Player(
        id: 'medvedev',
        name: 'Daniil Medvedev',
        nationality: 'Russia',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles',
        imageEmoji: '🇷🇺',
        flagEmoji: '🇷🇺',
      ),
      Player(
        id: 'zverev',
        name: 'Alexander Zverev',
        nationality: 'Germany',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles',
        imageEmoji: '🇩🇪',
        flagEmoji: '🇩🇪',
      ),
      Player(
        id: 'nadal',
        name: 'Rafael Nadal',
        nationality: 'Spain',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles',
        imageEmoji: '🇪🇸',
        flagEmoji: '🇪🇸',
        isFeatured: true,
      ),
      Player(
        id: 'ruud',
        name: 'Casper Ruud',
        nationality: 'Norway',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles',
        imageEmoji: '🇳🇴',
        flagEmoji: '🇳🇴',
      ),
      Player(
        id: 'rublev',
        name: 'Andrey Rublev',
        nationality: 'Russia',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles',
        imageEmoji: '🇷🇺',
        flagEmoji: '🇷🇺',
      ),
      // Women's Tennis
      Player(
        id: 'swiatek',
        name: 'Iga Świątek',
        nationality: 'Poland',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles (WTA)',
        imageEmoji: '🇵🇱',
        flagEmoji: '🇵🇱',
        isFeatured: true,
      ),
      Player(
        id: 'sabalenka',
        name: 'Aryna Sabalenka',
        nationality: 'Belarus',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles (WTA)',
        imageEmoji: '🇧🇾',
        flagEmoji: '🇧🇾',
        isFeatured: true,
      ),
      Player(
        id: 'gauff',
        name: 'Coco Gauff',
        nationality: 'USA',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles (WTA)',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
      ),
      Player(
        id: 'rybakina',
        name: 'Elena Rybakina',
        nationality: 'Kazakhstan',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles (WTA)',
        imageEmoji: '🇰🇿',
        flagEmoji: '🇰🇿',
      ),
      Player(
        id: 'pegula',
        name: 'Jessica Pegula',
        nationality: 'USA',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles (WTA)',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
      ),
      Player(
        id: 'zheng',
        name: 'Zheng Qinwen',
        nationality: 'China',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles (WTA)',
        imageEmoji: '🇨🇳',
        flagEmoji: '🇨🇳',
      ),
      Player(
        id: 'keys',
        name: 'Madison Keys',
        nationality: 'USA',
        team: 'Individual',
        sport: SportType.tennis,
        position: 'Singles (WTA)',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
      ),

      // ==================== VOLLEYBALL PLAYERS (15) ====================
      Player(
        id: 'leon',
        name: 'Wilfredo León',
        nationality: 'Poland',
        team: 'Perugia',
        sport: SportType.volleyball,
        position: 'Outside Hitter',
        imageEmoji: '🇵🇱',
        flagEmoji: '🇵🇱',
        jerseyNumber: '9',
        isFeatured: true,
      ),
      Player(
        id: 'ngapeth',
        name: "Earvin N'Gapeth",
        nationality: 'France',
        team: 'Modena',
        sport: SportType.volleyball,
        position: 'Outside Hitter',
        imageEmoji: '🇫🇷',
        flagEmoji: '🇫🇷',
        jerseyNumber: '9',
        isFeatured: true,
      ),
      Player(
        id: 'ishikawa',
        name: 'Yuki Ishikawa',
        nationality: 'Japan',
        team: 'Perugia',
        sport: SportType.volleyball,
        position: 'Outside Hitter',
        imageEmoji: '🇯🇵',
        flagEmoji: '🇯🇵',
        jerseyNumber: '14',
      ),
      Player(
        id: 'anderson',
        name: 'Matt Anderson',
        nationality: 'USA',
        team: 'Modena',
        sport: SportType.volleyball,
        position: 'Opposite',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '1',
      ),
      Player(
        id: 'kurek',
        name: 'Bartosz Kurek',
        nationality: 'Poland',
        team: 'Zawiercie',
        sport: SportType.volleyball,
        position: 'Opposite',
        imageEmoji: '🇵🇱',
        flagEmoji: '🇵🇱',
        jerseyNumber: '13',
        isFeatured: true,
      ),
      Player(
        id: 'bruninho',
        name: 'Bruno Rezende',
        nationality: 'Brazil',
        team: 'Sada Cruzeiro',
        sport: SportType.volleyball,
        position: 'Setter',
        imageEmoji: '🇧🇷',
        flagEmoji: '🇧🇷',
        jerseyNumber: '1',
      ),
      Player(
        id: 'leal',
        name: 'Yoandy Leal',
        nationality: 'Brazil',
        team: 'Jastrzębie',
        sport: SportType.volleyball,
        position: 'Outside Hitter',
        imageEmoji: '🇧🇷',
        flagEmoji: '🇧🇷',
        jerseyNumber: '9',
      ),
      Player(
        id: 'juantorena',
        name: 'Osmany Juantorena',
        nationality: 'Italy',
        team: 'Retired',
        sport: SportType.volleyball,
        position: 'Outside Hitter',
        imageEmoji: '🇮🇹',
        flagEmoji: '🇮🇹',
        jerseyNumber: '5',
      ),
      // Women's Volleyball
      Player(
        id: 'egonu',
        name: 'Paola Egonu',
        nationality: 'Italy',
        team: 'VakifBank',
        sport: SportType.volleyball,
        position: 'Opposite',
        imageEmoji: '🇮🇹',
        flagEmoji: '🇮🇹',
        jerseyNumber: '18',
        isFeatured: true,
      ),
      Player(
        id: 'boskovic',
        name: 'Tijana Bošković',
        nationality: 'Serbia',
        team: 'Eczacibasi',
        sport: SportType.volleyball,
        position: 'Opposite',
        imageEmoji: '🇷🇸',
        flagEmoji: '🇷🇸',
        jerseyNumber: '18',
        isFeatured: true,
      ),
      Player(
        id: 'zhu_ting',
        name: 'Zhu Ting',
        nationality: 'China',
        team: 'Tianjin',
        sport: SportType.volleyball,
        position: 'Outside Hitter',
        imageEmoji: '🇨🇳',
        flagEmoji: '🇨🇳',
        jerseyNumber: '2',
      ),
      Player(
        id: 'kim_yeon',
        name: 'Kim Yeon-koung',
        nationality: 'South Korea',
        team: 'Retired',
        sport: SportType.volleyball,
        position: 'Outside Hitter',
        imageEmoji: '🇰🇷',
        flagEmoji: '🇰🇷',
        jerseyNumber: '10',
      ),
      Player(
        id: 'larson',
        name: 'Jordan Larson',
        nationality: 'USA',
        team: 'Retired',
        sport: SportType.volleyball,
        position: 'Outside Hitter',
        imageEmoji: '🇺🇸',
        flagEmoji: '🇺🇸',
        jerseyNumber: '10',
      ),
      Player(
        id: 'haak',
        name: 'Isabelle Haak',
        nationality: 'Sweden',
        team: 'VakifBank',
        sport: SportType.volleyball,
        position: 'Opposite',
        imageEmoji: '🇸🇪',
        flagEmoji: '🇸🇪',
        jerseyNumber: '15',
      ),
      Player(
        id: 'vargas',
        name: 'Melissa Vargas',
        nationality: 'Turkey',
        team: 'VakifBank',
        sport: SportType.volleyball,
        position: 'Outside Hitter',
        imageEmoji: '🇹🇷',
        flagEmoji: '🇹🇷',
        jerseyNumber: '10',
      ),
    ];
  }

  List<Player> get _filteredPlayers {
    if (_searchQuery.isEmpty) {
      return _allPlayers;
    }
    return _allPlayers.where((player) {
      return player.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          player.nationality.toLowerCase().contains(
            _searchQuery.toLowerCase(),
          ) ||
          player.team.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          player.position.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  List<Player> get _footballPlayers =>
      _filteredPlayers.where((p) => p.sport == SportType.football).toList();

  List<Player> get _basketballPlayers =>
      _filteredPlayers.where((p) => p.sport == SportType.basketball).toList();

  List<Player> get _tennisPlayers =>
      _filteredPlayers.where((p) => p.sport == SportType.tennis).toList();

  List<Player> get _volleyballPlayers =>
      _filteredPlayers.where((p) => p.sport == SportType.volleyball).toList();

  List<Player> get _featuredPlayers =>
      _filteredPlayers.where((p) => p.isFeatured).toList();

  void _toggleFollow(Player player) {
    setState(() {
      if (_followedPlayerIds.contains(player.id)) {
        _followedPlayerIds.remove(player.id);
        player.isFollowing = false;
      } else {
        _followedPlayerIds.add(player.id);
        player.isFollowing = true;
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
        _buildDesktopSidebar(),
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
                _buildProgressItem('Follow Teams', true, 3),
                _buildProgressItem('Follow Players', false, 4, isActive: true),
              ],
            ),
          ),
          const Divider(height: 1),
          // Sports Quick Stats
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Following by Sport',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 16),
                _buildSportStatRow(
                  Icons.sports_soccer,
                  'Football',
                  _footballPlayers
                      .where((p) => _followedPlayerIds.contains(p.id))
                      .length,
                  _footballPlayers.length,
                  primaryGreen,
                ),
                _buildSportStatRow(
                  Icons.sports_basketball,
                  'Basketball',
                  _basketballPlayers
                      .where((p) => _followedPlayerIds.contains(p.id))
                      .length,
                  _basketballPlayers.length,
                  Colors.orange[700]!,
                ),
                _buildSportStatRow(
                  Icons.sports_tennis,
                  'Tennis',
                  _tennisPlayers
                      .where((p) => _followedPlayerIds.contains(p.id))
                      .length,
                  _tennisPlayers.length,
                  Colors.yellow[800]!,
                ),
                _buildSportStatRow(
                  Icons.sports_volleyball,
                  'Volleyball',
                  _volleyballPlayers
                      .where((p) => _followedPlayerIds.contains(p.id))
                      .length,
                  _volleyballPlayers.length,
                  Colors.blue[700]!,
                ),
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
                Icon(Icons.people_outline, color: primaryGreen, size: 40),
                const SizedBox(height: 12),
                Text(
                  '${_followedPlayerIds.length}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
                const Text(
                  'Players Following',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSportStatRow(
    IconData icon,
    String sport,
    int following,
    int total,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 18, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sport,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '$following of $total',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: following > 0 ? color.withOpacity(0.1) : Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$following',
              style: TextStyle(
                color: following > 0 ? color : Colors.grey[500],
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
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
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: isActive ? darkGreen : Colors.grey[600],
                fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ),
          if (isActive)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: primaryGreen.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Final',
                style: TextStyle(
                  color: primaryGreen,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
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
          _buildFinishButton(),
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
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Follow Players',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
              ),
              _buildFollowingChip(),
            ],
          ),
          const SizedBox(height: 16),
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
          color: Colors.grey[100],
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
            hintText: 'Search players, teams, or nationalities...',
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
          const Icon(Icons.people, color: primaryGreen, size: 18),
          const SizedBox(width: 6),
          Text(
            '${_followedPlayerIds.length} Following',
            style: const TextStyle(
              color: primaryGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFinishButton() {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const WidgetTree()),
          (route) => false,
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryGreen,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Finish Setup',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(width: 8),
          Icon(Icons.check_circle_outline, size: 20),
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
        isScrollable: true,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        tabAlignment: TabAlignment.start,
        tabs: [
          _buildTabItem(Icons.star, 'Featured', _featuredPlayers.length),
          _buildTabItem(
            Icons.sports_soccer,
            'Football',
            _footballPlayers.length,
          ),
          _buildTabItem(
            Icons.sports_basketball,
            'Basketball',
            _basketballPlayers.length,
          ),
          _buildTabItem(Icons.sports_tennis, 'Tennis', _tennisPlayers.length),
          _buildTabItem(
            Icons.sports_volleyball,
            'Volleyball',
            _volleyballPlayers.length,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(IconData icon, String label, int count) {
    return Tab(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 20),
            const SizedBox(width: 8),
            Text(label),
            if (count > 0)
              Container(
                margin: const EdgeInsets.only(left: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text('$count', style: const TextStyle(fontSize: 12)),
              ),
          ],
        ),
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
                    Icons.people_outline,
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
                        'Follow Your Favorite Players',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1A1A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Get updates on their matches, stats, and news',
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
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
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  tabs: const [
                    Tab(text: '⭐ Featured'),
                    Tab(text: '⚽ Football'),
                    Tab(text: '🏀 Basketball'),
                    Tab(text: '🎾 Tennis'),
                    Tab(text: '🏐 Volleyball'),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildPlayersList(
                  _featuredPlayers,
                  isDesktop: isDesktop,
                  showSportBadge: true,
                ),
                _buildPlayersList(_footballPlayers, isDesktop: isDesktop),
                _buildPlayersList(_basketballPlayers, isDesktop: isDesktop),
                _buildPlayersList(_tennisPlayers, isDesktop: isDesktop),
                _buildPlayersList(_volleyballPlayers, isDesktop: isDesktop),
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
        _buildPlayersGrid(_featuredPlayers, showSportBadge: true),
        _buildPlayersGrid(_footballPlayers),
        _buildPlayersGrid(_basketballPlayers),
        _buildPlayersGrid(_tennisPlayers),
        _buildPlayersGrid(_volleyballPlayers),
      ],
    );
  }

  Widget _buildPlayersList(
    List<Player> players, {
    required bool isDesktop,
    bool showSportBadge = false,
  }) {
    if (players.isEmpty) {
      return _buildEmptyState();
    }

    return GridView.builder(
      padding: const EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isDesktop ? 2 : 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: isDesktop ? 2.8 : 3.2,
      ),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return _buildPlayerCard(players[index], showSportBadge: showSportBadge);
      },
    );
  }

  Widget _buildPlayersGrid(
    List<Player> players, {
    bool showSportBadge = false,
  }) {
    if (players.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: players.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: _buildPlayerCard(
            players[index],
            showSportBadge: showSportBadge,
          ),
        );
      },
    );
  }

  Widget _buildPlayerCard(Player player, {bool showSportBadge = false}) {
    final isFollowing = _followedPlayerIds.contains(player.id);
    final sportColor = _getSportColor(player.sport);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isFollowing ? sportColor : Colors.grey[200]!,
          width: isFollowing ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: isFollowing
                ? sportColor.withOpacity(0.15)
                : Colors.black.withOpacity(0.05),
            blurRadius: isFollowing ? 12 : 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _toggleFollow(player),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Player Avatar
                Stack(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            sportColor.withOpacity(0.2),
                            sportColor.withOpacity(0.1),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: sportColor.withOpacity(0.3)),
                      ),
                      child: Center(
                        child: Text(
                          player.flagEmoji,
                          style: const TextStyle(fontSize: 28),
                        ),
                      ),
                    ),
                    if (player.jerseyNumber != null)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: sportColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '#${player.jerseyNumber}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    if (player.isFeatured)
                      Positioned(
                        top: -4,
                        right: -4,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.amber,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 16),
                // Player Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              player.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isFollowing
                                    ? sportColor
                                    : const Color(0xFF1A1A1A),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (showSportBadge)
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              child: _buildSportBadge(player.sport),
                            ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.sports, size: 14, color: Colors.grey[500]),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Text(
                              player.team,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              player.position,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey[700],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            player.nationality,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                // Follow Button
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  child: isFollowing
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: sportColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.check, color: Colors.white, size: 18),
                              SizedBox(width: 6),
                              Text(
                                'Following',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
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
                            border: Border.all(color: sportColor, width: 1.5),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add, color: sportColor, size: 18),
                              const SizedBox(width: 6),
                              Text(
                                'Follow',
                                style: TextStyle(
                                  color: sportColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                            ],
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

  Widget _buildSportBadge(SportType sport) {
    final color = _getSportColor(sport);
    final icon = _getSportIcon(sport);
    final name = _getSportName(sport);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            name,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
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
            'No players found',
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Following summary
            if (_followedPlayerIds.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: primaryGreen.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primaryGreen.withOpacity(0.2)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.people, color: primaryGreen, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${_followedPlayerIds.length} players selected',
                        style: const TextStyle(
                          color: darkGreen,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      'Final step! 🎉',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
              ),
            Row(
              children: [
                // Skip button
                TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WidgetTree(),
                      ),
                      (route) => false,
                    );
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
                // Finish button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WidgetTree(),
                      ),
                      (route) => false,
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
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _followedPlayerIds.isEmpty
                            ? 'Finish Setup'
                            : 'Finish (${_followedPlayerIds.length})',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.check_circle_outline, size: 20),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper methods
  Color _getSportColor(SportType sport) {
    switch (sport) {
      case SportType.football:
        return primaryGreen;
      case SportType.basketball:
        return Colors.orange[700]!;
      case SportType.tennis:
        return Colors.yellow[800]!;
      case SportType.volleyball:
        return Colors.blue[700]!;
    }
  }

  IconData _getSportIcon(SportType sport) {
    switch (sport) {
      case SportType.football:
        return Icons.sports_soccer;
      case SportType.basketball:
        return Icons.sports_basketball;
      case SportType.tennis:
        return Icons.sports_tennis;
      case SportType.volleyball:
        return Icons.sports_volleyball;
    }
  }

  String _getSportName(SportType sport) {
    switch (sport) {
      case SportType.football:
        return 'Football';
      case SportType.basketball:
        return 'Basketball';
      case SportType.tennis:
        return 'Tennis';
      case SportType.volleyball:
        return 'Volleyball';
    }
  }
}
