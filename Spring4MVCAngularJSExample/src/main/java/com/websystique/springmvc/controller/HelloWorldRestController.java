package com.websystique.springmvc.controller;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.websystique.springmvc.model.Reports;
import com.websystique.springmvc.service.ValidationService;
 
/**
 * @author Meena
 *
 */

@RestController
public class HelloWorldRestController {
 
	final static Logger LOG = Logger.getLogger(HelloWorldRestController.class);
    @Autowired private ValidationService validationService;
     
    /**
     * Method: validateRecord
     * 
     * To validate and fetch corrupted records out
     *
     */
    @RequestMapping(value = "/validate/", method = RequestMethod.POST)
    @ResponseBody
    public ResponseEntity<Reports> validateRecord(HttpServletRequest request, HttpServletResponse response,@RequestBody Reports records) {
    	LOG.info("Entry: validateRecords");
        Reports validatedReports = null;
        try{
        	validatedReports = validationService.validate(records);
        }
        catch(Exception e){
        	LOG.error("Error response",e);
        }
        LOG.info("Exit: validateRecords");
        return new ResponseEntity<Reports>(validatedReports, HttpStatus.OK);
    }
}