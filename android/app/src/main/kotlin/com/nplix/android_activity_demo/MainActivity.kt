package com.nplix.android_activity_demo

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  private val CHANNEL = "com.startActivity/testChannel"
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    MethodChannel(flutterView,CHANNEL).setMethodCallHandler{ call,result ->
      if(call.method.equals("StartSecondActivity")){
        val intent=Intent(this,KotlinActivity::class.java)
        startActivity(intent)
        result.success("ActivityStarted")
      }
      else{
        result.notImplemented()
      }
    }
  }
}
