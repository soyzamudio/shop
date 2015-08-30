angular.module('app')
.controller 'LoginCtrl', [
  '$rootScope'
  '$scope'
  '$state'
  '$window'
  'User'
  ($rootScope, $scope, $state, $window, User) ->
    $rootScope.showBar = false
    $scope.state = $state.current.name

    $scope.userAuthentication = (user) ->
      switch $scope.state
        when 'login'
          User.getUser user
            .then (response) ->
              login response
        when 'register'
          User.createUser user
            .then (response) ->
              login response

    $scope.registerOrLogin = ->
      switch $scope.state
        when 'login' then $state.go 'register'
        when 'register' then $state.go 'login'

    login = (response) ->
      $rootScope.showBar = true
      $window.localStorage.user = JSON.stringify response.data.user
      $rootScope.user = response.data.user
      $state.go('friends');
]
