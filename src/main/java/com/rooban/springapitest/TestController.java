package com.rooban.springapitest;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping
public class TestController {

    @GetMapping("/env")
    public ResponseEntity getEnv(){
        Map<String, String> output = new HashMap<>();
        System.getenv().forEach((k,v) -> {
            output.put(k,v);
        });
        return ResponseEntity.ok(output);
    }

    @GetMapping("/api")
    public ResponseEntity getApi(){
        Map<String, String> output = new HashMap<>();
        output.put("token", "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c");
        return ResponseEntity.ok(output);
    }
}
