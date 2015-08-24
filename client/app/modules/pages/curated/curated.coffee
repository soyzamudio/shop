angular.module('app')
.controller 'CuratedCtrl', [ '$scope', 'Helper', ($scope, Helper) ->
  Helper.getCuratedPosts().then (res) ->
    $scope.items = res

  $scope.doRefresh = ->
    Helper.getCuratedPosts()
    .then (res) ->
      $scope.items = res
      $scope.$broadcast 'scroll.refreshComplete'
]
