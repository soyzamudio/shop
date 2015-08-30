angular.module('app')
.controller 'FriendsCtrl', [
  '$rootScope'
  '$scope'
  '$state'
  'Helper'
  ($rootScope, $scope, $state, Helper) ->
    Helper.getFriendsPosts().then (res) ->
      $scope.items = res

    $scope.doRefresh = ->
      Helper.getFriendsPosts()
      .then (res) ->
        $scope.items = res
        $scope.$broadcast 'scroll.refreshComplete'
]
