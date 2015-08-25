angular.module('app.services')
.factory 'Helper', [ 'Post', (Post) ->
  getFriendsPosts: ->
    Post.getFriendsPosts().then (res) ->
      items = res.data.posts
      items.forEach (e) ->
        e['user'] =
          name: 'ShopStyle'
          image: 'http://resources.shopstyle.com/8b55D4F8E8/im/default-profile-icon.png'
      items

  getWorldPosts: ->
    Post.getWorldPosts().then (res) ->
      items = res.data.posts
      items.forEach (e) ->
        e['user'] =
          name: 'ShopStyle'
          image: 'http://resources.shopstyle.com/8b55D4F8E8/im/default-profile-icon.png'
      items

  getCuratedPosts: ->
    Post.getWorldPosts().then (res) ->
      items = res.data.posts
      items.forEach (e) ->
        e['user'] =
          name: 'ShopStyle'
          image: 'http://resources.shopstyle.com/8b55D4F8E8/im/default-profile-icon.png'
      items

  createPost: (payload) ->
    console.log payload
    # Post.createPost(payload)
]
