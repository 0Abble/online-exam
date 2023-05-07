package io.renren.modules.exam.dao;

import io.renren.modules.exam.entity.StuScoreEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 学生分数
 * 
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
@Mapper
public interface StuScoreDao extends BaseMapper<StuScoreEntity> {
	
}
