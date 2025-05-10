package comm.service;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.PutObjectRequest;
import comm.control.ConfigUtil;

import java.io.File;

public class S3Uploader {

    private final AmazonS3 s3Client;
    private final String bucketName;

    public S3Uploader() {
        String accessKeyId = ConfigUtil.get("aws.accessKeyId");
        String secretAccessKey = ConfigUtil.get("aws.secretAccessKey");
        String region = ConfigUtil.get("aws.region");
        this.bucketName = ConfigUtil.get("aws.bucket");

        BasicAWSCredentials awsCreds = new BasicAWSCredentials(accessKeyId, secretAccessKey);
        this.s3Client = AmazonS3ClientBuilder.standard()
            .withRegion(region)
            .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
            .build();
    }

    public String uploadFile(File file, String fileName) {
        String fileUrl = "https://" + bucketName + ".s3.amazonaws.com/" + fileName;
        s3Client.putObject(new PutObjectRequest(bucketName, fileName, file));
        return fileUrl;
    }
}
