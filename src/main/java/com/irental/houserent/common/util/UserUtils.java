package com.irental.houserent.common.util;

import com.irental.houserent.common.constant.Base;
import com.irental.houserent.entity.User;
import org.apache.shiro.SecurityUtils;

/**
 * @author shimh
 * <p>
 * 2018年1月25日
 */
public class UserUtils {

    public static User getCurrentUser() {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute(Base.CURRENT_USER);
        return user;
    }
}
