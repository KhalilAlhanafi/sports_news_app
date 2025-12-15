import 'package:flutter/material.dart';
import 'package:sports_news_app/modules/pages/follow_players_page.dart';

// Sport Type Enum
enum SportType { football, basketball, tennis, volleyball }

// Team Type Enum
enum TeamType { club, national }

// Team Model
class Team {
  final String id;
  final String name;
  final String country;
  final String logoEmoji;
  final TeamType type;
  final SportType sport;
  final String? league;
  final String? conference;
  bool isFollowing;

  Team({
    required this.id,
    required this.name,
    required this.country,
    required this.logoEmoji,
    required this.type,
    required this.sport,
    this.league,
    this.conference,
    this.isFollowing = false,
  });
}

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
    _tabController = TabController(length: 5, vsync: this);
    _initializeTeams();
  }

  void _initializeTeams() {
    _allTeams = [
      // ==================== FOOTBALL TEAMS ====================
      // English Premier League
      Team(
        id: 'man_utd',
        name: 'Manchester United',
        country: 'England',
        logoEmoji: '🔴',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Premier League',
      ),
      Team(
        id: 'man_city',
        name: 'Manchester City',
        country: 'England',
        logoEmoji: '🩵',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Premier League',
      ),
      Team(
        id: 'liverpool',
        name: 'Liverpool',
        country: 'England',
        logoEmoji: '🔴',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Premier League',
      ),
      Team(
        id: 'chelsea',
        name: 'Chelsea',
        country: 'England',
        logoEmoji: '🔵',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Premier League',
      ),
      Team(
        id: 'arsenal',
        name: 'Arsenal',
        country: 'England',
        logoEmoji: '🔴',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Premier League',
      ),
      Team(
        id: 'tottenham',
        name: 'Tottenham Hotspur',
        country: 'England',
        logoEmoji: '⚪',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Premier League',
      ),
      // La Liga
      Team(
        id: 'real_madrid',
        name: 'Real Madrid',
        country: 'Spain',
        logoEmoji: '⚪',
        type: TeamType.club,
        sport: SportType.football,
        league: 'La Liga',
      ),
      Team(
        id: 'barcelona',
        name: 'FC Barcelona',
        country: 'Spain',
        logoEmoji: '🔵🔴',
        type: TeamType.club,
        sport: SportType.football,
        league: 'La Liga',
      ),
      Team(
        id: 'atletico',
        name: 'Atlético Madrid',
        country: 'Spain',
        logoEmoji: '🔴⚪',
        type: TeamType.club,
        sport: SportType.football,
        league: 'La Liga',
      ),
      // Bundesliga
      Team(
        id: 'bayern',
        name: 'Bayern Munich',
        country: 'Germany',
        logoEmoji: '🔴',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Bundesliga',
      ),
      Team(
        id: 'dortmund',
        name: 'Borussia Dortmund',
        country: 'Germany',
        logoEmoji: '🟡',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Bundesliga',
      ),
      Team(
        id: 'rb_leipzig',
        name: 'RB Leipzig',
        country: 'Germany',
        logoEmoji: '🔴⚪',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Bundesliga',
      ),
      // Serie A
      Team(
        id: 'juventus',
        name: 'Juventus',
        country: 'Italy',
        logoEmoji: '⚫⚪',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Serie A',
      ),
      Team(
        id: 'ac_milan',
        name: 'AC Milan',
        country: 'Italy',
        logoEmoji: '🔴⚫',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Serie A',
      ),
      Team(
        id: 'inter',
        name: 'Inter Milan',
        country: 'Italy',
        logoEmoji: '🔵⚫',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Serie A',
      ),
      Team(
        id: 'napoli',
        name: 'Napoli',
        country: 'Italy',
        logoEmoji: '🔵',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Serie A',
      ),
      // Ligue 1
      Team(
        id: 'psg',
        name: 'Paris Saint-Germain',
        country: 'France',
        logoEmoji: '🔵🔴',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Ligue 1',
      ),
      Team(
        id: 'monaco',
        name: 'AS Monaco',
        country: 'France',
        logoEmoji: '🔴⚪',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Ligue 1',
      ),
      // Other Leagues
      Team(
        id: 'ajax',
        name: 'Ajax Amsterdam',
        country: 'Netherlands',
        logoEmoji: '🔴⚪',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Eredivisie',
      ),
      Team(
        id: 'porto',
        name: 'FC Porto',
        country: 'Portugal',
        logoEmoji: '🔵⚪',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Primeira Liga',
      ),
      Team(
        id: 'benfica',
        name: 'Benfica',
        country: 'Portugal',
        logoEmoji: '🔴',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Primeira Liga',
      ),
      // MLS
      Team(
        id: 'inter_miami',
        name: 'Inter Miami',
        country: 'USA',
        logoEmoji: '🩷',
        type: TeamType.club,
        sport: SportType.football,
        league: 'MLS',
      ),
      Team(
        id: 'la_galaxy',
        name: 'LA Galaxy',
        country: 'USA',
        logoEmoji: '🔵🟡',
        type: TeamType.club,
        sport: SportType.football,
        league: 'MLS',
      ),
      // Saudi Pro League
      Team(
        id: 'al_nassr',
        name: 'Al-Nassr',
        country: 'Saudi Arabia',
        logoEmoji: '🟡',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Saudi Pro League',
      ),
      Team(
        id: 'al_hilal',
        name: 'Al-Hilal',
        country: 'Saudi Arabia',
        logoEmoji: '🔵',
        type: TeamType.club,
        sport: SportType.football,
        league: 'Saudi Pro League',
      ),
      // Football National Teams
      Team(
        id: 'brazil_nt',
        name: 'Brazil',
        country: 'South America',
        logoEmoji: '🇧🇷',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'argentina_nt',
        name: 'Argentina',
        country: 'South America',
        logoEmoji: '🇦🇷',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'germany_nt',
        name: 'Germany',
        country: 'Europe',
        logoEmoji: '🇩🇪',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'france_nt',
        name: 'France',
        country: 'Europe',
        logoEmoji: '🇫🇷',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'spain_nt',
        name: 'Spain',
        country: 'Europe',
        logoEmoji: '🇪🇸',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'england_nt',
        name: 'England',
        country: 'Europe',
        logoEmoji: '🏴󠁧󠁢󠁥󠁮󠁧󠁿',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'italy_nt',
        name: 'Italy',
        country: 'Europe',
        logoEmoji: '🇮🇹',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'portugal_nt',
        name: 'Portugal',
        country: 'Europe',
        logoEmoji: '🇵🇹',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'netherlands_nt',
        name: 'Netherlands',
        country: 'Europe',
        logoEmoji: '🇳🇱',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'belgium_nt',
        name: 'Belgium',
        country: 'Europe',
        logoEmoji: '🇧🇪',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'usa_nt',
        name: 'USA',
        country: 'North America',
        logoEmoji: '🇺🇸',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'mexico_nt',
        name: 'Mexico',
        country: 'North America',
        logoEmoji: '🇲🇽',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'japan_nt',
        name: 'Japan',
        country: 'Asia',
        logoEmoji: '🇯🇵',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'south_korea_nt',
        name: 'South Korea',
        country: 'Asia',
        logoEmoji: '🇰🇷',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'syria_nt',
        name: 'Syria',
        country: 'Asia',
        logoEmoji: '🇸🇾',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'palestine_nt',
        name: 'Palestine',
        country: 'Asia',
        logoEmoji: '🇵🇸',
        type: TeamType.national,
        sport: SportType.football,
      ),
      Team(
        id: 'nigeria_nt',
        name: 'Nigeria',
        country: 'Africa',
        logoEmoji: '🇳🇬',
        type: TeamType.national,
        sport: SportType.football,
      ),

      // ==================== BASKETBALL TEAMS ====================
      // NBA - Eastern Conference
      Team(
        id: 'celtics',
        name: 'Boston Celtics',
        country: 'USA',
        logoEmoji: '🍀',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Eastern',
      ),
      Team(
        id: 'nets',
        name: 'Brooklyn Nets',
        country: 'USA',
        logoEmoji: '⚫⚪',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Eastern',
      ),
      Team(
        id: 'knicks',
        name: 'New York Knicks',
        country: 'USA',
        logoEmoji: '🔵🟠',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Eastern',
      ),
      Team(
        id: '76ers',
        name: 'Philadelphia 76ers',
        country: 'USA',
        logoEmoji: '🔵🔴',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Eastern',
      ),
      Team(
        id: 'heat',
        name: 'Miami Heat',
        country: 'USA',
        logoEmoji: '🔥',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Eastern',
      ),
      Team(
        id: 'bucks',
        name: 'Milwaukee Bucks',
        country: 'USA',
        logoEmoji: '🦌',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Eastern',
      ),
      Team(
        id: 'bulls',
        name: 'Chicago Bulls',
        country: 'USA',
        logoEmoji: '🐂',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Eastern',
      ),
      Team(
        id: 'cavaliers',
        name: 'Cleveland Cavaliers',
        country: 'USA',
        logoEmoji: '🍷',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Eastern',
      ),
      // NBA - Western Conference
      Team(
        id: 'lakers',
        name: 'Los Angeles Lakers',
        country: 'USA',
        logoEmoji: '💜💛',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      Team(
        id: 'clippers',
        name: 'LA Clippers',
        country: 'USA',
        logoEmoji: '🔵🔴',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      Team(
        id: 'warriors',
        name: 'Golden State Warriors',
        country: 'USA',
        logoEmoji: '💙💛',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      Team(
        id: 'suns',
        name: 'Phoenix Suns',
        country: 'USA',
        logoEmoji: '☀️',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      Team(
        id: 'mavericks',
        name: 'Dallas Mavericks',
        country: 'USA',
        logoEmoji: '🐴',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      Team(
        id: 'nuggets',
        name: 'Denver Nuggets',
        country: 'USA',
        logoEmoji: '⛏️',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      Team(
        id: 'spurs',
        name: 'San Antonio Spurs',
        country: 'USA',
        logoEmoji: '⚫⚪',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      Team(
        id: 'thunder',
        name: 'Oklahoma City Thunder',
        country: 'USA',
        logoEmoji: '⚡',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      Team(
        id: 'timberwolves',
        name: 'Minnesota Timberwolves',
        country: 'USA',
        logoEmoji: '🐺',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      Team(
        id: 'grizzlies',
        name: 'Memphis Grizzlies',
        country: 'USA',
        logoEmoji: '🐻',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'NBA',
        conference: 'Western',
      ),
      // EuroLeague Teams
      Team(
        id: 'real_madrid_basket',
        name: 'Real Madrid Basketball',
        country: 'Spain',
        logoEmoji: '⚪',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'EuroLeague',
      ),
      Team(
        id: 'barcelona_basket',
        name: 'FC Barcelona Basketball',
        country: 'Spain',
        logoEmoji: '🔵🔴',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'EuroLeague',
      ),
      Team(
        id: 'olympiacos',
        name: 'Olympiacos BC',
        country: 'Greece',
        logoEmoji: '🔴⚪',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'EuroLeague',
      ),
      Team(
        id: 'panathinaikos',
        name: 'Panathinaikos BC',
        country: 'Greece',
        logoEmoji: '💚',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'EuroLeague',
      ),
      Team(
        id: 'fenerbahce_basket',
        name: 'Fenerbahçe Basketball',
        country: 'Turkey',
        logoEmoji: '💙💛',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'EuroLeague',
      ),
      Team(
        id: 'cska_moscow',
        name: 'CSKA Moscow',
        country: 'Russia',
        logoEmoji: '🔴🔵',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'EuroLeague',
      ),
      Team(
        id: 'maccabi_tel_aviv',
        name: 'Maccabi Tel Aviv',
        country: 'Israel',
        logoEmoji: '💛💙',
        type: TeamType.club,
        sport: SportType.basketball,
        league: 'EuroLeague',
      ),
      // Basketball National Teams
      Team(
        id: 'usa_basket_nt',
        name: 'USA Basketball',
        country: 'North America',
        logoEmoji: '🇺🇸',
        type: TeamType.national,
        sport: SportType.basketball,
      ),
      Team(
        id: 'spain_basket_nt',
        name: 'Spain Basketball',
        country: 'Europe',
        logoEmoji: '🇪🇸',
        type: TeamType.national,
        sport: SportType.basketball,
      ),
      Team(
        id: 'france_basket_nt',
        name: 'France Basketball',
        country: 'Europe',
        logoEmoji: '🇫🇷',
        type: TeamType.national,
        sport: SportType.basketball,
      ),
      Team(
        id: 'serbia_basket_nt',
        name: 'Serbia Basketball',
        country: 'Europe',
        logoEmoji: '🇷🇸',
        type: TeamType.national,
        sport: SportType.basketball,
      ),
      Team(
        id: 'germany_basket_nt',
        name: 'Germany Basketball',
        country: 'Europe',
        logoEmoji: '🇩🇪',
        type: TeamType.national,
        sport: SportType.basketball,
      ),
      Team(
        id: 'greece_basket_nt',
        name: 'Greece Basketball',
        country: 'Europe',
        logoEmoji: '🇬🇷',
        type: TeamType.national,
        sport: SportType.basketball,
      ),
      Team(
        id: 'australia_basket_nt',
        name: 'Australia Basketball',
        country: 'Oceania',
        logoEmoji: '🇦🇺',
        type: TeamType.national,
        sport: SportType.basketball,
      ),
      Team(
        id: 'canada_basket_nt',
        name: 'Canada Basketball',
        country: 'North America',
        logoEmoji: '🇨🇦',
        type: TeamType.national,
        sport: SportType.basketball,
      ),
      Team(
        id: 'slovenia_basket_nt',
        name: 'Slovenia Basketball',
        country: 'Europe',
        logoEmoji: '🇸🇮',
        type: TeamType.national,
        sport: SportType.basketball,
      ),

      // ==================== TENNIS TEAMS (Davis Cup / BJK Cup) ====================
      Team(
        id: 'spain_tennis',
        name: 'Spain',
        country: 'Europe',
        logoEmoji: '🇪🇸',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'italy_tennis',
        name: 'Italy',
        country: 'Europe',
        logoEmoji: '🇮🇹',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'usa_tennis',
        name: 'USA',
        country: 'North America',
        logoEmoji: '🇺🇸',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'australia_tennis',
        name: 'Australia',
        country: 'Oceania',
        logoEmoji: '🇦🇺',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'france_tennis',
        name: 'France',
        country: 'Europe',
        logoEmoji: '🇫🇷',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'germany_tennis',
        name: 'Germany',
        country: 'Europe',
        logoEmoji: '🇩🇪',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'great_britain_tennis',
        name: 'Great Britain',
        country: 'Europe',
        logoEmoji: '🇬🇧',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'serbia_tennis',
        name: 'Serbia',
        country: 'Europe',
        logoEmoji: '🇷🇸',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'canada_tennis',
        name: 'Canada',
        country: 'North America',
        logoEmoji: '🇨🇦',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'argentina_tennis',
        name: 'Argentina',
        country: 'South America',
        logoEmoji: '🇦🇷',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'netherlands_tennis',
        name: 'Netherlands',
        country: 'Europe',
        logoEmoji: '🇳🇱',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'czech_tennis',
        name: 'Czech Republic',
        country: 'Europe',
        logoEmoji: '🇨🇿',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'poland_tennis',
        name: 'Poland',
        country: 'Europe',
        logoEmoji: '🇵🇱',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'japan_tennis',
        name: 'Japan',
        country: 'Asia',
        logoEmoji: '🇯🇵',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      Team(
        id: 'china_tennis',
        name: 'China',
        country: 'Asia',
        logoEmoji: '🇨🇳',
        type: TeamType.national,
        sport: SportType.tennis,
        league: 'Davis Cup / BJK Cup',
      ),
      // Laver Cup Teams
      Team(
        id: 'team_europe_tennis',
        name: 'Team Europe',
        country: 'Europe',
        logoEmoji: '🇪🇺',
        type: TeamType.club,
        sport: SportType.tennis,
        league: 'Laver Cup',
      ),
      Team(
        id: 'team_world_tennis',
        name: 'Team World',
        country: 'International',
        logoEmoji: '🌍',
        type: TeamType.club,
        sport: SportType.tennis,
        league: 'Laver Cup',
      ),

      // ==================== VOLLEYBALL TEAMS ====================
      // Italian Serie A
      Team(
        id: 'perugia_volley',
        name: 'Sir Safety Perugia',
        country: 'Italy',
        logoEmoji: '⚫🟡',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Serie A (Italy)',
      ),
      Team(
        id: 'modena_volley',
        name: 'Modena Volley',
        country: 'Italy',
        logoEmoji: '💙💛',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Serie A (Italy)',
      ),
      Team(
        id: 'trentino_volley',
        name: 'Trentino Volley',
        country: 'Italy',
        logoEmoji: '💙💛',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Serie A (Italy)',
      ),
      Team(
        id: 'lube_civitanova',
        name: 'Lube Civitanova',
        country: 'Italy',
        logoEmoji: '🔴⚪',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Serie A (Italy)',
      ),
      Team(
        id: 'milano_volley',
        name: 'Allianz Milano',
        country: 'Italy',
        logoEmoji: '🔵⚪',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Serie A (Italy)',
      ),
      // Polish PlusLiga
      Team(
        id: 'zaksa_kedzierzyn',
        name: 'ZAKSA Kędzierzyn-Koźle',
        country: 'Poland',
        logoEmoji: '🔵🟡',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'PlusLiga (Poland)',
      ),
      Team(
        id: 'jastrzebski_wegiel',
        name: 'Jastrzębski Węgiel',
        country: 'Poland',
        logoEmoji: '🟠⚫',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'PlusLiga (Poland)',
      ),
      Team(
        id: 'resovia',
        name: 'Asseco Resovia',
        country: 'Poland',
        logoEmoji: '🔴⚪',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'PlusLiga (Poland)',
      ),
      Team(
        id: 'skra_belchatow',
        name: 'PGE Skra Bełchatów',
        country: 'Poland',
        logoEmoji: '🟡🔵',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'PlusLiga (Poland)',
      ),
      // Brazilian Superliga
      Team(
        id: 'sada_cruzeiro',
        name: 'Sada Cruzeiro',
        country: 'Brazil',
        logoEmoji: '🔵⚪',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Superliga (Brazil)',
      ),
      Team(
        id: 'minas_volei',
        name: 'Minas Tênis Clube',
        country: 'Brazil',
        logoEmoji: '🟢⚪',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Superliga (Brazil)',
      ),
      Team(
        id: 'funvic_taubate',
        name: 'Funvic Taubaté',
        country: 'Brazil',
        logoEmoji: '🔵🟡',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Superliga (Brazil)',
      ),
      // Turkish League
      Team(
        id: 'vakifbank',
        name: 'VakifBank Istanbul',
        country: 'Turkey',
        logoEmoji: '🟡',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Sultanlar Ligi (Turkey)',
      ),
      Team(
        id: 'eczacibasi',
        name: 'Eczacıbaşı Istanbul',
        country: 'Turkey',
        logoEmoji: '🔴',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Sultanlar Ligi (Turkey)',
      ),
      Team(
        id: 'fenerbahce_volley',
        name: 'Fenerbahçe Volleyball',
        country: 'Turkey',
        logoEmoji: '💙💛',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'Efeler Ligi (Turkey)',
      ),
      // Japanese V.League
      Team(
        id: 'suntory_sunbirds',
        name: 'Suntory Sunbirds',
        country: 'Japan',
        logoEmoji: '🔴',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'V.League (Japan)',
      ),
      Team(
        id: 'panasonic_panthers',
        name: 'Panasonic Panthers',
        country: 'Japan',
        logoEmoji: '🔵',
        type: TeamType.club,
        sport: SportType.volleyball,
        league: 'V.League (Japan)',
      ),
      // Volleyball National Teams
      Team(
        id: 'poland_volley_nt',
        name: 'Poland Volleyball',
        country: 'Europe',
        logoEmoji: '🇵🇱',
        type: TeamType.national,
        sport: SportType.volleyball,
      ),
      Team(
        id: 'italy_volley_nt',
        name: 'Italy Volleyball',
        country: 'Europe',
        logoEmoji: '🇮🇹',
        type: TeamType.national,
        sport: SportType.volleyball,
      ),
      Team(
        id: 'brazil_volley_nt',
        name: 'Brazil Volleyball',
        country: 'South America',
        logoEmoji: '🇧🇷',
        type: TeamType.national,
        sport: SportType.volleyball,
      ),
      Team(
        id: 'usa_volley_nt',
        name: 'USA Volleyball',
        country: 'North America',
        logoEmoji: '🇺🇸',
        type: TeamType.national,
        sport: SportType.volleyball,
      ),
      Team(
        id: 'france_volley_nt',
        name: 'France Volleyball',
        country: 'Europe',
        logoEmoji: '🇫🇷',
        type: TeamType.national,
        sport: SportType.volleyball,
      ),
      Team(
        id: 'japan_volley_nt',
        name: 'Japan Volleyball',
        country: 'Asia',
        logoEmoji: '🇯🇵',
        type: TeamType.national,
        sport: SportType.volleyball,
      ),
      Team(
        id: 'serbia_volley_nt',
        name: 'Serbia Volleyball',
        country: 'Europe',
        logoEmoji: '🇷🇸',
        type: TeamType.national,
        sport: SportType.volleyball,
      ),
      Team(
        id: 'china_volley_nt',
        name: 'China Volleyball',
        country: 'Asia',
        logoEmoji: '🇨🇳',
        type: TeamType.national,
        sport: SportType.volleyball,
      ),
      Team(
        id: 'turkey_volley_nt',
        name: 'Turkey Volleyball',
        country: 'Europe',
        logoEmoji: '🇹🇷',
        type: TeamType.national,
        sport: SportType.volleyball,
      ),
      Team(
        id: 'slovenia_volley_nt',
        name: 'Slovenia Volleyball',
        country: 'Europe',
        logoEmoji: '🇸🇮',
        type: TeamType.national,
        sport: SportType.volleyball,
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
              false) ||
          team.sport.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  List<Team> get _footballTeams =>
      _filteredTeams.where((t) => t.sport == SportType.football).toList();

  List<Team> get _basketballTeams =>
      _filteredTeams.where((t) => t.sport == SportType.basketball).toList();

  List<Team> get _tennisTeams =>
      _filteredTeams.where((t) => t.sport == SportType.tennis).toList();

  List<Team> get _volleyballTeams =>
      _filteredTeams.where((t) => t.sport == SportType.volleyball).toList();

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
                _buildProgressItem('Follow Teams', false, 3, isActive: true),
                _buildProgressItem('Follow Players', false, 4),
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
                  _footballTeams
                      .where((t) => _followedTeamIds.contains(t.id))
                      .length,
                  _footballTeams.length,
                  _getSportColor(SportType.football),
                ),
                _buildSportStatRow(
                  Icons.sports_basketball,
                  'Basketball',
                  _basketballTeams
                      .where((t) => _followedTeamIds.contains(t.id))
                      .length,
                  _basketballTeams.length,
                  _getSportColor(SportType.basketball),
                ),
                _buildSportStatRow(
                  Icons.sports_tennis,
                  'Tennis',
                  _tennisTeams
                      .where((t) => _followedTeamIds.contains(t.id))
                      .length,
                  _tennisTeams.length,
                  _getSportColor(SportType.tennis),
                ),
                _buildSportStatRow(
                  Icons.sports_volleyball,
                  'Volleyball',
                  _volleyballTeams
                      .where((t) => _followedTeamIds.contains(t.id))
                      .length,
                  _volleyballTeams.length,
                  _getSportColor(SportType.volleyball),
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
            child: _buildTabContent(),
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
        Expanded(child: _buildTabContent()),
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
                      'Follow Teams',
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
              _showSuccessDialog();
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
        isScrollable: true,
        labelStyle: const TextStyle(fontWeight: FontWeight.w600),
        tabAlignment: TabAlignment.start,
        tabs: [
          _buildTabItem(Icons.sports, 'All', _filteredTeams.length),
          _buildTabItem(Icons.sports_soccer, 'Football', _footballTeams.length),
          _buildTabItem(
            Icons.sports_basketball,
            'Basketball',
            _basketballTeams.length,
          ),
          _buildTabItem(Icons.sports_tennis, 'Tennis', _tennisTeams.length),
          _buildTabItem(
            Icons.sports_volleyball,
            'Volleyball',
            _volleyballTeams.length,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem(IconData icon, String label, int count) {
    return Tab(
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
                        'Select teams from any sport to get personalized updates',
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
                    Tab(text: 'All'),
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
                _buildTeamsList(_filteredTeams, isDesktop: isDesktop),
                _buildTeamsList(_footballTeams, isDesktop: isDesktop),
                _buildTeamsList(_basketballTeams, isDesktop: isDesktop),
                _buildTeamsList(_tennisTeams, isDesktop: isDesktop),
                _buildTeamsList(_volleyballTeams, isDesktop: isDesktop),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return TabBarView(
      controller: _tabController,
      children: [
        _buildTeamsGrid(_filteredTeams),
        _buildTeamsGrid(_footballTeams),
        _buildTeamsGrid(_basketballTeams),
        _buildTeamsGrid(_tennisTeams),
        _buildTeamsGrid(_volleyballTeams),
      ],
    );
  }

  Widget _buildTeamsList(List<Team> teams, {required bool isDesktop}) {
    if (teams.isEmpty) {
      return _buildEmptyState();
    }

    // Group teams by league/country
    Map<String, List<Team>> groupedTeams = {};
    for (var team in teams) {
      String key = team.league ?? team.country;
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
                      color: _getSportColor(
                        groupTeams.first.sport,
                      ).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _getSportIcon(groupTeams.first.sport),
                          size: 16,
                          color: _getSportColor(groupTeams.first.sport),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          groupName,
                          style: TextStyle(
                            color: _getSportColor(groupTeams.first.sport),
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
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
                  return SizedBox(width: 340, child: _buildTeamCard(team));
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

  Widget _buildTeamsGrid(List<Team> teams) {
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
    final sportColor = _getSportColor(team.sport);

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
                    color: sportColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: sportColor.withOpacity(0.3)),
                  ),
                  child: Center(
                    child: team.type == TeamType.national
                        ? Text(
                            team.logoEmoji,
                            style: const TextStyle(fontSize: 28),
                          )
                        : Text(
                            team.logoEmoji,
                            style: const TextStyle(fontSize: 24),
                          ),
                  ),
                ),
                const SizedBox(width: 16),
                // Team Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              team.name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isFollowing
                                    ? sportColor
                                    : const Color(0xFF1A1A1A),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildSportBadge(team.sport),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            team.type == TeamType.club
                                ? Icons.location_on_outlined
                                : Icons.public,
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
                              margin: const EdgeInsets.symmetric(horizontal: 8),
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
                        ],
                      ),
                      if (team.conference != null) ...[
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${team.conference} Conference',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ],
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.all(24),
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
            const SizedBox(height: 16),
            // Sport breakdown
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildFollowingSummaryRow(
                    Icons.sports_soccer,
                    'Football',
                    _footballTeams
                        .where((t) => _followedTeamIds.contains(t.id))
                        .length,
                    _getSportColor(SportType.football),
                  ),
                  _buildFollowingSummaryRow(
                    Icons.sports_basketball,
                    'Basketball',
                    _basketballTeams
                        .where((t) => _followedTeamIds.contains(t.id))
                        .length,
                    _getSportColor(SportType.basketball),
                  ),
                  _buildFollowingSummaryRow(
                    Icons.sports_tennis,
                    'Tennis',
                    _tennisTeams
                        .where((t) => _followedTeamIds.contains(t.id))
                        .length,
                    _getSportColor(SportType.tennis),
                  ),
                  _buildFollowingSummaryRow(
                    Icons.sports_volleyball,
                    'Volleyball',
                    _volleyballTeams
                        .where((t) => _followedTeamIds.contains(t.id))
                        .length,
                    _getSportColor(SportType.volleyball),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigate to follow players page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FollowPlayersPage(),
                    ),
                  );
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

  Widget _buildFollowingSummaryRow(
    IconData icon,
    String sport,
    int count,
    Color color,
  ) {
    if (count == 0) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 12),
          Text(sport, style: const TextStyle(fontWeight: FontWeight.w500)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '$count',
              style: TextStyle(color: color, fontWeight: FontWeight.w600),
            ),
          ),
        ],
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
