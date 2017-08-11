package com.xh.designpattern.proxy;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Proxy;
import sun.misc.ProxyGenerator;
import java.io.*;
/**
 * Created by 123 on 2017/5/9.
 */
public class Test {
    public static void main(String[] args) {
        RealSubject real = new RealSubject();
        Subject proxySubject = (Subject)Proxy.newProxyInstance(Subject.class.getClassLoader(), new Class[]{Subject.class}, new ProxyHandler(real));
        proxySubject.doSomething();

        //write proxySubject class binary data to file
        createProxyClassFile();
    }
    public static void createProxyClassFile()
    {
        String name = "ProxySubject";
        byte[] data = ProxyGenerator.generateProxyClass( name, new Class[] { Subject.class } );
        try
        {
            FileOutputStream out = new FileOutputStream( name + ".class" );
            out.write( data );
            out.close();
        }
        catch( Exception e )
        {
            e.printStackTrace();
        }
    }
}
