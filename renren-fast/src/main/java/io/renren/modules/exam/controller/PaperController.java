package io.renren.modules.exam.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import io.renren.modules.exam.dao.PaperClazzDao;
import io.renren.modules.exam.entity.PaperClazzEntity;
import io.renren.modules.exam.entity.PaperQuestionEntity;
import io.renren.modules.exam.entity.dto.PaperDTO;
import io.renren.modules.exam.service.PaperQuestionService;
import io.renren.modules.exam.service.impl.PaperPdfPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import io.renren.modules.exam.entity.PaperEntity;
import io.renren.modules.exam.service.PaperService;
import io.renren.common.utils.PageUtils;
import io.renren.common.utils.R;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 试卷
 *
 * @author lijun
 * @email 1420794684@qq.com
 * @date 2023-01-06 22:27:32
 */
@RestController
@RequestMapping("/exam/paper")
public class PaperController extends AbstractController{
    @Autowired
    private PaperService paperService;

    @Autowired
    private PaperQuestionService paperQuestionService;

    @Resource
    private PaperClazzDao paperClazzDao;

    @Autowired
    private PaperPdfPage paperPdfPage;

    /**
     * 列表
     */
    @RequestMapping("/list")
    //@RequiresPermissions("exam:paper:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = paperService.queryPage(params);

        return R.ok().put("page", page);
    }

    @GetMapping("/nopass/list/{workNo}")
    public R noPassList(@PathVariable("workNo") String workNo) {
        return R.ok().put("data", paperService.getBaseMapper().selectList(new QueryWrapper<PaperEntity>().ne("is_checked", 0).eq("is_affirm", 0).eq("create_by", workNo)));
    }

    @GetMapping("/question/list/{subjectId}")
    public R pageQuestionList(@PathVariable("subjectId") Integer subjectId) {
        return R.ok().put("data", paperService.getPageQuestionList(subjectId));
    }

    @GetMapping("/info/{paperId}")
    public R pageInfoByPaperId(@PathVariable("paperId") String paperId) {
        return R.ok().put("data", paperService.getPaperInfoByPaperId(paperId));
    }

    @GetMapping("/export/{paperId}")
    public void exportPaperInfo(@PathVariable("paperId") String paperId,
                                HttpServletRequest request,
                                HttpServletResponse response) throws Exception {

        paperPdfPage.exportPaperInfo(paperId, response);

        response.setContentType("application/octet-stream;charset=UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=test.pdf");
        response.getOutputStream().flush();
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    //@RequiresPermissions("exam:paper:info")
    public R info(@PathVariable("id") String id){
		PaperEntity paper = paperService.getById(id);

        return R.ok().put("paper", paper);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    //@RequiresPermissions("exam:paper:save")
    public R save(@RequestBody PaperDTO paperDTO){
        paperDTO.setCreateBy(getUser().getWorkNo());
        paperService.savePaperInfo(paperDTO);
        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    //@RequiresPermissions("exam:paper:update")
    public R update(@RequestBody PaperEntity paper){
        paper.setUpdateBy(getUser().getWorkNo());
		paperService.updateById(paper);

        return R.ok();
    }

    @PutMapping("/affirm")
    public R updateAffirm(@RequestBody String[] ids) {
        paperService.updateBatchAffirmByIds(Arrays.asList(ids), getUser().getWorkNo());
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    //@RequiresPermissions("exam:paper:delete")
    public R delete(@RequestBody String[] ids){
        List<PaperEntity> paperEntityList = paperService.getBaseMapper().selectList(new QueryWrapper<PaperEntity>().eq("is_checked", -1).in("id", Arrays.asList(ids)));
        paperService.removeByIds(Arrays.asList(ids));
        if (!paperEntityList.isEmpty()) {
            List<String> paperIds = paperEntityList.stream().map(item -> item.getId()).collect(Collectors.toList());
            paperQuestionService.remove(new QueryWrapper<PaperQuestionEntity>().in("paper_id", paperIds));
        }
        return R.ok();
    }

    @PostMapping("/save/paper_clazz_relation")
    public R savePaperClazzRelation(String paperId, Integer clazzId) {
        paperService.savePaperClazzRelation(paperId, clazzId);
        return R.ok();
    }

    @GetMapping("/list/paper_clazz_relation")
    public R getPaperClazzRelationListByPaperId(String paperId) {
        return R.ok().put("data", paperClazzDao.selectList(new QueryWrapper<PaperClazzEntity>().eq("paper_id", paperId)));
    }

    @DeleteMapping("/delete/paper_clazz_relation")
    public R deletePaperClazzRelation(String paperId, Integer clazzId){
        paperClazzDao.delete(new QueryWrapper<PaperClazzEntity>().eq("paper_id", paperId).eq("clazz_id", clazzId));
        return R.ok();
    }
}
