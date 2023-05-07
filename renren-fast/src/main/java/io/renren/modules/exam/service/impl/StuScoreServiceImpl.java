package io.renren.modules.exam.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.StuScoreDao;
import io.renren.modules.exam.entity.StuScoreEntity;
import io.renren.modules.exam.service.StuScoreService;


@Service("stuScoreService")
public class StuScoreServiceImpl extends ServiceImpl<StuScoreDao, StuScoreEntity> implements StuScoreService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<StuScoreEntity> page = this.page(
                new Query<StuScoreEntity>().getPage(params),
                new QueryWrapper<StuScoreEntity>()
        );

        return new PageUtils(page);
    }

}