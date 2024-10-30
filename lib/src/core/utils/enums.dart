enum AppLocalRoute {
  splash('/'),
  login('/login_page'),
  home('/home_page'),
  ;

  final String route;

  const AppLocalRoute(this.route);
}

enum ApiRoute {
  users('/users'),
  ;

  final String route;

  const ApiRoute(this.route);
}

enum DeviceScreenType { mobile, tablet }
