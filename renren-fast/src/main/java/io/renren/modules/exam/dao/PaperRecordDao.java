package io.renren.modules.exam.dao;

import com.baomidou.mybatisplus.core.metadata.IPage;
import io.renren.modules.exam.entity.PaperRecordEntity;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import io.renren.modules.exam.entity.dto.PaperCorrectingDTO;
import io.renren.modules.exam.entity.dto.PaperRecordDTO;
import io.renren.modules.exam.entity.dto.StuScoreDTO;
import io.renren.modules.exam.entity.vo.PaperCorrectingVO;
import io.renren.modules.exam.entity.vo.PaperRecordVO;
import io.renren.modules.exam.entity.vo.StuScoreVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 考试记录 试卷记录
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-17 15:25:52
 */
@Mapper
public interface PaperRecordDao extends BaseMapper<PaperRecordEntity> {

    /**
     * 根据学生学号查询 对应的考试记录
     * @return
     */
    IPage<PaperRecordVO> queryPaperRecordByStuNo(IPage page, @Param("recordDTO")PaperRecordDTO recordDTO);

    /**
     * 得到需要批改的试卷
     * @return
     */
    IPage<PaperCorrectingVO> queryPaperCorrecting(IPage page, @Param("correctingDTO") PaperCorrectingDTO correctingDTO);

    IPage<StuScoreVO> queryStuScorePage(IPage page, @Param("params")StuScoreDTO params);
}
