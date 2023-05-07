package io.renren.modules.exam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.QuestionTypeDao;
import io.renren.modules.exam.entity.QuestionTypeEntity;
import io.renren.modules.exam.service.QuestionTypeService;


@Service("questionTypeService")
public class QuestionTypeServiceImpl extends ServiceImpl<QuestionTypeDao, QuestionTypeEntity> implements QuestionTypeService {

    @Autowired
    private BaseService baseService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        QueryWrapper<QuestionTypeEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("is_deleted", 0);
        IPage<QuestionTypeEntity> page = this.page(
                new Query<QuestionTypeEntity>().getPage(params),
                wrapper
        );

        page.setRecords(baseService.relation(page));
        return new PageUtils(page);
    }

}
