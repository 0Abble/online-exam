package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.QuestionTypeEntity;

import java.util.Map;

/**
 * 题目类型
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
public interface QuestionTypeService extends IService<QuestionTypeEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

