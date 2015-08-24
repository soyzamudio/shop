angular.module('app.services')
.factory 'Post', [ '$http', ($http) ->
  getFriendsPosts: ->
    $http.get 'http://localhost:5000/post/friends'

  getWorldPosts: ->
    $http.get 'http://localhost:5000/post/world'

  getCuratedPosts: ->
    $http.get 'http://localhost:5000/post/curated'

  createPost: (payload) ->
    $http.post 'http://localhost:5000/post', payload
]
