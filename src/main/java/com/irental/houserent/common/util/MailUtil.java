package com.irental.houserent.common.util;

import io.github.biezhi.ome.OhMyEmail;

import java.util.Properties;

/*发送邮件工具类
 *
 * */
public class MailUtil {
    //邮件服务器
    private static final String host = "smtp.qq.com";
    //发送邮件的账号
    private static final String username = "745287188@qq.com";
    //发送邮件的密码
    private static final String pwd = "hlzcecasdvcnbdhh";
    //发送者姓名
    private static final String fromname = "Chrislee";


    /*
     * 配置邮件
     * */
    public static void configMail(String smtpHost, String userName, String passWord) {
        Properties properties = OhMyEmail.defaultConfig(false);
        properties.setProperty("mail.smtp.host", smtpHost);
        OhMyEmail.config(properties, userName, passWord);
    }

    /*
     * 发送邮件的方法
     * to:接受者
     * title：标题
     * content：内容
     * */
    public static void sendEmail(String to, String title, String content) throws Exception {
        configMail(host, username, pwd);
        OhMyEmail.subject(title).from(fromname).to(to).html(content).send();
    }

    public static void main(String[] args) throws Exception {
        sendEmail(username, "测试内容", "测试内容1111222333");
    }
}
