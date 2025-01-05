package com.supcoder.supcoder;

import android.app.Activity;
import android.content.Intent;
import android.util.Log;

import androidx.annotation.NonNull;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/// 插件代理
public class PluginDelegate
        implements MethodChannel.MethodCallHandler, EventChannel.StreamHandler {

    private final String TAG = PluginDelegate.class.getSimpleName();
    // Flutter 插件绑定对象
    public FlutterPlugin.FlutterPluginBinding bind;
    // 当前 Activity
    public Activity activity;
    // 返回通道
    private MethodChannel.Result result;
    // 事件通道
    // 插件代理对象
    private static PluginDelegate _instance;

    public static PluginDelegate getInstance() {
        return _instance;
    }

    // Banner View
    public static final String KEY_NATIVE_VIEW = "native_view";
    public static final String KEY_POSID = "posId";
    // logo 参数
    public static final String KEY_LOGO = "logo";
    // timeout 参数
    public static final String KEY_TIMEOUT = "timeout";

    /**
     * 插件代理构造函数构造函数
     *
     * @param activity      Activity
     * @param pluginBinding FlutterPluginBinding
     */
    public PluginDelegate(
            Activity activity,
            FlutterPlugin.FlutterPluginBinding pluginBinding
    ) {
        this.activity = activity;
        this.bind = pluginBinding;
        _instance = this;
    }

    /**
     * 方法通道调用
     *
     * @param call   方法调用对象
     * @param result 回调结果对象
     */
    @Override
    public void onMethodCall(
            @NonNull MethodCall call,
            @NonNull MethodChannel.Result result
    ) {
        String method = call.method;
        Log.d(
                TAG,
                "MethodChannel onMethodCall method:" +
                        method +
                        " arguments:" +
                        call.arguments
        );
        if ("showSplashAd".equals(method)) {
            showSplashAd(call, result);
        } else if ("showRewardVideoAd".equals(method)) {
            showRewardVideoAd(call, result);
        } else {
            result.notImplemented();
        }
    }


    public void registerNativeView() {
        bind
                .getPlatformViewRegistry()
                .registerViewFactory(
                        KEY_NATIVE_VIEW,
                        new NativeViewFactory( this)
                );
    }


    /**
     * 显示开屏广告
     *
     * @param call   MethodCall
     * @param result Result
     */
    public void showSplashAd(MethodCall call, MethodChannel.Result result) {
        String posId = call.argument(KEY_POSID);
        String logo = call.argument(KEY_LOGO);
        double timeout = call.argument(KEY_TIMEOUT);
        Intent intent = new Intent(activity, MainActivity.class);
        intent.putExtra(KEY_POSID, posId);
        intent.putExtra(KEY_LOGO, logo);
        intent.putExtra(KEY_TIMEOUT, timeout);
        activity.startActivity(intent);
        // 设置进入动画
        activity.overridePendingTransition(
                android.R.anim.fade_in,
                android.R.anim.fade_out
        );
        result.success(true);
    }

    /**
     * 显示激励视频广告
     *
     * @param call   MethodCall
     * @param result Result
     */
    public void showRewardVideoAd(MethodCall call, MethodChannel.Result result) {
//    RewardVideoPage adPage = new RewardVideoPage();
//    adPage.showAd(activity, call);
//    result.success(true);
    }

    @Override
    public void onListen(Object arguments, EventChannel.EventSink events) {
    }

    @Override
    public void onCancel(Object arguments) {
    }
}
