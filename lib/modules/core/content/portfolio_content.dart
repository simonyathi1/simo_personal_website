import '../models/experience_item.dart';
import '../models/skill_item.dart';
import '../models/social_link.dart';

/// Single source of truth for all portfolio data.
/// Widgets are purely presentational — they receive data from here.
abstract final class PortfolioContent {
  // ── Identity ────────────────────────────────────────────────────────────────

  static const String fullName    = 'Onesimo Nyathi';
  static const String brandName   = 'SIMO\nNYATHI';
  static const String heroTitle   =
      'Onesimo Nyathi\nSnr. Android & Flutter Developer\n& aspiring Software Solutions Architect';
  static const String splashLine  = 'Simo, to the world!';

  // ── Contact ─────────────────────────────────────────────────────────────────

  static const String location        = 'Johannesburg, SA';
  static const String primaryEmail    = 'simonyathi1@gmail.com';
  static const String businessEmail   = 'onesimonyathi@fidelitech.co.za';
  static const String phone           = '(+27) 73 071 2536';
  static const String footerCopyright = '© 2024. Onesimo Nyathi, by FideliTech';

  /// Pre-composed contact block for use in const contexts.
  static const String contactDetails =
      'Johannesburg, SA\n'
      'simonyathi1@gmail.com\n'
      '(+27) 73 071 2536';

  // ── Biography ────────────────────────────────────────────────────────────────

  static const String biography =
      'I get paid to solve problems using various Mobile Application development tools. '
      'I am a very driven and ambitious person with an exceptional love for learning, '
      'growth, and continuous improvement';

  static const String services =
      'Android Development\nFlutter Development\nMobile Architect';

  // ── Stats ────────────────────────────────────────────────────────────────────

  static const String yearsOfExperience = '7+';
  static const String companiesWorkedFor = '4';
  static const String corporateProjects  = '8';

  // ── Skills ───────────────────────────────────────────────────────────────────

  static const List<SkillItem> skills = [
    SkillItem(imageAsset: 'images/logo/android-logo-selected.png', name: 'Android',      level: 89),
    SkillItem(imageAsset: 'images/logo/kotlin-logo.png',           name: 'Kotlin',       level: 85),
    SkillItem(imageAsset: 'images/logo/flutter.png',               name: 'Flutter',      level: 86),
    SkillItem(imageAsset: 'images/logo/Java-logo.png',             name: 'Java',         level: 83),
    SkillItem(imageAsset: 'images/logo/Architecture.png',          name: 'Architecture', level: 45),
  ];

  // ── Education & Experience ────────────────────────────────────────────────────

  static const List<ExperienceItem> education = [
    ExperienceItem(role: 'High School Matriculation',  organisation: 'Veritas College, Springs'),
    ExperienceItem(role: 'BSc Computer Science & IT',  organisation: 'UKZN, Pietermaritzburg'),
    ExperienceItem(role: 'BScHons Computer Science',   organisation: 'UKZN, Pietermaritzburg'),
  ];

  static const List<ExperienceItem> experience2017 = [
    ExperienceItem(role: 'Intern – Associate level Developer', organisation: 'Reverside Consulting'),
    ExperienceItem(role: 'Junior Android Developer',           organisation: 'ABSA – (Reverside)'),
  ];

  static const List<ExperienceItem> experience2019 = [
    ExperienceItem(role: 'Junior – Intermediate Android Developer', organisation: 'DVT – Consulting'),
    ExperienceItem(role: 'Junior Android Developer',                organisation: 'Mukuru – (DVT)'),
    ExperienceItem(role: 'Intermediate Android Developer',          organisation: 'Standard Bank – (DVT)'),
    ExperienceItem(role: 'Intermediate Android Developer',          organisation: 'ABSA – (DVT)'),
  ];

  static const List<ExperienceItem> experience2021 = [
    ExperienceItem(role: 'Senior Android Developer', organisation: 'Cruze Control – Consulting'),
    ExperienceItem(role: 'Senior Android Developer', organisation: 'Discovery – Vitality Global – (Cruze Control)'),
    ExperienceItem(role: 'Senior Android Developer', organisation: 'Discovery – Vitality Global – Permanent'),
  ];

  // ── Social Links ──────────────────────────────────────────────────────────────

  static const List<SocialLink> socialLinks = [
    SocialLink(
      imageAsset: 'images/icons/icons8-twitter-96.png',
      url: 'https://twitter.com/SimoNyathi',
      label: 'Twitter',
    ),
    SocialLink(
      imageAsset: 'images/icons/icons8-facebook-96.png',
      url: 'https://facebook.com/',
      label: 'Facebook',
    ),
    SocialLink(
      imageAsset: 'images/icons/icons8-at-sign-96.png',
      url: 'mailto:$primaryEmail',
      label: 'Email',
    ),
    SocialLink(
      imageAsset: 'images/icons/icons8-google-96.png',
      url: 'https://google.com/',
      label: 'Google',
    ),
  ];
}
