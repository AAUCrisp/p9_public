package com.crisp.streamperformance

import android.app.Application
import androidx.annotation.OptIn
import androidx.media3.common.Player
import androidx.media3.common.util.UnstableApi
import androidx.media3.exoplayer.ExoPlayer
import androidx.media3.exoplayer.source.DefaultMediaSourceFactory
import androidx.media3.exoplayer.upstream.CmcdConfiguration
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.android.components.ViewModelComponent
import dagger.hilt.android.scopes.ViewModelScoped
import com.crisp.streamperformance.TraceData.cmcdConfigurationFactory


@Module
@InstallIn(ViewModelComponent::class)
object StreamPlayerModule {
    @OptIn(UnstableApi::class)
    @Provides
    @ViewModelScoped
    fun provideVideoPlayer( app: Application) : Player {


        // Create media source factory and set default cmcdConfigurationFactory.
        val mediaSourceFactory =
            DefaultMediaSourceFactory( app )
                .setCmcdConfigurationFactory(cmcdConfigurationFactory)
//                .setCmcdConfigurationFactory(CmcdConfiguration.Factory.DEFAULT)       // The Default CMCD Configuration

        // Then apply the newly created MediaSourceFactory (w. CMCD) to ExoPlayer
        return ExoPlayer.Builder(app)
            .setMediaSourceFactory(mediaSourceFactory)
            .build()
    }

    @Provides
    @ViewModelScoped
    fun provideMetaDataReader(app: Application): MetaDataReader {
        return MetaDataReaderImpl(app)
    }
}