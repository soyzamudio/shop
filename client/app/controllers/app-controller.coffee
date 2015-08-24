angular.module('app.controllers')
.controller 'AppController', [ '$scope', '$state', ($scope, $state) ->
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

]
