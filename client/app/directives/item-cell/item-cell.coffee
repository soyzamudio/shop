angular.module('app.directives')
.directive 'itemCell', [ () ->
  restrict: 'E'
  replace: true
  templateUrl: 'app/directives/item-cell/item-cell.html'
  scope:
    item: '='
  link: (scope, element, attr) ->
]
