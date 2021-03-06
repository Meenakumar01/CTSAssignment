'use strict';

angular.module('myApp').factory('ReportService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8080/Spring4MVCAngularJSExample/validate/';

    var factory = {
        validateRecords: validateRecords
    };

    return factory;

    function validateRecords(reports) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, reports)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while validating Records');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

}]);
