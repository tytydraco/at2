package com.draco.rive_sample

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.material3.Scaffold
import androidx.compose.ui.Modifier
import androidx.compose.ui.viewinterop.AndroidView
import androidx.startup.AppInitializer
import app.rive.runtime.kotlin.RiveAnimationView
import app.rive.runtime.kotlin.RiveInitializer
import app.rive.runtime.kotlin.core.Fit
import com.draco.rive_sample.ui.theme.Rive_sampleTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()

        // Initialize Rive.
        AppInitializer.getInstance(applicationContext)
            .initializeComponent(RiveInitializer::class.java)

        setContent {
            Rive_sampleTheme {
                Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
                    AndroidView(
                        modifier = Modifier
                            .padding(innerPadding)
                            .wrapContentSize()
                            .fillMaxSize(),
                        factory = { context ->
                            RiveAnimationView(context).also {
                                // Load Rive resource from raw resources and configure.
                                it.setRiveResource(
                                    resId = R.raw.input,
                                    fit = Fit.LAYOUT,
                                    autoBind = true,
                                    autoplay = true,
                                )

                                it.layoutScaleFactor = 1f

                                // Manage the View Model Instance (VMI) as needed.
                                //it.controller.activeArtboard!!.viewModelInstance!!
                            }
                        }
                    )
                }
            }
        }
    }
}