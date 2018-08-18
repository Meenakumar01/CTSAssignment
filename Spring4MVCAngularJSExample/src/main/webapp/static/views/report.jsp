<div class="generic-container" ng-controller="ReportController as ctrl">
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="lead">Read Customer Statements</span>
		</div>
		<div class="formcontainer">
			<form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
				<div class="row">
					<div class="form-group col-md-12">
						<label class="col-md-2 control-label" for="file">Select
							File from computer</label>
						<div class="col-md-7">
							<input type="file" data-file-read-directive="fileContent"
								ng-model="file"
								onchange="angular.element(this).scope().setName(this)"
								class="form-control input-sm" />
							<div class="has-error" ng-show="isValid && isError">
								<span>File format not accepted. </span>
							</div>
						</div>
						<button type="button" class="btn btn-primary"
							ng-click="uploadFile()">Upload</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="has-error" ng-hide="isValid">Incorrect File</div>
	<div class="panel panel-default" ng-show="reports.length>=1 && isValid">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="lead">List of Records </span>
		</div>
		<div class="tablecontainer">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Reference</th>
						<th>Account Number</th>
						<th>Starting Balance</th>
						<th>Mutation</th>
						<th>Description</th>
						<th>Ending Balance</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="r in reports track by $index">
						<td><span ng-bind="r.reference"></span></td>
						<td><span ng-bind="r.accountNumber"></span></td>
						<td><span ng-bind="r.startBalance"></span></td>
						<td><span ng-bind="r.mutation"></span></td>
						<td><span ng-bind="r.description"></span></td>
						<td><span ng-bind="r.endBalance"></span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<button type="button" class="btn btn-primary floatRight"
		ng-show="reports.length>1 && isValid" ng-click=validateRecords()>Validate</button>
	<div class="issues" ng-show="issues.length==0">No Issues in the
		records</div>
	<div class="panel panel-default issues"
		ng-show="issues.length>=1 && isValid">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<span class="lead">List of Issues </span>
		</div>
		<div class="tablecontainer">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Reference</th>
						<th>Description</th>
					</tr>
				</thead>
				<tbody>
					<tr ng-repeat="r in issues track by $index">
						<td><span ng-bind="r.reference"></span></td>
						<td><span ng-bind="r.description"></span></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>