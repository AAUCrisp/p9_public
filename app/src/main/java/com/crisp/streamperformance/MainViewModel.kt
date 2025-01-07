package com.crisp.streamperformance

import android.net.Uri
import android.util.Log
import androidx.lifecycle.SavedStateHandle
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import androidx.media3.common.MediaItem
import androidx.media3.common.Player
import dagger.hilt.android.lifecycle.HiltViewModel
import kotlinx.coroutines.flow.SharingStarted
import kotlinx.coroutines.flow.map
import kotlinx.coroutines.flow.stateIn
import java.net.URI
import javax.inject.Inject

@HiltViewModel
class MainViewModel @Inject constructor(
    private val savedStateHandle: SavedStateHandle,
    val player: Player,
    private val metaDataReader: MetaDataReader
): ViewModel() {

    private val videoUris = savedStateHandle.getStateFlow( "videoUris" , emptyList<Uri>())      //  Get the current list of Media URIs, or create an empty one, if there isn't any
//    This a list of URIs for the videoItems, and the other URI list, is for the video-data alone?


//    The video playlist (I'd say).... but... another one... containing the same... but different?
    val videoItems = videoUris.map { uris ->
        uris.map { uri ->
            VideoItem(
                contentUri = uri,
                mediaItem = MediaItem.fromUri( uri ),
//                name = uri.name metaDataReader.getMetaDataFromUri(uri)?.fileName ?: "No Name"
                name = metaDataReader.getMetaDataFromUri(uri)?.fileName ?: "No Name"
            )
        }
    }.stateIn( viewModelScope, SharingStarted.WhileSubscribed(5000), emptyList() )

    init {
        player.prepare()
    }

//  Add another video to the playlist from local files
    fun addVideoUri(uri: Uri, name: String = "") {
        savedStateHandle["videoUris"] = videoUris.value + uri   // Update the StateHandle with the new video

//        val printoutUris = videoUris.value
//
//        if (name != "") {
//            videoItems.value.last().name = name
//        }
//        val printout = videoItems.value.last().name
//
//        Log.w( " -- HERE --", "---------------------")
//        Log.w( " -- HERE --", "---------------------")
//        Log.w( " ViewModel", "$printoutUris")
//        Log.w( " ViewModel", "$printout")
//        Log.w( " -- HERE --", "---------------------")
//        Log.w( " -- HERE --", "---------------------")

        player.addMediaItem(MediaItem.fromUri(uri))
    }

//  Add another video to the playlist via an URL
    fun addVideoUrl(url: String, name: String = "") {
        val videoUri = Uri.parse(url)
        addVideoUri(videoUri, name)
    }

//  Update currently played file
    fun playVideo(uri: Uri) {
        player.setMediaItem(
            videoItems.value.find { it.contentUri == uri }?.mediaItem ?: return
        )
    }

//  Kill the videoplayer, on app closure
    override fun onCleared() {
        super.onCleared()
        player.release()
    }
}