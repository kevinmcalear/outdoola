'use strict';

/**
 * @ngdoc function
 * @name outdoolaApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the outdoolaApp
 */
angular.module('outdoolaApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
