package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.PaperQuestionEntity;

import java.util.Map;

/**
 * 试卷与题目关联表
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-08 19:05:12
 */
public interface PaperQuestionService extends IService<PaperQuestionEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

