angular.module('app')
.run [ '$rootScope', '$state', '$ionicPlatform', ($rootScope, $state, $ionicPlatform) ->
  $ionicPlatform.ready ->
    if window.cordova and window.cordova.plugins.Keyboard
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar true
      cordova.plugins.Keyboard.disableScroll true
    if window.StatusBar
      StatusBar.styleDefault()
  if not $rootScope.user then $state.go 'login' else $state.go 'root'
]
