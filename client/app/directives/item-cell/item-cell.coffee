angular.module('app.directives')
.directive 'itemCell', [ () ->
  restrict: 'E'
  templateUrl: 'app/directives/item-cell/item-cell.html'
  scope:
    item: '='
  link: (scope, element, attr) ->
]
