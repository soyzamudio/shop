angular.module('app.directives')
.directive 'itemMessage', [ () ->
  restrict: 'E'
  templateUrl: 'app/directives/item-message/item-message.html'
  scope:
    message: '@'
    user: '='
  link: (scope, element, attr) ->
    console.log scope
]
