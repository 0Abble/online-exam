package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.PaperEntity;
import io.renren.modules.exam.entity.StudentEntity;
import io.renren.modules.exam.entity.dto.PaperDTO;
import io.renren.modules.exam.entity.vo.PaperInfoVO;
import io.renren.modules.exam.entity.vo.PaperQuestionVO;

import java.util.List;
import java.util.Map;

/**
 * 试卷
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:13:25
 */
public interface PaperService extends IService<PaperEntity> {

    PageUtils queryPage(Map<String, Object> params);


    /**
     *
     * @param subjectId
     * @return
     */
    List<PaperQuestionVO> getPageQuestionList(Integer subjectId);


    void savePaperInfo(PaperDTO paperDTO);

    PaperInfoVO getPaperInfoByPaperId(String paperId);


    /**
     * 根据 paperId 修改 确认状态
     */
    void updateBatchAffirmByIds(List<String> ids, String updateBy);

    void savePaperClazzRelation(String paperId, Integer clazzId);

    IPage<PaperEntity> getPaperByClazzId(PaperDTO paperDTO, String clazzId, String token) throws Exception;

    PaperEntity getPaperByClazzIdAndPaperId(String paperId);
}

