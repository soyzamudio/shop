angular.module('app.services')
.factory 'User', [
  '$http'
  '$auth'
  'myConfig'
  'envService'
  ($http, $auth, myConfig, envService) ->
    url = envService.read('apiUrl')
    login: (user) ->
      $auth.login user

    signup: (user) ->
      $auth.signup user
]
