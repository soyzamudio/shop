angular.module('app')
.controller 'FriendsCtrl', [ '$scope', '$state', 'Helper', ($scope, $state, Helper) ->

  Helper.getFriendsPosts().then (res) ->
    $scope.items = res

  $scope.doRefresh = ->
    Helper.getFriendsPosts()
    .then (res) ->
      $scope.items = res
      $scope.$broadcast 'scroll.refreshComplete'
]
