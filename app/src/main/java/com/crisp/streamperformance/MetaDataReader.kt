package com.crisp.streamperformance

import android.app.Application
import android.net.Uri
import android.provider.MediaStore
import android.util.Log

data class MetaData(
    val fileName: String
)


interface MetaDataReader {
    fun getMetaDataFromUri(contentUri:Uri): MetaData?
}

class MetaDataReaderImpl(
    private val app: Application
): MetaDataReader {

//  Method to get the filename from the URI
    override fun getMetaDataFromUri(contentUri: Uri): MetaData? {

        if ( contentUri.scheme != "content" ) {

//            if (contentUri.scheme == "https") {
            if (contentUri.scheme == "https" || contentUri.scheme == "http") {
                Log.v("getMetaDataFromUri", "URI Scheme Is HTTP(S)")

                val tempFileName = contentUri.lastPathSegment



                return MetaData(
                    fileName = tempFileName ?: return null
//                        fileName = Uri.parse(fullFileName).lastPathSegment ?: return null
                    )
                }

            else {
                Log.w("getMetaDataFromUri", "URI Scheme Is Not Local Content Nor HTTP(S)")
                return null
            }
        }

        Log.v("getMetaDataFromUri", "URI Scheme Is Content")

        val fileName = app.contentResolver
            .query(
                contentUri,
                arrayOf(MediaStore.Video.VideoColumns.DISPLAY_NAME),
                null,
                null,
                null,
            )
            ?.use { cursor ->
                val index = cursor.getColumnIndex(MediaStore.Video.VideoColumns.DISPLAY_NAME)
                cursor.moveToFirst()
                cursor.getString(index)
            }
        return fileName?.let { fullFileName ->
            MetaData(
                fileName = Uri.parse(fullFileName).lastPathSegment ?: return null
            )
        }
    }
}