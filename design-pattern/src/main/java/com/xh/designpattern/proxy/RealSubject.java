package com.xh.designpattern.proxy;

/**
 * Created by 123 on 2017/5/9.
 */
public class RealSubject implements Subject {

    public void doSomething() {
        System.out.println( "call doSomething()" );
    }
}
