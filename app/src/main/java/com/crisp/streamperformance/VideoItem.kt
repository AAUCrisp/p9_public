package com.crisp.streamperformance

import androidx.media3.common.MediaItem
import android.net.Uri

data class VideoItem (
    val contentUri: Uri,
    val mediaItem: MediaItem,
    var name: String
)