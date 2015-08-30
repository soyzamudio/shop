angular.module('app.controllers')
.controller 'AppController', [
  '$rootScope'
  '$scope'
  '$state'
  '$window'
  '$ionicFilterBar'
  'Helper'
  ($rootScope, $scope, $state, $window, $ionicFilterBar, Helper) ->
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
      $rootScope.user = ''
      $window.localStorage.clear()
      $state.go 'login'
      # Helper.createPost
      #   image: 'http://media4.popsugar-assets.com/files/2015/08/11/825/n/24155341/0e4275c5_KIINI_SS.xlarge.jpg'
]
