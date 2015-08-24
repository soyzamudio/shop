angular.module('app.controllers')
.controller 'AppController', [ '$scope', '$state', ($scope, $state) ->
  $scope.showBar = true
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

]
