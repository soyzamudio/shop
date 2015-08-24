angular.module('app')
.controller 'WorldCtrl', [ '$scope', 'Helper', ($scope, Helper) ->
  Helper.getWorldPosts().then (res) ->
    $scope.items = res

  $scope.doRefresh = ->
    Helper.getWorldPosts()
    .then (res) ->
      $scope.items = res
      $scope.$broadcast 'scroll.refreshComplete'
]
