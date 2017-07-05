package com.aws.controller;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.Bucket;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
public class S3Controller {
    @RequestMapping("/h")
    public String hello(){
        AmazonS3Client client = new AmazonS3Client();
        List<Bucket> buckets = client.listBuckets();
        String bucketNames = buckets.stream().map(Bucket::getName)
                .collect(Collectors.joining("\n"));
        return bucketNames;
    }
}
