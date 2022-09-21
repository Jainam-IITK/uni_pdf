package com.example.uni_pdf;

import android.content.Context;
import android.util.Log;

import java.io.File;

public class IOUtils {
    public static File cacheFolder;
    /**
     * Return the folder for cache files.
     */
    private static final String TAG ="jainam";

    public static File getCacheDir(Context context) {
        Log.d(TAG, "getCacheDir: "+context);

        File cache = context.getCacheDir();
        return cache;



    }
}