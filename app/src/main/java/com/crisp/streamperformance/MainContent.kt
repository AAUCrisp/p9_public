package com.crisp.streamperformance


import androidx.activity.compose.rememberLauncherForActivityResult
import androidx.activity.result.contract.ActivityResultContracts
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.aspectRatio
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.AddLink
import androidx.compose.material.icons.filled.FileOpen
import androidx.compose.material3.ElevatedButton
import androidx.compose.material3.Icon
import androidx.compose.material3.IconButton
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.DisposableEffect
import androidx.compose.runtime.getValue
import androidx.compose.runtime.setValue
import androidx.compose.runtime.collectAsState
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
import androidx.hilt.navigation.compose.hiltViewModel
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleEventObserver
import androidx.lifecycle.compose.LocalLifecycleOwner
import androidx.media3.ui.PlayerView



@Composable
fun MainContent() {

    val videoUrl = "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"
    val desktopUrl = "http://192.168.50.85:80/video/bbb_30fps.mpd"
    val serverUrl = "http://192.168.50.3:80/video/bbb_30fps.mpd"        //  ADD YOUR OWN SERVER IP
    val norlysDashUrl = "https://dck-aws.cdn.stofa.net/live1/cl290/dcx290/11_17.mpd"
    val norlysHlsUrl = "https://dck-aws.cdn.stofa.net/live1/cl290/dcx290/11_17.m3u8"




//  Initial Setup
    val viewModel = hiltViewModel<MainViewModel>()
    val videoItems by viewModel.videoItems.collectAsState()
    val selectVideoLauncher = rememberLauncherForActivityResult(
        contract = ActivityResultContracts.GetContent(),
        onResult = { uri ->
            uri?.let(viewModel::addVideoUri)
        }
    )


//  Setup Lifecycle stuff
    var lifecycle by remember {
        mutableStateOf(Lifecycle.Event.ON_CREATE)
    }
    val lifecycleOwner = LocalLifecycleOwner.current

    //  Observe app "life"
    DisposableEffect(lifecycleOwner) {
        val observer = LifecycleEventObserver { _, event ->
            lifecycle = event
        }
        lifecycleOwner.lifecycle.addObserver(observer)

        onDispose {
            lifecycleOwner.lifecycle.removeObserver(observer)
        }
    }

///////////////////////////
//  --  Build UI  --
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp)
        ) {
        AndroidView(
            factory = { context ->
                PlayerView(context).also {
                    it.player = viewModel.player
                }
            },
            update = {
                when (lifecycle) {
                    Lifecycle.Event.ON_PAUSE -> {   // On app pause, pause playback
                        it.onPause()
                        it.player?.pause()
                    }

                    Lifecycle.Event.ON_RESUME -> {  // On app resume, resume playback
                        it.onResume()
                    }

                    else -> Unit
                }
            },
            modifier = Modifier
                .fillMaxWidth()
                .aspectRatio(16 / 9f)
        )

        Spacer( modifier = Modifier.height(8.dp) )

        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.End,
            modifier = Modifier.fillMaxWidth()
            ) {

            ElevatedButton(
                onClick = {                         // "Link Video" button
                    viewModel.addVideoUrl(desktopUrl)
                },
            ) {
                Text("Desktop Dash")
            }

            ElevatedButton(
                onClick = {                         // "Link Video" button
                    viewModel.addVideoUrl(serverUrl)
                },
            ) {
                Text("Server Dash")
            }
        }

        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.End,
            modifier = Modifier.fillMaxWidth()
            ) {

            ElevatedButton(
                onClick = {                         // "Link Video" button
                    viewModel.addVideoUrl(norlysDashUrl)
                },
            ) {
                Text("DR1 Dash")
            }

            ElevatedButton(
                onClick = {                         // "Link Video" button
                    viewModel.addVideoUrl(norlysHlsUrl)
                },
            ) {
                Text("DR1 HLS")
            }
        }

        Row(
            verticalAlignment = Alignment.CenterVertically,
            horizontalArrangement = Arrangement.End,
            modifier = Modifier.fillMaxWidth()
            ) {

            IconButton(
                onClick = {                         // "Add Video" button
                    selectVideoLauncher.launch("video/*")       // Video/mp4 tells the accepted formats
                    },
                modifier = Modifier.padding(8.dp)
                ) {
                Icon(
                    imageVector = Icons.Default.FileOpen,
                    contentDescription = "Select Video"
                )
            }

            IconButton(
                onClick = {                         // "Link Video" button
                    viewModel.addVideoUrl(videoUrl)
                    },
                modifier = Modifier.padding(8.dp)
                ) {
                Icon(
                    imageVector = Icons.Default.AddLink,
                    contentDescription = "Link Video"
                )
            }
        }

        Spacer( modifier = Modifier.height(16.dp) )

        LazyColumn(         //  Playlist UI
            modifier = Modifier.fillMaxWidth()
            ) {

            items(videoItems) { item ->
                Text(
                    text = item.name,
                    modifier = Modifier
                        .fillMaxWidth()
                        .clickable {
                            viewModel.playVideo( item.contentUri )
                        }
                        .padding(12.dp)
                )
            }
        }
    }
}



//  TEST UI
@Composable
fun MainContentTest() {

    Scaffold(modifier = Modifier.fillMaxSize()) { innerPadding ->
        Greeting(
            name = "Bamse",
            modifier = Modifier.padding(innerPadding)
        )
    }
}
