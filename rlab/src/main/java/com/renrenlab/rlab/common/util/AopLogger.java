package com.renrenlab.rlab.common.util;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

// @Aspect : 标记为切面类
// @Pointcut : 指定匹配切点集合
// @Before : 指定前置通知，value中指定切入点匹配
// @AfterReturning ：后置通知，具有可以指定返回值
// @AfterThrowing ：异常通知
// 注意：前置/后置/异常通知的函数都没有返回值，只有环绕通知有返回值

@Component
// 首先初始化切面类
@Aspect
// 声明为切面类，底层使用动态代理实现AOP
public class AopLogger {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    // 指定切入点匹配表达式，注意它是以方法的形式进行声明的。
    // 即切点集合是：aop.annotation包下所有类所有方法
    // 第一个* 代表返回值类型
    // 如果要设置多个切点可以使用 || 拼接
    //@Pointcut("execution(* aop.annotation.*.*(..))|| execution(* com.renrenlab.rlab.controller.*.*(..))")
    @Pointcut("execution(* com.renrenlab.rlab.controller.*.*(..))")
    public void anyMethod() {
    }

    // 前置通知
    // 在切点方法集合执行前，执行前置通知
    @Before(value = "anyMethod()")
    public void before(JoinPoint jp) {
        StringBuffer sb = new StringBuffer();
        StringBuffer paramSb = new StringBuffer();
        Class<? extends Object> targetClass = jp.getTarget().getClass();
        sb.append("enter||");
        sb.append(targetClass);

        Signature signature = jp.getSignature();
        MethodSignature MethodSignature = (MethodSignature) signature;
        String[] parameterNames = MethodSignature.getParameterNames();

        sb.append("||");
        sb.append(signature.getName());
        Object[] param = jp.getArgs();
        paramSb.append("||");
        if (param != null && param.length != 0) {
            for (int i = 0; i < param.length - 1; i++) {
                if (param[i] != null) {
                    paramSb.append(parameterNames[i]);
                    paramSb.append("=");
                    paramSb.append(param[i].toString());
                    paramSb.append(",");
                }
            }
            paramSb.append(parameterNames[param.length - 1]);
            paramSb.append("=");
            //规避NPE问题
            if (param[param.length - 1] != null)
                paramSb.append(param[param.length - 1].toString());
        }
        sb.append(paramSb.toString());
        logger.debug(sb.toString());

    }

    // 后置通知
    @AfterReturning(value = "anyMethod()", returning = "rtv")
    public void after(JoinPoint jp, Object rtv) {
        StringBuffer sb = new StringBuffer();
        Class<? extends Object> targetClass = jp.getTarget().getClass();
        sb.append("enter||");
        sb.append(targetClass);

        Signature signature = jp.getSignature();
        sb.append("||");
        sb.append(signature.getName());

        sb.append("||result=");
        if (rtv != null) {
            sb.append(rtv.toString());
        }
        logger.debug(sb.toString());
    }


    @AfterThrowing(value = "anyMethod()", throwing = "e")
    public void error(JoinPoint jp, Throwable e) {
        StringBuffer sb = new StringBuffer();
        Class<? extends Object> targetClass = jp.getTarget().getClass();
        sb.append("enter||");
        sb.append(targetClass);

        Signature signature = jp.getSignature();
        sb.append("||");
        sb.append(signature.getName());

        sb.append("||");
        sb.append(e);
        logger.error(sb.toString());
    }

}
