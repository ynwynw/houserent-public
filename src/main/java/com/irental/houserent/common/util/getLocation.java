package com.irental.houserent.common.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class getLocation {
    public static String getlocation() {

        URL url = null;

        HttpURLConnection connection = null;

        try {//腾讯IP定位（普通）接口  10,000次/日   5次/秒

            url = new URL("https://apis.map.qq.com/ws/location/v1/ip?key=CGSBZ-4BFWJ-NSXF6-KDQUW-AZHPE-S6F3N\n");

            connection = (HttpURLConnection) url.openConnection();// 新建连接实例

            connection.setConnectTimeout(3000);// 设置连接超时时间，单位毫秒

            connection.setReadTimeout(3000);// 设置读取数据超时时间，单位毫秒

            connection.setDoOutput(true);// 是否打开输出流 true|false

            connection.setDoInput(true);// 是否打开输入流true|false

            connection.setRequestMethod("GET");// 提交方法POST|GET

            connection.setUseCaches(false);// 是否缓存true|false

            connection.connect();// 打开连接端口

            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8));// 往对端写完数据对端服务器返回数据// ,以BufferedReader流来读取

            StringBuffer buffer = new StringBuffer();

            String line = "";

            while ((line = reader.readLine()) != null) {

                buffer.append(line);

            }

            reader.close();

            JSONObject jsonObject = JSON.parseObject(buffer.toString());

            if (jsonObject != null && !jsonObject.isEmpty() && jsonObject.getIntValue("status") == 0) {

                jsonObject.getJSONObject("result").getJSONObject("ad_info").getString("province");

                String province = jsonObject.getJSONObject("result").getJSONObject("ad_info").getString("province");

                String city = jsonObject.getJSONObject("result").getJSONObject("ad_info").getString("city");
                String city1 = city.replace("市", "");
                String city2 = city1.replace("省", "");

                return city2;
            }

        } catch (Exception e) {


        } finally {

            if (connection != null) {

                connection.disconnect();// 关闭连接

            }

        }
        return null;
    }
}
