angular.module('app.services')
.factory 'Post', [ '$http', 'myConfig', 'envService', ($http, myConfig, envService) ->
  url = envService.read('apiUrl')

  getFriendsPosts: ->
    $http.get "#{url}/post/friends"

  getWorldPosts: ->
    $http.get "#{url}/post/world"

  getCuratedPosts: ->
    $http.get "#{url}/post/curated"

  createPost: (payload) ->
    $http.post "#{url}/post/", payload
]
