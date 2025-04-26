package com.example.myflutterproject

import io.flutter.embedding.engine.plugins.FlutterPlugin


class PigeonPlugin : FlutterPlugin, FlutterToNative {
    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        FlutterToNative.setUp(
             binding.binaryMessenger,
            this
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }

    override fun loadNativeInfo(id: Long): NativeBean {
       return NativeBean(0L, "native info");
    }

}