package io.renren.modules.exam.service.impl;

import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.entity.SysUserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.SubjectDao;
import io.renren.modules.exam.entity.SubjectEntity;
import io.renren.modules.exam.service.SubjectService;
import org.springframework.util.StringUtils;


@Service("subjectService")
public class SubjectServiceImpl extends ServiceImpl<SubjectDao, SubjectEntity> implements SubjectService {

    @Autowired
    private BaseService baseService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {

        String name = (String) params.get("name");

        QueryWrapper<SubjectEntity> wrapper = new QueryWrapper<>();
        wrapper.eq("is_deleted", 0);
        if (StringUtils.hasText(name)) {
            wrapper.and(r -> r.like("name", name));
        }

        IPage<SubjectEntity> page = this.page(
                new Query<SubjectEntity>().getPage(params),
                wrapper
        );

        page.setRecords(baseService.relation(page));
        return new PageUtils(page);
    }

}
