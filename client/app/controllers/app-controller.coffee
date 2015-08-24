angular.module('app.controllers')
.controller 'AppController', [
  '$scope'
  '$state'
  '$ionicFilterBar'
  ($scope, $state, $ionicFilterBar) ->
    $scope.showBar = true
    $scope.filterBarInstance = null
    if $state.current.name is 'login'
      $scope.showBar = false
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

    $scope.showFilterBar = () ->
      filterBarInstance = $ionicFilterBar.show
        items: $scope.items
        update: (filteredItems, filterText) ->
          $scope.items = filteredItems
]
