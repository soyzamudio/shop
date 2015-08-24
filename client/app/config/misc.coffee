angular.module('app')
.config [
  '$stateProvider'
  '$urlRouterProvider'
  '$ionicConfigProvider'
  ($stateProvider, $urlRouterProvider, $ionicConfigProvider) ->
    $ionicConfigProvider.views.transition('none');
    $urlRouterProvider.otherwise 'friends'

    $stateProvider
    .state 'root',
      url: ''
      controller: 'RootCtrl'
      data:
        authenticate: false
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
]

angular.module('app')
.controller 'RootCtrl', [ '$state', ($state) ->
  $state.go 'friends'
]
