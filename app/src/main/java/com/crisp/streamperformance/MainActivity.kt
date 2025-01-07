package com.crisp.streamperformance

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.layout.padding
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Modifier
import androidx.compose.ui.tooling.preview.Preview
import com.crisp.streamperformance.ui.theme.StreamPerformanceTheme
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.dp
import dagger.hilt.android.AndroidEntryPoint


@AndroidEntryPoint
class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {    // The "main" of Android
        super.onCreate(savedInstanceState)

        // Create factories
//        val httpDataSourceFactory = createHttpDataSourceFactoryWithSessionId()
//        val cmcdConfiguration = createCmcdConfiguration()
//        val cmcdFactory = CmcdDataSource.Factory(httpDataSourceFactory, cmcdConfiguration)


        setContent {        // Defines your layout through composable functions
            StreamPerformanceTheme {


                MainContent()
//                MainContentUrl(videoUrl = videoUrl)

            }
        }
    }
}






@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Surface( color = Color.Green ) {
        Text(
            text = "Hello $name!",
            modifier = modifier.padding(24.dp)
        )
    }
}

@Preview(showBackground = true)
@Composable
fun AppPreview() {
    StreamPerformanceTheme {
//        MainContent()
        MainContentTest()
//        Greeting("Android")
    }
}

