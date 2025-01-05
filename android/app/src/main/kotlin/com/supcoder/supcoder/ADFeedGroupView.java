package com.supcoder.supcoder;

import android.content.Context;
import android.util.Log;
import android.view.ViewGroup;
import android.view.View;
import android.widget.FrameLayout;

public class ADFeedGroupView extends FrameLayout {

    private OnSizeChangedListener mListener;

    public ADFeedGroupView(Context context) {
        super(context);
    }

    // 设置 listener
    public void setOnSizeChangedListener(OnSizeChangedListener listener) {
        this.mListener = listener;
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        Log.d("ADFeedGroupView", "onMeasure#widthMeasureSpec=" + widthMeasureSpec + ",heightMeasureSpec=" + heightMeasureSpec);
        // 获取父布局提供的宽度测量规格
        int widthSize = MeasureSpec.getSize(widthMeasureSpec);
        int widthMode = MeasureSpec.getMode(widthMeasureSpec);
        // 我们希望高度根据内容自适应，所以这里使用 WRAP_CONTENT
        int heightMode = MeasureSpec.UNSPECIFIED;
        int heightSize = 0;
        // 设置我们自己的测量规格
        int parentWidthMeasureSpec = MeasureSpec.makeMeasureSpec(widthSize, widthMode);
        int parentHeightMeasureSpec = MeasureSpec.makeMeasureSpec(heightSize, heightMode);

        // 测量子视图
        measureChildren(parentWidthMeasureSpec, parentHeightMeasureSpec);
        // 计算总的高度
        int totalHeight = 0;
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != GONE) {
                totalHeight += child.getMeasuredHeight();
            }
        }
        Log.d("ADFeedGroupView", "onMeasure#totalHeight=" + totalHeight);
        // 设置最终的测量尺寸
        setMeasuredDimension(widthSize, totalHeight);
    }

    @Override
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        Log.d("ADFeedGroupView", "onLayout#l=" + l + ",t=" + t + ",r=" + r + ",b=" + b);
        int width = r - l;
        int height = b - t;
        for (int i = 0; i < getChildCount(); i++) {
            View child = getChildAt(i);
            // 只对可见的子视图进行布局
            if (child.getVisibility() != View.GONE) {
                // 子视图应该全屏显示
//                child.layout(0, 0, width, height);
                child.layout(l, t, r, b);
            }
        }
        // 回调高度给外部
        if (mListener != null) {
            mListener.onSizeChanged(b - t);
        }
    }

    // 自定义的尺寸变化 listener
    public interface OnSizeChangedListener {
        void onSizeChanged(int newHeight);
    }
}
