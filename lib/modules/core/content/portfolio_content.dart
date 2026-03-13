import '../models/experience_item.dart';
import '../models/project_item.dart';
import '../models/skill_item.dart';
import '../models/social_link.dart';

/// Single source of truth for all portfolio data.
/// Widgets are purely presentational — they receive data from here.
abstract final class PortfolioContent {
  // ── Identity ────────────────────────────────────────────────────────────────

  static const String fullName = 'Onesimo "Simo" Nyathi';
  static const String brandName = 'SIMO\nNYATHI';
  static const String heroTitle = 'Onesimo "Simo" Nyathi';
  static const String heroSubTitle =
      'Staff Mobile Engineer 👨🏾‍💻| Problem Solver 💡| Amateur Farmer 👨🏽‍🌾 | Dog Person 🐕‍🦺🦮| Seeker of Knowledge 📖📚| #BornToLead';
  static const String splashLine = 'Simo, to the world!';

  // ── Contact ─────────────────────────────────────────────────────────────────

  static const String location = 'Johannesburg, SA';
  static const String primaryEmail = 'simonyathi1@gmail.com';
  static const String businessEmail = 'onesimonyathi@fidelitech.co.za';
  static const String phone = '(+27) 78 071 2536';
  static const String footerCopyright = '© 2026. Onesimo Nyathi, by FideliTech';

  /// Pre-composed contact block for use in const contexts.
  static const String contactDetails = 'Johannesburg, SA\n'
      'simonyathi1@gmail.com\n'
      '(+27) 73 071 2536';

  // ── Biography ────────────────────────────────────────────────────────────────

  static const String biography =
      'My name is Onesimo Nyathi — though most people call me Simo (it saves time 😄).'
      '\n\nI am a Staff Mobile Engineer with 9+ years of experience working on '
      'large-scale Android, Flutter, Kotlin & Compose Multiplatform applications in the banking, fintech and health & Fitness '
      'sectors — environments where reliability isn’t a “nice-to-have,” but fundamental.'

      '\n\nI endeavour to build systems people trust.'

      '\n\nBy day, I work in the payments space at YOCO, designing and contributing to '
      'secure, reliable mobile payment platforms. Over the years, I’ve grown from writing features to thinking in systems:'
      '\n\n▪️How does this scale?'
      '\n▪️What fails first?'
      '\n▪️How do we reduce cognitive load for the next engineer?'
      '\n▪️How do we design this so it survives growth?'

      '\n\nI have developed a keen interest in architecture — modular systems, clean boundaries, deterministic state management, '
      'and long-term maintainability. I enjoy solving hard technical problems.'
      '\n\nBut I am not just technical.'
      "\nI am fascinated by people, their brilliance, their quirks, their stories, and their victories and triumphs. It's as St Augustine of Hippo said, "
      "'And men go abroad to admire the heights of mountains, the mighty waves of the sea, the broad tides of rivers, "
      "the compass of the ocean, and the circuits of the stars, yet pass over the mystery of themselves without any wonder'"

      '\n\nI’ve learned that strong architecture is only half the equation — strong relationships are the other half. '
      'I invest in understanding teammates, stakeholders, and managers so that collaboration becomes natural. '
      'Former teams are always willing to work with me again. That says more than any bullet point ever could.'

      '\n\nOutside of engineering, I live on agricultural land raising chickens, rabbits, and a fluffy pack of Rotties🐕‍🦺 (just 5 😅). '
      'On weekends I trade Kotlin for soil (👈🏾classic chat GPT line 🤣). Farming constantly reminds me that systems thinking isn’t just theoretical:'
      '\n\n▪️Inputs matter.'
      '\n▪️Timing matters.'
      '\n▪️Feedback loops matter.'
      '\n▪️Neglect compounds.'
      '\n▪️Patience yields results.'
      ''
      '\n\nThe same applies to software.'
      '\n\nI work hard. I demand a lot from myself. I give my best consistently — not loudly, '
      'but deliberately — in the belief that excellence compounds over time.'
      '\n\nI enjoy intelligent conversations, that\'s why you might find me talking alone from time to time 😅. I enjoy a good laugh. I’m light-hearted, '
      'but serious about impact. A joy to manage, and just as much a joy to follow when someone needs a leader.'
      '\n\nIf you enjoy talking architecture, payments, platform design, leadership, or even agriculture — let’s connect!'
      '\n\n— Simo'
      "\n\n** PS: Same goes to you if you're hiring 😉.";

  static const String services =
      'Payment Platform Engineering\nSDK & Platform Architecture\nCross-Platform Systems (Android + Flutter)';

