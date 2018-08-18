'use strict';

angular.module('myApp').controller('ReportController', ['$scope', 'ReportService', function($scope, ReportService) {
	$scope.fileDataObj = {};
	$scope.isValid = true;
	$scope.setName = function(element) {
		$scope.$apply(function($scope) {
			$scope.file = element.files[0];
		});
		}
	$scope.uploadFile = function() {
		var validFormats = ['csv','xml'];

		var value = $scope.file.name;
		var ext = value.substring(value.lastIndexOf('.') + 1).toLowerCase();   

		$scope.isValid = validFormats.indexOf(ext) !== -1;
		if (ext == 'csv') {
			$scope.reports = $scope.processData($scope.fileContent);
		}
		if (ext == 'xml' ) {
			$scope.records = $scope.processDataXML($scope.fileContent);
			$scope.fileData = JSON.stringify($scope.records);
			$scope.filejson = JSON.parse($scope.fileData);
			var statements = $scope.filejson.records.record;
			var records = [];
			for (var i = 0; i < statements.length; i++) {
				var obj = {};

				obj.reference = statements[i]._reference;
				obj.accountNumber = statements[i].accountNumber;
				obj.startBalance = statements[i].startBalance;
				obj.mutation = statements[i].mutation;
				obj.description = statements[i].description;
				obj.endBalance = statements[i].endBalance;
				records.push(obj);			


			}
			$scope.reports = records;

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

				obj.reference = data[0];
				obj.accountNumber = data[1];				
				obj.description = data[2];
				obj.startBalance = data[3];
				obj.mutation = data[4];
				obj.endBalance = data[5];
				records.push(obj);			
			}

		}
		return records;
	}
	$scope.validateRecords = function(){
		$scope.records = {
				records : $scope.reports
		};
		
		ReportService.validateRecords($scope.records)
		.then(
				function(d) {
					$scope.issues = d.records;
				},
				function(errResponse){
					console.error('Error while fetching Users');
				}
		)};
}]);

app.directive('fileReadDirective', function() {
	return {
		restrict: "A",
		scope: {
			fileReadDirective: "=",
		},
		link: function(scope, element) {
			$(element).on('change', function(changeEvent) {
				var files = changeEvent.target.files;
				if (files.length) {
					var r = new FileReader();
					r.onload = function(e) {
						var contents = e.target.result;
						scope.$apply(function() {
							scope.fileReadDirective = contents;
						});
					};
					r.readAsText(files[0]);
				}
			});
		}
	};
});