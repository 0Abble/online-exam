package io.renren.modules.exam.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.renren.modules.exam.entity.*;
import io.renren.modules.exam.entity.dto.PaperCorrectingDTO;
import io.renren.modules.exam.entity.dto.PaperRecordDTO;
import io.renren.modules.exam.entity.dto.StuScoreDTO;
import io.renren.modules.exam.entity.vo.PaperCorrectingVO;
import io.renren.modules.exam.entity.vo.PaperRecordVO;
import io.renren.modules.exam.entity.vo.StuScoreVO;
import io.renren.modules.exam.service.MajorService;
import io.renren.modules.exam.service.QuestionRecordService;
import io.renren.modules.exam.service.SubjectService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Array;
import java.util.*;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.PaperRecordDao;
import io.renren.modules.exam.service.PaperRecordService;
import org.springframework.transaction.annotation.Transactional;


@Service("paperRecordService")
public class PaperRecordServiceImpl extends ServiceImpl<PaperRecordDao, PaperRecordEntity> implements PaperRecordService {

    @Autowired
    private QuestionRecordService questionRecordService;
    @Autowired
    private MajorService majorService;
    @Autowired
    private SubjectService subjectService;
    @Autowired
    private BaseService baseService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<PaperRecordEntity> page = this.page(
                new Query<PaperRecordEntity>().getPage(params),
                new QueryWrapper<PaperRecordEntity>()
        );

        return new PageUtils(page);
    }

    @Transactional(
            rollbackFor = Exception.class
    )
    @Override
    public void savePaperRecord(PaperRecordDTO paperRecordDTO) {
        PaperRecordEntity paperRecordEntity = new PaperRecordEntity();
        BeanUtils.copyProperties(paperRecordDTO, paperRecordEntity);
        baseMapper.insert(paperRecordEntity);
        List<QuestionRecordEntity> questionRecordEntityList = new ArrayList<>();
        paperRecordDTO.getQuestionRecordList().forEach(item -> {
            QuestionRecordEntity questionRecordEntity = new QuestionRecordEntity();
            BeanUtils.copyProperties(item, questionRecordEntity);
            questionRecordEntity.setPaperRecordId(paperRecordEntity.getId());
            questionRecordEntityList.add(questionRecordEntity);
        });
        questionRecordService.saveBatch(questionRecordEntityList);
    }

    @Override
    public IPage<PaperRecordVO> queryPaperRecordByStuNo(PaperRecordDTO recordDTO) {
        IPage<PaperRecordVO> paperRecordVOIPage = baseMapper.queryPaperRecordByStuNo(
                new Page(recordDTO.getPageNo(), recordDTO.getPageSize()),
                recordDTO
        );
        List<PaperRecordVO> records = paperRecordVOIPage.getRecords();
        Set<Integer> majorIds = new HashSet<>();
        Set<Integer> subjectIds = new HashSet<>();
        records.forEach(item -> {
            majorIds.add(item.getMajorId());
            subjectIds.add(item.getSubjectId());
        });
        List<SubjectEntity> subjectEntityList = majorIds.isEmpty() ? null : subjectService.list(new QueryWrapper<SubjectEntity>().in("id", subjectIds));
        List<MajorEntity> majorEntityList =  subjectIds.isEmpty() ? null : majorService.list(new QueryWrapper<MajorEntity>().in("id", majorIds));
        records.forEach(item -> {
            if (Objects.nonNull(subjectEntityList)) {
                subjectEntityList.forEach(subject -> {
                    if (item.getSubjectId().equals(subject.getId())) {
                        item.setSubjectName(subject.getName());
                    }
                });
            }
            if (Objects.nonNull(majorEntityList)) {
                majorEntityList.forEach(major -> {
                    if (item.getMajorId().equals(major.getId())) {
                        item.setMajorName(major.getMajorName());
                    }
                });
            }
        });
        paperRecordVOIPage.setRecords(baseService.relation(paperRecordVOIPage));
        return paperRecordVOIPage;
    }

    @Override
    public IPage<PaperCorrectingVO> queryPaperCorrecting(PaperCorrectingDTO correctingDTO) {
        IPage<PaperCorrectingVO> paperCorrectingVOIPage = baseMapper.queryPaperCorrecting(
                new Page(correctingDTO.getPageNo(), correctingDTO.getPageSize()),
                correctingDTO
        );
        List<PaperCorrectingVO> records = paperCorrectingVOIPage.getRecords();
        Set<Integer> majorIds = new HashSet<>();
        Set<Integer> subjectIds = new HashSet<>();
        records.forEach(item -> {
            majorIds.add(item.getMajorId());
            subjectIds.add(item.getSubjectId());
        });
        List<SubjectEntity> subjectEntityList = majorIds.isEmpty() ? null : subjectService.list(new QueryWrapper<SubjectEntity>().in("id", subjectIds));
        List<MajorEntity> majorEntityList =  subjectIds.isEmpty() ? null : majorService.list(new QueryWrapper<MajorEntity>().in("id", majorIds));
        records.forEach(item -> {
            if (Objects.nonNull(subjectEntityList)) {
                subjectEntityList.forEach(subject -> {
                    if (item.getSubjectId().equals(subject.getId())) {
                        item.setSubjectName(subject.getName());
                    }
                });
            }
            if (Objects.nonNull(majorEntityList)) {
                majorEntityList.forEach(major -> {
                    if (item.getMajorId().equals(major.getId())) {
                        item.setMajorName(major.getMajorName());
                    }
                });
            }
        });
        paperCorrectingVOIPage.setRecords(records);
        paperCorrectingVOIPage.setRecords(baseService.relation(paperCorrectingVOIPage));
        return paperCorrectingVOIPage;
    }

    @Override
    public void saveObsoletePaper(StudentEntity studentEntity, List<String> paperIds) {
        List<PaperRecordEntity> recordEntityList = baseMapper.selectList(new QueryWrapper<PaperRecordEntity>().in("paper_id", paperIds));
        Set<String> existPaperIds = new HashSet<>();
        recordEntityList.forEach(item -> {
            if (paperIds.contains(item.getPaperId())) {
                existPaperIds.add(item.getPaperId());
            }
        });
        List<PaperRecordEntity> saveList = new ArrayList<>();
        paperIds.forEach(paperId -> {
            if (!existPaperIds.contains(paperId)) {
                PaperRecordEntity temp = new PaperRecordEntity();
                temp.setStuNo(studentEntity.getStuNo());
                temp.setPaperId(paperId);
                temp.setCorrectNum(0);
                temp.setExamScore(0F);
                temp.setIsChecked(-2);
                temp.setCreateTime(new Date());
                saveList.add(temp);
            }
        });
        if (!saveList.isEmpty()) {
            this.saveBatch(saveList);
        }
    }

    @Override
    public IPage<StuScoreVO> queryStuScorePage(StuScoreDTO stuScoreDTO) {
        IPage<StuScoreVO> page = baseMapper.queryStuScorePage(
                new Page(stuScoreDTO.getPageNo(), stuScoreDTO.getPageSize()),
                stuScoreDTO
        );
        page.setRecords(baseService.relation(page));
        return page;
    }

}