  // ── Stats ────────────────────────────────────────────────────────────────────

  static const String yearsOfExperience = '9+';
  static const String companiesWorkedFor = '7';
  static const String corporateProjects = '10+';

  // ── Skills ───────────────────────────────────────────────────────────────────

  static const List<SkillItem> skills = [
    SkillItem(
        imageAsset: 'assets/images/logo/android-logo-selected.png',
        name: 'Android',
        level: 92),
    SkillItem(
        imageAsset: 'assets/images/logo/kotlin-logo.png',
        name: 'Kotlin',
        level: 85),
    SkillItem(
        imageAsset: 'assets/images/logo/flutter.png',
        name: 'Flutter',
        level: 86),
    SkillItem(
        imageAsset: 'assets/images/logo/Architecture.png',
        name: 'Architecture',
        level: 82),
    SkillItem(
        imageAsset: 'assets/images/logo/critical_thinking.png',
        name: 'Critical Thinking',
        level: 90),
  ];

  // ── Education & Experience ────────────────────────────────────────────────────

  static const List<ExperienceItem> education = [
    ExperienceItem(
        role: 'High School Matriculation',
        organisation: 'Veritas College, Springs'),
    ExperienceItem(
        role: 'BSc Computer Science & IT',
        organisation: 'UKZN, Pietermaritzburg'),
    ExperienceItem(
        role: 'BScHons Computer Science',
        organisation: 'UKZN, Pietermaritzburg'),
  ];

  static const List<ExperienceItem> experience2017 = [
    ExperienceItem(
        role: 'Intern – Associate level Developer',
        organisation: 'Reverside Consulting'),
    ExperienceItem(
        role: 'Junior Android Developer', organisation: 'ABSA – (Reverside)'),
  ];

  static const List<ExperienceItem> experience2019 = [
    ExperienceItem(
        role: 'Junior – Intermediate Android Developer',
        organisation: 'DVT – Consulting'),
    ExperienceItem(
        role: 'Junior Android Developer', organisation: 'Mukuru – (DVT)'),
    ExperienceItem(
        role: 'Intermediate Android Developer',
        organisation: 'Standard Bank – (DVT)'),
    ExperienceItem(
        role: 'Intermediate Android Developer', organisation: 'ABSA – (DVT)'),
  ];

  static const List<ExperienceItem> experience2021 = [
    ExperienceItem(
        role: 'Senior Android Developer',
        organisation: 'Cruze Control – Consulting'),
    ExperienceItem(
        role: 'Senior Android Developer',
        organisation: 'Discovery – Vitality Global – (Cruze Control)'),
    ExperienceItem(
        role: 'Senior Android Developer',
        organisation: 'Discovery – Vitality Global – Permanent'),
  ];

  static const List<ExperienceItem> experience2024 = [
    ExperienceItem(
        role: 'Senior Android Engineer – Payments', organisation: 'YOCO'),
  ];

  // ── Projects & PDP ───────────────────────────────────────────────────────────

  static const String _yocoDetail = '''
  At YOCO I work as a Staff Android Engineer within the payments platform team, contributing to the design and delivery of mobile payment infrastructure used on the YOCO Card machines.

  The core challenge of this role is reliability: payment systems must be deterministic. A transaction either succeeds or it fails — and both outcomes must be handled with precision. 
  My work spans the full transaction lifecycle, from the moment a user initiates a payment through to confirmation, failure recovery, and retry coordination.

  Key architectural focus areas include:

  1) Transaction Flow Reliability.
  Designing and reinforcing the sequencing of payment state transitions to ensure consistency,
   even under adverse network conditions or device interruptions.

  2) SDK Abstraction Layers.
  Contributing to the design of modular SDK boundaries that separate payment concerns from presentation logic, enabling safe iteration without destabilising core payment flows.

  3) Exceptional User Experience.
  Bringing the cutting edge features to life, for the pure benefit of our merchants and their customers' experience during payments.

  This role has taught me self-leadership. As an individual contributor Staff Engineer, we lead by leading ourselves. It teaches you how to lead without leading.''';

