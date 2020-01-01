package com.nplix.android_activity_demo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class KotlinActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_kotlin)
        
        supportActionBar?.setTitle(R.string.title)
    }
}
