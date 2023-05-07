package io.renren.modules.exam.controller;

import java.util.Arrays;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.renren.modules.exam.entity.NoticeEntity;
import io.renren.modules.exam.service.NoticeService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 公告
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-24 15:47:26
 */
@RestController
@RequestMapping("/exam/notice")
public class NoticeController extends AbstractController{
    @Autowired
    private NoticeService noticeService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:notice:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = noticeService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:notice:info")
    public R info(@PathVariable("id") String id){
		NoticeEntity notice = noticeService.getById(id);

        return R.ok().put("notice", notice);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:notice:save")
    public R save(@RequestBody NoticeEntity notice){
        notice.setCreateBy(getUser().getWorkNo());
		noticeService.save(notice);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:notice:update")
    public R update(@RequestBody NoticeEntity notice){
        notice.setUpdateBy(getUser().getWorkNo());
		noticeService.updateById(notice);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:notice:delete")
    public R delete(@RequestBody String[] ids){
		noticeService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }

}
