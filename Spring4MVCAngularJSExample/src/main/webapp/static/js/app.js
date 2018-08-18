'use strict';

var app = angular.module('myApp', ['ngRoute']);

app.config(function ($routeProvider) {
     
    $routeProvider.when('/', {
        templateUrl: 'index.jsp',
        controller: 'MainController'
    }).when('/report', {
        templateUrl: './static/views/report.jsp',
        controller: 'ReportController'
    }).when('/display', {
        templateUrl: './static/views/display.jsp',
        controller: 'DisplayController'
    }).otherwise({
        redirectTo: "/"
    });
});


