package com.pancake.socket;

import com.pancake.handler.CommittedMsgHandler;
import com.pancake.handler.Handler;
import com.pancake.handler.PreparedMsgHandler;
import com.pancake.util.NetUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.net.ServerSocket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by chao on 2017/11/21.
 */
@SuppressWarnings("InfiniteLoopStatement")
public class ValidatorServer implements Runnable {
    private final static Logger logger = LoggerFactory.getLogger(ValidatorServer.class);
    private final ServerSocket serverSocket;
    private final ExecutorService threadPool;
    private final ExecutorService pdmhPool;

    public ValidatorServer(int port) throws IOException {
        serverSocket = new ServerSocket(port);
        threadPool = Executors.newCachedThreadPool();
        pdmhPool = Executors.newCachedThreadPool();
//        serverSocket.setSoTimeout(100000);
    }

    /**
     * 保留 poolSize 是为了使用 newFixedThreadPool
     *
     * @param port
     * @param poolSize
     * @throws IOException
     */
    public ValidatorServer(int port, int poolSize) throws IOException {
        serverSocket = new ServerSocket(port);
        threadPool = Executors.newFixedThreadPool(poolSize);
        pdmhPool = Executors.newFixedThreadPool(poolSize);
//        serverSocket.setSoTimeout(100000);
    }

    public void run() {
        try {
            logger.info("服务器 [" + NetUtil.getRealIp() + ":"
                    + serverSocket.getLocalPort() + "] 启动");
            logger.info("服务器 [" + NetUtil.getRealIp() + ":"
                    + serverSocket.getLocalPort() + "] 启动检测生成 PreparedMessage 服务器");
            new Thread(new PreparedMsgHandler(NetUtil.getRealIp(), serverSocket.getLocalPort())).start();
            logger.info("服务器 [" + NetUtil.getRealIp() + ":"
                    + serverSocket.getLocalPort() + "] 启动检测生成 CommittedMessage 服务器");
            new Thread(new CommittedMsgHandler(NetUtil.getRealIp(), serverSocket.getLocalPort())).start();

            while (true) {
                threadPool.execute(new Handler(serverSocket.accept()));
            }
        } catch (IOException ex) {
            threadPool.shutdown();
        }

    }

    public static void main(String[] args) {
        int port = 8000;
        try {
            Thread t = new Thread(new ValidatorServer(port));
            t.start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
