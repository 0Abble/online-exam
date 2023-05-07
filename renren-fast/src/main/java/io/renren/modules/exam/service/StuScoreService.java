package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.StuScoreEntity;

import java.util.Map;

/**
 * 学生分数
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
public interface StuScoreService extends IService<StuScoreEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

