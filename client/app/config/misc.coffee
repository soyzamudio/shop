angular.module('app')
.config [
  '$stateProvider'
  '$urlRouterProvider'
  '$authProvider'
  '$ionicConfigProvider'
  'envServiceProvider'
  'myConfig'
  ($stateProvider, $urlRouterProvider, $authProvider, $ionicConfigProvider, envServiceProvider, myConfig) ->
    $authProvider.loginUrl = "#{myConfig.devApiUrl}/auth/login"
    $authProvider.signupUrl = "#{myConfig.devApiUrl}/auth/signup"

    $ionicConfigProvider.views.transition 'none'
    $urlRouterProvider.otherwise 'friends'
    $stateProvider
    .state 'root',
      url: ''
      controller: 'RootCtrl'
      data:
        authenticate: false
    .state 'login',
      url: '/login'
      templateUrl: 'app/modules/pages/login/login.html'
      controller: 'LoginCtrl'
    .state 'register',
      url: '/login'
      templateUrl: 'app/modules/pages/login/login.html'
      controller: 'LoginCtrl'
    .state 'friends',
      url: '/friends'
      templateUrl: 'app/modules/pages/friends/friends.html'
      controller: 'FriendsCtrl'
    .state 'world',
      url: '/world'
      templateUrl: 'app/modules/pages/world/world.html'
      controller: 'WorldCtrl'
    .state 'curated',
      url: '/curated'
      templateUrl: 'app/modules/pages/curated/curated.html'
      controller: 'CuratedCtrl'
    .state 'favorites',
      url: '/favorites'
      templateUrl: 'app/modules/pages/favorites/favorites.html'
      controller: 'FavoritesCtrl'
    .state 'mine',
      url: '/mine'
      templateUrl: 'app/modules/pages/mine/mine.html'
      controller: 'MineCtrl'

    # envServiceProvider.set('production')

    envServiceProvider.config
      domains:
        development: [myConfig.devApiUrl]
        production: [myConfig.prodApiUrl]
      vars:
        development:
          apiUrl: myConfig.devApiUrl
        production:
          apiUrl: myConfig.prodApiUrl

    envServiceProvider.check()
]

angular.module('app')
.controller 'RootCtrl', [ '$rootScope', '$state', ($rootScope, $state) ->
  $state.go 'friends'
]
