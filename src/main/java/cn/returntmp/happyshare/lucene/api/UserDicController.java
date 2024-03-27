package cn.returntmp.happyshare.lucene.api;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import cn.returntmp.happyshare.core.result.GlobalResult;
import cn.returntmp.happyshare.core.result.GlobalResultGenerator;
import cn.returntmp.happyshare.lucene.model.UserDic;
import cn.returntmp.happyshare.lucene.service.UserDicService;
import cn.returntmp.happyshare.util.Utils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 用户字典控制器
 *
 * @author suwen
 * @date 2021/2/4 09:29
 */
@RestController
@RequestMapping("/api/v1/lucene/dic")
public class UserDicController {

    @Resource
    private UserDicService dicService;

    @GetMapping("/getAll")
    public GlobalResult getAll(
            @RequestParam(defaultValue = "0") Integer page,
            @RequestParam(defaultValue = "10") Integer rows) {
        PageHelper.startPage(page, rows);
        List<UserDic> list = dicService.getAll();
        PageInfo<UserDic> pageInfo = new PageInfo<>(list);
        Map<String, Object> map = new HashMap<>(2);
        map.put("userDic", pageInfo.getList());
        Map pagination = Utils.getPagination(pageInfo);
        map.put("pagination", pagination);
        return GlobalResultGenerator.genSuccessResult(map);
    }

    @PostMapping("/addDic/{dic}")
    public GlobalResult addDic(@PathVariable String dic) {
        dicService.addDic(dic);
        return GlobalResultGenerator.genSuccessResult("新增字典成功");
    }

    @PutMapping("/editDic")
    public GlobalResult getAllDic(@RequestBody UserDic dic) {
        dicService.updateDic(dic);
        return GlobalResultGenerator.genSuccessResult("更新字典成功");
    }

    @DeleteMapping("/deleteDic/{id}")
    public GlobalResult deleteDic(@PathVariable String id) {
        dicService.deleteDic(id);
        return GlobalResultGenerator.genSuccessResult("删除字典成功");
    }
}
