package cn.itcaste.liu.spring.Deom5;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Service("cycle")
@Scope("prototype")//用于单例和多列prototype是多列
public class CycreService {
    @PostConstruct//相当于init
    public void init(){
        System.out.println("开始执行");
    }
    public void prin(){
        System.out.println("傻逼");
    }
    @PreDestroy//相当于destroy
    public void destroy(){
        System.out.println("结束执行");
    }
}
