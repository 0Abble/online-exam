package io.renren.modules.exam.dao;

import io.renren.modules.exam.entity.PaperQuestionEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 试卷与题目关联表
 * 
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-08 19:05:12
 */
@Mapper
public interface PaperQuestionDao extends BaseMapper<PaperQuestionEntity> {
	
}
