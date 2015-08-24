angular.module('app.services')
.factory 'Post', [ '$http', 'myConfig', ($http, myConfig) ->
  getFriendsPosts: ->
    $http.get "#{myConfig.apiUrl}/post/friends"

  getWorldPosts: ->
    $http.get "#{myConfig.apiUrl}/post/world"

  getCuratedPosts: ->
    $http.get "#{myConfig.apiUrl}/post/curated"

  createPost: (payload) ->
    $http.post "#{myConfig.apiUrl}/post/", payload
]
