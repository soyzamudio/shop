angular.module('app.directives')
.directive 'itemInfo', [ () ->
  restrict: 'E'
  templateUrl: 'app/directives/item-info/item-info.html'
  scope:
    amount: '@'
    icon: '@'
  link: (scope, element, attr) ->
    nFormatter = (num, digits) ->
      si = [
        { value: 1e18, symbol: 'E' }
        { value: 1e15, symbol: 'P' }
        { value: 1e12, symbol: 'T' }
        { value: 1e9, symbol: 'G' }
        { value: 1e6, symbol: 'M' }
        { value: 1e3, symbol: 'k' }
      ]
      for i in si
        if num >= i.value
          return "#{(num / i.value).toFixed(digits).replace(/\.?0+$/, '')}#{i.symbol}"
      num

    scope.$watch ->
      scope.amount = nFormatter scope.amount, 1
]
