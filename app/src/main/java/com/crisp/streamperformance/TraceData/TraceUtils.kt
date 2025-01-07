package com.crisp.streamperformance.TraceData


import androidx.annotation.OptIn
import androidx.media3.common.MediaItem
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.upstream.CmcdConfiguration
import com.google.common.collect.ImmutableListMultimap
import java.util.UUID

val sessionId = UUID.randomUUID().toString()

@OptIn(UnstableApi::class)
val cmcdConfigurationFactory = object : CmcdConfiguration.Factory {
    override fun createCmcdConfiguration(mediaItem: MediaItem): CmcdConfiguration {
        val cmcdRequestConfig = object : CmcdConfiguration.RequestConfig {
//            override fun isKeyAllowed(key: String): Boolean {
//                return key == "br" || key == "bl"
//            }

            override fun getCustomData(): ImmutableListMultimap<@CmcdConfiguration.HeaderKey String, String> {
                return ImmutableListMultimap.of(
                    CmcdConfiguration.KEY_CMCD_SESSION, "X-SID=FindMeForCustomOutputsLater,usr=57694")
            }

//            override fun getRequestedMaximumThroughputKbps(throughputKbps: Int): Int {
//                return 5 * throughputKbps
//            }
        }
//
//        val sessionId = UUID.randomUUID().toString()
        val contentId = UUID.randomUUID().toString()

//        return CmcdConfiguration(sessionId, contentId, cmcdRequestConfig)
        return CmcdConfiguration(sessionId, contentId, cmcdRequestConfig,
            CmcdConfiguration.MODE_REQUEST_HEADER
        )
    }
}
