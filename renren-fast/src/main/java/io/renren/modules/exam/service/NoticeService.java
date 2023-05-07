package io.renren.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import io.renren.common.utils.PageUtils;
import io.renren.modules.exam.entity.NoticeEntity;

import java.util.Map;

/**
 * 公告
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-24 15:47:26
 */
public interface NoticeService extends IService<NoticeEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

