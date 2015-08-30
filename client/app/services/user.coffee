angular.module('app.services')
.factory 'User', [ '$http', 'myConfig', 'envService', ($http, myConfig, envService) ->
  url = envService.read('apiUrl')

  getUser: (payload) ->
    $http.get "#{url}/user",
      params:
        payload

  createUser: (payload) ->
    $http.post "#{url}/user", payload
]
