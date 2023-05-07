package io.renren.modules.exam.dao;

import io.renren.modules.exam.entity.PaperClazzEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * 试卷分配给班级
 * 
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-09 18:35:47
 */
@Mapper
public interface PaperClazzDao extends BaseMapper<PaperClazzEntity> {
	
}
