package com.websystique.springmvc.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import com.websystique.springmvc.model.Record;
import com.websystique.springmvc.model.Reports;

@Service("validationService")
public class ValidationServiceImpl implements ValidationService{

	@Override
	public Reports validate(Reports reports) {
		Reports report = new Reports();
		List<Record> record = new ArrayList<Record>();
		Record issues = null;
		List<Record> checkRecords = reports.getRecords();
		for(int i=0;i<checkRecords.size();i++){
			int id = checkRecords.get(i).getReference();
			for(int j=i+1;j<checkRecords.size();j++){
				int tempId = checkRecords.get(j).getReference();
				float sBal = checkRecords.get(j).getStartBalance();
				float eBal = checkRecords.get(j).getEndBalance();
				float mutation = checkRecords.get(j).getMutation();
				if(id == tempId || Float.compare((float) (Math.round((sBal+mutation)*100.0)/100.0), eBal) != 0){
					issues = new Record();
					issues.setReference(tempId);
					issues.setDescription(checkRecords.get(j).getDescription());
					record.add(issues);
					checkRecords.remove(j);							
				}
			}
		}
		report.setRecords(record);
		return report;
	}
	

}
