package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.PaperRecordEntity;
import io.renren.modules.exam.entity.StudentEntity;
import io.renren.modules.exam.entity.dto.PaperCorrectingDTO;
import io.renren.modules.exam.entity.dto.PaperRecordDTO;
import io.renren.modules.exam.entity.dto.StuScoreDTO;
import io.renren.modules.exam.entity.vo.PaperCorrectingVO;
import io.renren.modules.exam.entity.vo.PaperRecordVO;
import io.renren.modules.exam.entity.vo.StuScoreVO;

import java.util.List;
import java.util.Map;

/**
 * 考试记录 试卷记录
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-17 15:25:52
 */
public interface PaperRecordService extends IService<PaperRecordEntity> {

    PageUtils queryPage(Map<String, Object> params);

    void savePaperRecord(PaperRecordDTO paperRecordDTO);

    IPage<PaperRecordVO> queryPaperRecordByStuNo(PaperRecordDTO recordDTO);


    IPage<PaperCorrectingVO> queryPaperCorrecting(PaperCorrectingDTO correctingDTO);

    void saveObsoletePaper(StudentEntity studentEntity, List<String> paperIds);

    IPage<StuScoreVO> queryStuScorePage(StuScoreDTO stuScoreDTO);
}

