package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.StudentEntity;

import java.util.Map;

/**
 * 学生信息表
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
public interface StudentService extends IService<StudentEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

