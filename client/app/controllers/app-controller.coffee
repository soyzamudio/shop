angular.module('app.controllers')
.controller 'AppController', [
  '$rootScope'
  '$scope'
  '$state'
  '$window'
  '$auth'
  '$ionicFilterBar'
  'Helper'
  ($rootScope, $scope, $state, $window, $auth, $ionicFilterBar, Helper) ->
    $rootScope.showBar = true
    $scope.filterBarInstance = null
    $scope.menu = [
      'friends'
      'world'
      'curated'
      'favorites'
      'mine'
    ]
    $scope.selected = 0
    $scope.select = (index, link) ->
      $scope.selected = index
      $state.go(link)

    getItems = ->
      items = []
      items.push {text: "This is item number #{x}"} for x in [0..100]
      $scope.items = items

    getItems()

    $scope.showFilterBar = ->
      filterBarInstance = $ionicFilterBar.show
        items: $scope.items
        update: (filteredItems, filterText) ->
          $scope.items = filteredItems

    $scope.logout = ->
      $auth.logout()
      $rootScope.user = ''
      $window.localStorage.clear()
      $rootScope.showBar = false
      $state.go 'login'
]
