package io.renren.modules.exam.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.Query;

import io.renren.modules.exam.dao.NoticeDao;
import io.renren.modules.exam.entity.NoticeEntity;
import io.renren.modules.exam.service.NoticeService;


@Service("noticeService")
public class NoticeServiceImpl extends ServiceImpl<NoticeDao, NoticeEntity> implements NoticeService {

    @Autowired
    private BaseService baseService;

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        IPage<NoticeEntity> page = this.page(
                new Query<NoticeEntity>().getPage(params),
                new QueryWrapper<NoticeEntity>()
        );
        page.setRecords(baseService.relation(page));
        return new PageUtils(page);
    }

}
