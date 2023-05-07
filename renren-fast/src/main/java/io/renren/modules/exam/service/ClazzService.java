package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.ClazzEntity;

import java.util.Map;

/**
 * 年级班级
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-07 12:40:37
 */
public interface ClazzService extends IService<ClazzEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

