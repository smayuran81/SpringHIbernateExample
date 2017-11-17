package com.hibernate.main;

/**
 * Created by msivasub on 31/10/2017.
 */
public class StartDBConsole implements Runnable {

    public void run() {
        org.hsqldb.util.DatabaseManagerSwing.main(new String[] {
                "--url",  "jdbc:hsqldb:mem:foodmart", "-user", "FOODMART","-password","FOODMART","--noexit"
        });
    }


}
