package io.renren.modules.exam.controller;

import java.util.Arrays;
import java.util.Map;

import io.renren.modules.exam.entity.dto.PaperCorrectingDTO;
import io.renren.modules.exam.entity.dto.PaperRecordDTO;
import io.renren.modules.exam.entity.dto.StuScoreDTO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.exam.entity.PaperRecordEntity;
import io.renren.modules.exam.service.PaperRecordService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;



/**
 * 考试记录 试卷记录
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-17 15:25:52
 */
@RestController
@RequestMapping("/exam/paperrecord")
public class PaperRecordController {
    @Autowired
    private PaperRecordService paperRecordService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:paperrecord:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = paperRecordService.queryPage(params);

        return R.ok().put("page", page);
    }

    @GetMapping("/list/correcting")
    public R queryPaperCorrecting(PaperCorrectingDTO correctingDTO) {
        return R.ok().put("data", paperRecordService.queryPaperCorrecting(correctingDTO));
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:paperrecord:info")
    public R info(@PathVariable("id") String id){
		PaperRecordEntity paperRecord = paperRecordService.getById(id);

        return R.ok().put("paperRecord", paperRecord);
    }

    /**
     * 保存
     */
    @PostMapping("/save")
    //@RequiresPermissions("exam:paperrecord:save")
    public R save(@RequestBody PaperRecordDTO paperRecordDTO){
        paperRecordService.savePaperRecord(paperRecordDTO);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:paperrecord:update")
    public R update(@RequestBody PaperRecordEntity paperRecord){
		paperRecordService.updateById(paperRecord);

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:paperrecord:delete")
    public R delete(@RequestBody String[] ids){
		paperRecordService.removeByIds(Arrays.asList(ids));

        return R.ok();
    }


    @GetMapping("/query/stuscore")
    public R queryStuScorePage(StuScoreDTO stuScoreDTO){
        return R.ok().put("data", paperRecordService.queryStuScorePage(stuScoreDTO));
    }

}
