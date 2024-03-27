package cn.returntmp.happyshare;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

public class FilePrefixProcessTests {
    public static void main(String[] args) {
        String projectBase = System.getProperty("user.dir");
        // 处理 entity
        //String sourceFolder = projectBase + "\\src\\main\\java\\com\\rymcu\\happyshare\\entity";
        // 处理 mapper
        String sourceFolder = projectBase + "\\src\\main\\java\\mapper";
        String destinationFolder = sourceFolder + "-new";

        File sourceDir = new File(sourceFolder);
        File destDir = new File(destinationFolder);

        // 创建目标文件夹
        if (!destDir.exists()) {
            destDir.mkdirs();
        }

        // 定义替换映射关系的 Map
        Map<String, String> replaceMap = new HashMap<>();
        // 自行修改数据表名
        replaceMap.put("happyshare_article", "system_article");
        replaceMap.put("happyshare_article_content", "system_article_content");
        replaceMap.put("happyshare_article_thumbs_up", "system_article_thumbs_up");
        replaceMap.put("happyshare_bank", "infra_bank");
        replaceMap.put("happyshare_bank_account", "infra_bank_account");
        replaceMap.put("happyshare_comment", "system_comment");
        replaceMap.put("happyshare_currency_issue", "infra_currency_issue");
        replaceMap.put("happyshare_currency_rule", "infra_currency_rule");
        replaceMap.put("happyshare_follow", "system_follow");
        replaceMap.put("happyshare_notification", "system_notification");
        replaceMap.put("happyshare_portfolio", "system_portfolio");
        replaceMap.put("happyshare_portfolio_article", "system_portfolio_article");
        replaceMap.put("happyshare_role", "system_role");
        replaceMap.put("happyshare_sponsor", "system_sponsor");
        replaceMap.put("happyshare_tag", "system_tag");
        replaceMap.put("happyshare_tag_article", "system_tag_article");
        replaceMap.put("happyshare_topic", "system_topic");
        replaceMap.put("happyshare_topic_tag", "system_topic_tag");
        replaceMap.put("happyshare_transaction_record", "system_transaction_record");
        replaceMap.put("happyshare_user", "system_user");
        replaceMap.put("happyshare_user_extend", "system_user_extend");
        replaceMap.put("happyshare_user_role", "system_user_role");
        replaceMap.put("happyshare_user_tag", "system_user_tag");
        replaceMap.put("happyshare_visit", "system_visit");
        replaceMap.put("happyshare_lucene_user_dic", "system_lucene_user_dic");
        replaceMap.put("happyshare_file", "infra_file");
        replaceMap.put("happyshare_login_record", "system_login_record");
        replaceMap.put("happyshare_product", "system_product");
        replaceMap.put("happyshare_product_content", "system_product_content");


        // 获取源文件夹下的所有文件和文件夹
        File[] files = sourceDir.listFiles();

        if (files != null) {
            for (File file : files) {
                try {
                    processFile(file, destDir, replaceMap);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        } else {
            System.out.println("No files found in the source folder.");
        }
    }

    private static void processFile(File file, File destDir, Map<String, String> replaceMap) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line;
        StringBuilder content = new StringBuilder();

        // 逐行读取文件内容并进行处理
        while ((line = reader.readLine()) != null) {
            // 判断当前行是否包含 "cn.returntmp.happyshare"，如果包含则不进行替换
            if (line.contains("cn.returntmp.happyshare")) {
                content.append(line).append("\n");
            } else {
                // 使用替换映射关系的 Map 进行替换
                for (Map.Entry<String, String> entry : replaceMap.entrySet()) {
                    String originalValue = entry.getKey();
                    String replacedValue = entry.getValue();
                    line = line.replace(originalValue, replacedValue);
                }
                content.append(line).append("\n");
            }
        }
        reader.close();

        // 创建目标文件并写入处理后的内容
        String destFilePath = destDir.getAbsolutePath() + File.separator + file.getName();
        BufferedWriter writer = new BufferedWriter(new FileWriter(destFilePath));
        writer.write(content.toString());
        writer.close();

        System.out.println("Processed file: " + file.getName());
    }
}
