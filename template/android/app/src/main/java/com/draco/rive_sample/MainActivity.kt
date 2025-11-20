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
                                    artboardName = "calendar_artboard_new",
                                    stateMachineName = "calendar_statemachine",
                                    fit = Fit.LAYOUT,
                                    autoBind = false,
                                    autoplay = true,
                                )

                                it.layoutScaleFactor = 4f

                                // Manage the View Model Instance (VMI) as needed.
                                //it.controller.activeArtboard!!.viewModelInstance!!

                                it.controller.setTextRunValue(
                                    "label_run",
                                    "ج",
                                    "label_artboard_01"
                                )

                                it.controller.setTextRunValue(
                                    "label_run",
                                    "خ",
                                    "label_artboard_02"
                                )

                                it.controller.setTextRunValue(
                                    "label_run",
                                    "ع",
                                    "label_artboard_03"
                                )

                                it.controller.setTextRunValue(
                                    "label_run",
                                    "ج",
                                    "label_artboard_04"
                                )

                                it.controller.setTextRunValue(
                                    "label_run",
                                    "ح",
                                    "label_artboard_05"
                                )

                                it.controller.setBooleanState(
                                    "calendar_statemachine",
                                    "earned_anim_trig",
                                    true,
                                )
                            }
                        }
                    )
                }
            }
        }
    }
}