'use strict';

angular.module('myApp').controller('DisplayController', ['$scope', function($scope) {
	$scope.fileDataObj = {};
	$scope.isValid = true;
	$scope.setName = function(element) {
		$scope.$apply(function($scope) {
			$scope.file = element.files[0];
		});
	}
	$scope.uploadFile = function() {
		var validFormats = ['csv'];
		if ($scope.fileContent) {
			$scope.reports = $scope.processData($scope.fileContent);
		}
		var value = $scope.file.name;
		var ext = value.substring(value.lastIndexOf('.') + 1).toLowerCase();   

        $scope.isValid = (validFormats.indexOf(ext) !== -1);
        if ($scope.fileContentXML) {
			$scope.fileDataObj = $scope.processDataXML($scope.fileContentXML);

			$scope.fileData = JSON.stringify($scope.fileDataObj);
			$scope.filsejson = JSON.parse($scope.fileData);
		}
	}
	$scope.processDataXML = function(xml_data) {
		var x2js = new X2JS(); 
		var aftCnv = x2js.xml_str2json(xml_data); 
		return aftCnv; 
	}

	$scope.processData = function(csv_data) {
		var record = csv_data.split(/\r\n\\|\n/); 		
		var headers = record[0].split(',');
		var records = [];
		for (var i = 1; i < record.length; i++) {
			var obj = {};
			var data = record[i].split(',');
			if (data.length == headers.length) {

				obj.firstName = data[0];
				obj.lastName = data[1];
				obj.issueCount = data[2];
				obj.dob = data[3];

				records.push(obj);			
			}
		}			
		return records;
	}
}]);

app.directive('fileReaderDirective', function() {
	return {
		restrict: "A",
		scope: {
			fileReaderDirective: "=",
		},
		link: function(scope, element) {
			$(element).on('change', function(changeEvent) {
				var files = changeEvent.target.files;
				if (files.length) {
					var r = new FileReader();
					r.onload = function(e) {
						var contents = e.target.result;
						scope.$apply(function() {
							scope.fileReaderDirective = contents;
						});
					};
					r.readAsText(files[0]);
				}
			});
		}
	};
});