package com.supcoder.supcoder

import android.content.Context
import android.graphics.Color
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.TextView
import androidx.annotation.Nullable
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import org.w3c.dom.Text


class NativeView(
    context: Context,val id: Int,
    @Nullable creationParams: Map<String?, Any?>?,
    pluginDelegate: PluginDelegate
) : PlatformView {

    private val TAG = "NativeView"

    private var methodChannel: MethodChannel

    private val nativeView: FrameLayout

    override fun getView(): View {
        return nativeView
    }

    override fun dispose() {}

    init {
        Log.d(TAG, "NativeView: $id")
        methodChannel = MethodChannel(pluginDelegate.bind.binaryMessenger, "native_view_$id")
        nativeView = ADFeedGroupView(context)
        nativeView.setOnSizeChangedListener(object : ADFeedGroupView.OnSizeChangedListener {
            override fun onSizeChanged(newHeight: Int) {
                Log.d(TAG, "onSizeChanged: $newHeight")
                methodChannel.invokeMethod("updateHeight", mapOf("height" to newHeight))
            }
        })
        setupViews(nativeView)
    }

    private fun setupViews(nativeView: FrameLayout) {
        val params = FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.WRAP_CONTENT
        );
        nativeView.layoutParams = params
        val textView = TextView(nativeView.context)
        textView.textSize = 72f;
        textView.setBackgroundColor(Color.rgb(255, 255, 255));
        textView.text = "Rendered on a native Android view (id: $id)";
        nativeView.addView(textView,params)
    }



}