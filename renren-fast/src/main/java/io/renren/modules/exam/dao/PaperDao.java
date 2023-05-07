package io.renren.modules.exam.dao;

import io.renren.modules.exam.entity.PaperEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 试卷
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
@Mapper
public interface PaperDao extends BaseMapper<PaperEntity> {


    List<PaperEntity> getPaperByClazzId(Integer clazzId);
}
