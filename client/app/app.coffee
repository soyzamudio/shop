angular.module 'app.services', []
angular.module 'app.directives', []
angular.module 'app.filters', []
angular.module 'app.components', []
angular.module 'app.controllers', []
angular.module 'app.pages', []
angular.module 'app', [
  # Angular modules
  'ionic'
  'ui.router'
  'ngCordova'
  'jett.ionic.filter.bar'
  'environment'

  # Our container modules
  'app.services'
  'app.controllers'
  'app.directives'
  'app.filters'
  'app.components'
  'app.pages'
]
