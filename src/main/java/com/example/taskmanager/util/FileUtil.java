package com.example.taskmanager.util;

import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@UtilityClass
public class FileUtil {
    private static final String UPLOAD_DIR = "data/";


    @SneakyThrows
    public ResponseEntity<?> getOutputFile(String filename, String subDir) {
        Path path = Paths.get(UPLOAD_DIR, subDir, filename);

        try {
            if (!Files.exists(path)) {
                return ResponseEntity.status(HttpStatus.NO_CONTENT).body("Файл не найден");
            }

            byte[] fileBytes = Files.readAllBytes(path);
            Resource resource = new ByteArrayResource(fileBytes);

            String mimeType = Files.probeContentType(path);
            MediaType mediaType = (mimeType != null) ? MediaType.parseMediaType(mimeType) : MediaType.APPLICATION_OCTET_STREAM;

            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + filename + "\"")
                    .contentLength(resource.contentLength())
                    .contentType(mediaType)
                    .body(resource);

        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Ошибка при чтении файла");
        }
    }


}
