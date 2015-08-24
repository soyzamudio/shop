angular.module('app.services', []);

angular.module('app.directives', []);

angular.module('app.filters', []);

angular.module('app.components', []);

angular.module('app.controllers', []);

angular.module('app.pages', []);

angular.module('app', ['ionic', 'ui.router', 'app.services', 'app.controllers', 'app.directives', 'app.filters', 'app.components', 'app.pages']);

angular.module('app').run(['$rootScope', function($rootScope) {}]);



angular.module('app').config([
  '$stateProvider', '$urlRouterProvider', '$ionicConfigProvider', function($stateProvider, $urlRouterProvider, $ionicConfigProvider) {
    $ionicConfigProvider.views.transition('none');
    $urlRouterProvider.otherwise('friends');
    return $stateProvider.state('root', {
      url: '',
      controller: 'RootCtrl',
      data: {
        authenticate: false
      }
    }).state('friends', {
      url: '/friends',
      templateUrl: 'app/modules/pages/friends/friends.html',
      controller: 'FriendsCtrl'
    }).state('world', {
      url: '/world',
      templateUrl: 'app/modules/pages/world/world.html',
      controller: 'WorldCtrl'
    }).state('curated', {
      url: '/curated',
      templateUrl: 'app/modules/pages/curated/curated.html',
      controller: 'CuratedCtrl'
    }).state('favorites', {
      url: '/favorites',
      templateUrl: 'app/modules/pages/favorites/favorites.html',
      controller: 'FavoritesCtrl'
    }).state('mine', {
      url: '/mine',
      templateUrl: 'app/modules/pages/mine/mine.html',
      controller: 'MineCtrl'
    });
  }
]);

angular.module('app').controller('RootCtrl', [
  '$state', function($state) {
    return $state.go('friends');
  }
]);

angular.module('app.controllers').controller('AppController', [
  '$scope', '$state', function($scope, $state) {
    $scope.menu = ['friends', 'world', 'curated', 'favorites', 'mine'];
    $scope.selected = 0;
    return $scope.select = function(index, link) {
      $scope.selected = index;
      return $state.go(link);
    };
  }
]);

angular.module('app.services').factory('Helper', [
  'Post', function(Post) {
    return {
      getFriendsPosts: function() {
        return Post.getPosts().then(function(res) {
          var items;
          items = res.data.posts;
          items.forEach(function(e) {
            return e['user'] = {
              name: 'ShopStyle',
              image: 'http://resources.shopstyle.com/8b55D4F8E8/im/default-profile-icon.png'
            };
          });
          return items;
        });
      }
    };
  }
]);

angular.module('app.services').factory('Post', [
  '$http', function($http) {
    return {
      getPosts: function() {
        return $http.get('http://localhost:5000/post');
      },
      createPost: function(payload) {
        return $http.post('http://localhost:5000/post', payload);
      }
    };
  }
]);

angular.module('app.directives').directive('itemCell', [
  function() {
    return {
      restrict: 'E',
      replace: true,
      templateUrl: 'app/directives/item-cell/item-cell.html',
      scope: {
        item: '='
      },
      link: function(scope, element, attr) {}
    };
  }
]);

angular.module('app').controller('CuratedCtrl', ['$scope', '$state', function($scope, $state) {}]);

angular.module('app').controller('FavoritesCtrl', ['$scope', '$state', function($scope, $state) {}]);

angular.module('app').controller('FriendsCtrl', [
  '$scope', '$state', 'Helper', function($scope, $state, Helper) {
    Helper.getFriendsPosts().then(function(res) {
      return $scope.items = res;
    });
    return $scope.doRefresh = function() {
      return Helper.getFriendsPosts().then(function(res) {
        $scope.items = res;
        return $scope.$broadcast('scroll.refreshComplete');
      });
    };
  }
]);

angular.module('app').controller('MineCtrl', ['$scope', '$state', function($scope, $state) {}]);

angular.module('app').controller('WorldCtrl', ['$scope', '$state', function($scope, $state) {}]);
