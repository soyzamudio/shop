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
          User.login user
            .then (response) ->
              login response
        when 'register'
          User.signup user
            .then (response) ->
              login response

    $scope.registerOrLogin = ->
      switch $scope.state
        when 'login' then $state.go 'register'
        when 'register' then $state.go 'login'

    login = (response) ->
      $rootScope.showBar = true
      $rootScope.user = response.data.user
      $window.localStorage.token = JSON.stringify response.data.token
      $state.go('friends');
]
