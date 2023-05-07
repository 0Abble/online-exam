package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.SubjectEntity;

import java.util.Map;

/**
 * 课程科目表
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
public interface SubjectService extends IService<SubjectEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

