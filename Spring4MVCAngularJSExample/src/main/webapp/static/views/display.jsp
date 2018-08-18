<div class="generic-container" ng-controller="DisplayController as ctrl">
		<div class="panel panel-default">
			<div class="panel-heading">
				<span class="lead">Read Customer Statements</span>
			</div>
			<div class="formcontainer">
				<form ng-submit="ctrl.submit()" name="myForm"
					class="form-horizontal"><div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-2 control-label" for="file">Select File from computer</label>
							<div class="col-md-7">
								<input type = "file" data-file-reader-directive="fileContent" ng-model="file" onchange="angular.element(this).scope().setName(this)"
								accept=".csv" class="form-control input-sm"/>
							</div>
							<button class="btn btn-primary" ng-click="uploadFile()">Upload</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<div class="has-error" ng-hide="isValid">Incorrect File</div>
		
		<div class="panel panel-default" ng-show="reports.length>1 && isValid">
			<!-- Default panel contents -->
			<div class="panel-heading">
				<span class="lead">List of Records </span>
			</div>
			<div class="tablecontainer">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>First Name</th>
							<th>Surname</th>
							<th>Issue Count</th>
							<th>DOB</th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="r in reports track by $index">
							<td><span ng-bind="r.firstName"></span></td>
							<td><span ng-bind="r.lastName"></span></td>
							<td><span ng-bind="r.issueCount"></span></td>
							<td><span ng-bind="r.dob | date "></span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>