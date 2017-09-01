package com.remarkgroup.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.remarkgroup.model.User;
import com.remarkgroup.service.UserService;

@Controller
public class UploadController {
	
	@Autowired
	private UserService userService;
	
	private final Logger logger = LoggerFactory.getLogger(UploadController.class);

    //Save the uploaded file to this folder
    private static String UPLOADED_FOLDER = "C://temp//";
    
    @PostMapping(path="/visit/upload")
    public String uploadFile(@RequestParam("file") MultipartFile uploadfile, HttpServletRequest request) {

        logger.debug("Single file upload!");

        if (uploadfile.isEmpty()) {
            request.setAttribute("message", "Please select a file!");
            return "settings";
        }

        try {

        	readFiles(Arrays.asList(uploadfile));

        } catch (IOException e) {
        	request.setAttribute("message", HttpStatus.BAD_REQUEST);
            return "settings";
        }

        return "settings";

    }
    
    public ResponseEntity<?> uploadFileExample(@RequestParam("file") MultipartFile uploadfile) {

        logger.debug("Single file upload!");

        if (uploadfile.isEmpty()) {
            return new ResponseEntity("please select a file!", HttpStatus.OK);
        }

        try {

            saveUploadedFiles(Arrays.asList(uploadfile));

        } catch (IOException e) {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }

        return new ResponseEntity("Successfully uploaded - " + uploadfile.getOriginalFilename(), new HttpHeaders(), HttpStatus.OK);

    }
    
    //save file
    private void saveUploadedFiles(List<MultipartFile> files) throws IOException {

        for (MultipartFile file : files) {

            if (file.isEmpty()) {
                continue; //next pls
            }

            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);
        }
    }
    
    private void readFiles(List<MultipartFile> files) throws IOException {
    	
    	for (MultipartFile file : files) {
    		if (file.isEmpty()) {
    			continue; //next pls
    		}

    		byte[] bytes = file.getBytes();
    		String name;
    		String email;
    		List<User> userList = new ArrayList<User>();
    		userList.clear();

    		InputStream is = new ByteArrayInputStream(bytes);
    		JSONParser parser = new JSONParser();
    		try {
    			JSONObject json = (JSONObject) parser.parse(new InputStreamReader(is));
    			is.close();
    			JSONArray users = (JSONArray) json.get("users");
    			if (users != null) {
    				for (Object object : users) {
    					JSONObject jsonObj = (JSONObject) object;
    					name = (String) jsonObj.get("fullName");
    					email = (String) jsonObj.get("email");
    					User u = new User(name, email);
    					userList.add(u);
    				}
    			}
    		} catch (ParseException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		
    		//call method to save the users
    		if (!userList.isEmpty()) {
    			userService.saveAll(userList);	
    		}        	
    	}
    }

}
