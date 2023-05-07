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

import io.renren.modules.exam.dao.MajorDao;
import io.renren.modules.exam.entity.MajorEntity;
import io.renren.modules.exam.service.MajorService;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;


@Service("majorService")
public class MajorServiceImpl extends ServiceImpl<MajorDao, MajorEntity> implements MajorService {

    @Autowired
    private BaseService baseService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        QueryWrapper<MajorEntity> queryWrapper = new QueryWrapper<>();
        IPage<MajorEntity> page = this.page(
                new Query<MajorEntity>().getPage(params),
                queryWrapper
        );

        page.setRecords(baseService.relation(page));
        return new PageUtils(page);
    }

    @Override
    public List<MajorEntity> getAll() {
        return baseMapper.selectList(new QueryWrapper<MajorEntity>().eq("is_deleted", 0));
    }

}
