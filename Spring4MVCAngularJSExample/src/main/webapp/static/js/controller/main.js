'use strict';

angular.module('myApp').controller('MainController', ['$scope','$location', function($scope,$location) {
    var vm = this;
    vm.navigate = function(param){
    	 switch (param) {
	         case 'display':
	             $location.path("/display");
	             break;
	         case 'report':
	        	 $location.path("/report");
	             break;
	         case 'validate':
	        	 $location.path("/validate");
	             break;
	         default:
	        	 break;
    	 }   
    }
}]);
