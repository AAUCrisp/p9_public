# Overwrite Functions
## `onCreate()` is the `main` function of _Android_  


## `onStart()` when... what?


## `onDestroy()` is when shutting down the app


# Resources
_Jetpack Compose_ can access resources using the `R` class in the project.  

This is being automatically created by the _Android Project_ and is a part of the project.

### Resource IDs
They're usually just from the folder-structure in the resource directory.  

So if you have an image in the `res/drawable` folder called _graphic.png_, it'll likely be accessed by `R.drawable.graphic`



# Gradle

## Compiling \& Config Files
_Gradle_ files tend to be either written in Gradle's own _Groovy DSL_ language which is heavily based on _Apache Groovy_'s language, which is usually referred to in documentations as just _Groovy_, or they can be written in _Kotlin DSL_, which is based on its parent namesake _Kotlin_ language.  

You can tell the difference between _Groovy Gradle_ files and _Kotlin DSL Gradle_ files by looking at the file extension, a `settings.gradle` is a _Groovy_ script and `settings.gradle.kts` is a _Kotlin DSL_ script.

#### Info From:
_https://stackoverflow.com/questions/70754987/some-build-gradle-files-have-different-syntaxs-then-others_

**Which also links to:** *Gradle's own conversion documentation.*
*https://docs.gradle.org/current/userguide/migrating_from_groovy_to_kotlin_dsl.html#migrating_groovy_kotlin*


# Dependancies
This is a weird subject, when it comes to guides.
Guides everywhere is as mentioned above using the _Groovy_ syntax for the _Gradle_ file.  
On top of this, _Android Studio_ wants to have the library definitions in a separate file (which makes complete sense, I just wish that there was some attention towards the subject), to have them easily updated in a single place (I assume), instead of having to browse through all the thousands of `build.gradle` files that are everywhere...  

### This file is called `libs.versions.toml`
In this file, in the _alias_ names you give to them, the `-` is replaced by a `.` when used in `build.gradle`.  

**_I.E.:_**
```toml 
[versions]
dagger = "2.46.1"
kspVersion = "2.0.20-1.0.24"

[libraries]
dagger = { module = "com.google.dagger:dagger", version.ref = "dagger" }

[plugins]
kotlin-ksp = { id = "com.google.devtools.ksp", version.ref = "kspVersion" }
```
Please notice that the attributes used for _libraries_ and _plugins_ are not the same. _Plugins_ are still accessed through the `libs` object (using `libs.plugins`) when imported in `build.gradle` files, like:
```groovy
plugins {
    alias(libs.plugins.kotlin.ksp)
}

dependencies {
    implementation(libs.dagger)
}
```

There is also the fact that it's switching between `module` and `group` for setting up the dependencies.
This apparently makes no difference, if it's just set up correctly.

```toml 
dagger = { module = "com.google.dagger:dagger", version.ref = "dagger" }
```  
is the exact same as

```toml 
dagger = { group = "com.google.dagger", name = "dagger", version.ref = "dagger" }
```  

## Dagger - Hilt
For dependency injection, making boilerplate kode for you to minimize annoying and "mistake prone" code.
_Dagger_ is the "parent" and _Hilt_ is build on top of it, for better _Android_ development options.