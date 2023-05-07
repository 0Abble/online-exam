package io.renren.modules.exam.service.impl;

import io.renren.modules.sys.dao.SysUserDao;
import io.renren.modules.sys.entity.SysUserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.ClazzDao;
import io.renren.modules.exam.entity.ClazzEntity;
import io.renren.modules.exam.service.ClazzService;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;


@Service("clazzService")
public class ClazzServiceImpl extends ServiceImpl<ClazzDao, ClazzEntity> implements ClazzService {

    @Autowired
    private BaseService baseService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<ClazzEntity> wrapper = new QueryWrapper<>();
        IPage<ClazzEntity> page = this.page(
                new Query<ClazzEntity>().getPage(params),
                wrapper
        );
        page.setRecords(baseService.relation(page));

        return new PageUtils(page);
    }

}
