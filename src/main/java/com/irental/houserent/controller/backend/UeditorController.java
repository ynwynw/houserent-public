package com.irental.houserent.controller.backend;

import com.irental.houserent.common.util.FileUtil;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/*
 * 百度富文本编辑器
 * */
@RestController
@RequestMapping("/api/ueditor")
public class UeditorController {
    /**
     * 获取Ueditor的配置文件
     *
     * @return
     */
    @GetMapping("/config")
    public String getConfig() {
        return "{\n" +
                "        \"imageActionName\": \"uploadimage\",\n" +
                "            \"imageFieldName\": \"file\",\n" +
                "            \"imageMaxSize\": 2048000,\n" +
                "            \"imageAllowFiles\": [\".png\", \".jpg\", \".jpeg\", \".gif\", \".bmp\"],\n" +
                "        \"imageCompressEnable\": true,\n" +
                "            \"imageCompressBorder\": 1600,\n" +
                "            \"imageInsertAlign\": \"none\",\n" +
                "            \"imageUrlPrefix\": \"\",\n" +
                "            \"imagePathFormat\": \"/ueditor/jsp/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}\",\n" +
                "\n" +
                "        /* 上传文件配置 */\n" +
                "        \"fileActionName\": \"uploadfile\",\n" +
                "            \"fileFieldName\": \"file\",\n" +
                "            \"filePathFormat\": \"/ueditor/jsp/upload/file/{yyyy}{mm}{dd}/{time}{rand:6}\",\n" +
                "            \"fileUrlPrefix\": \"\",\n" +
                "            \"fileMaxSize\": 51200000,\n" +
                "            \"fileAllowFiles\": [\n" +
                "        \".png\", \".jpg\", \".jpeg\", \".gif\", \".bmp\",\n" +
                "                \".flv\", \".swf\", \".mkv\", \".avi\", \".rm\", \".rmvb\", \".mpeg\", \".mpg\",\n" +
                "                \".ogg\", \".ogv\", \".mov\", \".wmv\", \".mp4\", \".webm\", \".mp3\", \".wav\", \".mid\",\n" +
                "                \".rar\", \".zip\", \".tar\", \".gz\", \".7z\", \".bz2\", \".cab\", \".iso\",\n" +
                "                \".doc\", \".docx\", \".xls\", \".xlsx\", \".ppt\", \".pptx\", \".pdf\", \".txt\", \".md\", \".xml\"]\n" +
                "    }";
    }

    /**
     * Ueditor上传文件
     * 这里以上传图片为例，图片上传后，imgPath将存储图片的保存路径，返回到编辑器中做展示
     *
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public String upload(@RequestParam("file") MultipartFile file) {
        String result = "";
        if (!file.isEmpty()) {
            String originalFileName = file.getOriginalFilename();

            // 这里写你的文件上传逻辑
            // String imgPath = fileUtil.uploadImg(file);

            String imgPath = null;
            try {
                imgPath = FileUtil.upload(file).get("filePath");
            } catch (Exception e) {
                e.printStackTrace();
            }
            result = "{\n" +
                    "    \"state\": \"SUCCESS\",\n" +
                    "    \"url\": \"" + imgPath + "\",\n" +
                    "    \"title\": \"" + originalFileName + "\",\n" +
                    "    \"original\": \"" + originalFileName + "\"\n" +
                    "}";
        }
        return result;
    }


}