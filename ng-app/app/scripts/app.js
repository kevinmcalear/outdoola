'use strict';

/**
 * @ngdoc overview
 * @name outdoolaApp
 * @description
 * # outdoolaApp
 *
 * Main module of the application.
 */
// angular.module('mgo-angular-wizard', []);

angular
  .module('outdoolaApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'mgo-angular-wizard'
  ])

  .config(function ($routeProvider) {
    $routeProvider
      .when('/', {
        templateUrl: 'views/main.html',
        controller: 'MainCtrl'
      })
      .when('/login', {
        templateUrl: 'views/login.html',
        controller: 'MainCtrl'
      })
      .when('/new-adventure', {
        templateUrl: 'views/adventures/new.html',
        controller: 'MainCtrl'
      })
      .when('/about', {
        templateUrl: 'views/about.html',
        controller: 'AboutCtrl'
      })
      .otherwise({
        redirectTo: '/'
      });
  });
