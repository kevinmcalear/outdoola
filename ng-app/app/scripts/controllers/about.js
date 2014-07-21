'use strict';

/**
 * @ngdoc function
 * @name outdoolaApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the outdoolaApp
 */
angular.module('outdoolaApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
