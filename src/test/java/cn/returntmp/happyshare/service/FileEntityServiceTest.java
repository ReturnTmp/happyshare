package cn.returntmp.happyshare.service;

import cn.returntmp.happyshare.base.BaseServiceTest;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.jupiter.api.Assertions.assertEquals;

class FileEntityServiceTest extends BaseServiceTest {

    private final String fileUrl = "localhost/upload/file/123.jpg";
    private final String filePath = "upload/file/123.jpg";
    private final String md5Value = "md5Value";
    private final long createdBy = 1L;
    private final long fileSize = 1024L;
    private final String fileType = "jpg";

    @Autowired
    private HappyshareFileService happyshareFileService;

    @BeforeEach
    void setUp() {
        happyshareFileService.insertHappyshareFile(fileUrl, filePath, md5Value, createdBy, fileSize, fileType);
    }

    @Test
    @DisplayName("通过md5获取文件访问链接")
    void getFileUrlByMd5() {
        String fileUrlByMd5 = happyshareFileService.getFileUrlByMd5(md5Value, createdBy, fileType);
        assertEquals(fileUrl, fileUrlByMd5);
    }

    @Test
    @DisplayName("插入文件对象")
    void insertHappyshareFile() {
        int i = happyshareFileService.insertHappyshareFile(fileUrl, filePath, md5Value, createdBy, fileSize, fileType);
        assertEquals(1, i);
    }
}