  static const String _discoveryDetail = '''
  At Discovery Vitality Global I worked across two phases: an initial L3 Production Support and Team leadership phase, followed by a focused Kotlin SDK engineering phase within a cross-functional mobile team of seniors.

  Phase 1 — Support & Leadership (2021 – 2022):
  I was a Dev Lead, operating as the 2IC to the Dev Manager for the L3 development team. The team comprised of 6 Senior (2 Mobile, and 4 Java) and 2 Junior Developers. I ran Scrum ceremonies, managed team capacity alongside the Dev Manager. Offered status updates to internal and external stakeholders.
  I also initiated and built an internal Flutter desktop tool — the Vitality ZoolBox — to reduce manual effort and human error in the Maintenance and Support team. 

  Phase 2 — Health SDK Engineering (2023 – 2024):
  I moved to a new team focused on the Health SDK: a modular Kotlin library centralising the core fitness-event processing function consumed by multiple market applications across Vitality Global's product suite.

  Architectural responsibilities included:
  - Modularising shared SDK components to improve maintainability and reduce coupling across product teams
  - Separating business logic from presentation concerns to enable safe, independent iteration
  - Designing and building a Flutter bridge library that enabled the native Android and iOS SDKs to communicate with Flutter-based applications — eliminating the need to rewrite native logic in Dart
  - Participating in architectural design decisions and influencing the team's direction across 8+ engineers

  This role established me as an SME on the Android SDK and exposed me to the iOS Swift counterpart through the bridge-building process. It was the role that transitioned me from feature-focused engineering into architecture-oriented platform thinking.''';

  static const String _bankingDetail = '''
  My enterprise banking experience spans two of South Africa's largest financial institutions — Standard Bank and ABSA — where I worked as a consultant embedded within their core mobile banking teams.

  Standard Bank (2019 – June 2020):
  Worked on the Standard Bank mobile app, implementing the DebiCheck feature — a new debit order authentication mechanism regulated by PASA. This required precise adherence to compliance constraints while delivering production-quality features within an Agile team. I adopted MVVM, Jetpack Navigation, LiveData, Kotlin, Dagger, and Retrofit as part of a broader Jetpack standardisation effort across the app.

  ABSA (2017 & 2018 via Reverside | 2020 & 2021 via DVT):
  I contributed to the ABSA mobile app across two separate consulting engagements spanning both the Reverside and DVT periods. 
  During the 2018 ABSA rebrand, I implemented redesigned features and UI components. In the later engagement, I continued front-end Android development using the single-activity architecture and Jetpack components.

  Key lessons from enterprise banking:
  - Architectural consistency is the foundation of team-scale delivery. MVVM standardisation reduced cognitive load and improved review velocity.
  - Compliance constraints shape architecture — features cannot simply be shipped; they must be auditable and verifiable.
  - Code review culture is a first-class engineering practice, not an afterthought.
  - Dependency injection (Dagger) at scale requires disciplined module boundaries from the start.

  These engagements established the architectural discipline and production rigour that I carry into every role today.''';

  static const List<ProjectItem> projects = [
    ProjectItem(
      imageAsset: 'assets/images/icons/WORK.png',
      title: 'YOCO',
      projectName: 'Payment Platform Engineering',
      projectSummary:
          'Designing secure, reliable, and extensible mobile payment systems at YOCO. Focus on transaction lifecycle, SDK abstraction, and failure-state resilience in a high-availability payments environment.',
      projectDetail: _yocoDetail,
    ),
    ProjectItem(
      imageAsset: 'assets/images/icons/PDP2.png',
      title: 'Discovery',
      projectName: 'Modular Health SDK – Vitality Global',
      projectSummary:
          'Reusable SDK supporting multiple product integrations across a cross-functional team of 8+ engineers. Focused on modular architecture, Flutter–Native bridge engineering, and platform-wide maintainability.',
      projectDetail: _discoveryDetail,
    ),
    ProjectItem(
      imageAsset: 'assets/images/icons/STARTUP.png',
      title: 'Banking',
      projectName: 'Enterprise Banking – ABSA & Standard Bank',
      projectSummary:
          'Production-grade mobile banking feature delivery at two of South Africa\'s largest financial institutions, under compliance constraints and within large-scale Agile teams.',
      projectDetail: _bankingDetail,
    ),
  ];

  // ── Social Links ──────────────────────────────────────────────────────────────

  static const List<SocialLink> socialLinks = [
    SocialLink(
      imageAsset: 'assets/images/icons/linked_in.png',
      url: 'https://www.linkedin.com/in/onesimo-nyathi-877723a9/',
      label: 'LinkedIn',
    ),
    SocialLink(
      imageAsset: 'assets/images/icons/icons8-twitter-96.png',
      url: 'https://twitter.com/SimoNyathi',
      label: 'Twitter',
    ),
    SocialLink(
      imageAsset: 'assets/images/icons/icons8-at-sign-96.png',
      url: 'mailto:$primaryEmail',
      label: 'Email',
    ),
  ];
}
