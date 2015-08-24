angular.module('app.services')
.factory 'Post', [ '$http', ($http) ->
  getPosts: ->
    $http.get 'http://localhost:5000/post'

  createPost: (payload) ->
    $http.post 'http://localhost:5000/post', payload
]
