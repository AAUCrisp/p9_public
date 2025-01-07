# All this is using _Jetpack Compose_

# Main Components

The components used to create a barebones UI.


## "Scope"  _(Trailing Lambda Syntax)_
A bit weird, but they're using "pure" scope things, which aren't _variables_ or _functions_.
It probably makes sense, if you're smarter than me.

These are apparently called _Trailing Lambda Syntax_... at least in *Jetpack Compose*.

This is a way to parse the last parameter of a function, "outside" of the functions usual "parsing parenthesis".

#### Example  
```Kotlin 
Row( 
    Modifier.size(40.dp), 
    content = {
        Text("Some text")
    }
)
```  
is because of `content` being the last parameter of the function (**not just last used parameter**), the same as

```Kotlin 
Row( Modifier.size(40.dp) ) {
    Text("Some text")
}
```  


### setContent
Is the function that defines your layout, using the functions with the `@Composable` annotation.  

## Functions

### _Row_ \& _Column_
They do what is says on the tin.


### _Box_
A _UI_ container for stacking/overlapping components.  
Can be used for background images for example.


### _Surface_
Represents a section of the _UI_ where you can alter the apperance.

Surround the content with a _container_ called `Box`... obviously...

Can do so by marking the content, pressing `Alt + Enter` and select "_Surround with Widget_" and then selecting "_Surround with Container_".  
Or just make a `Box`.

Then "deleting it" again, by renaming it from `Box` to `Surface()`..............  
**WHY ON EARTH MAKE THE BOX THEN?!?!?!**





## Annotations
### `@Composable`
Functions with this annotation are named Capitalized and can't _return_ anything.


### `@Preview`

For having the _Preview_ functionality of _Android Studio_ use this function for previews, so you can work with UI with live updates, instead of having to build and send the app to the _Android_ emulator or device, with each change.  
It's functionality is pretty limited though, as it won't render a preview using a `ViewModel`.
There's some workarounds, but don't wanna deal with it right now.  

Can check this link here:
https://developer.android.com/develop/ui/compose/tooling/previews#preview-viewmodel



# UI Components

## Text

### `Row`

### `Column`

### `Text()`
To add text to a UI component

#### Parameters (with value examples)
- `text = <your text here>`
- `fontSize = 100.sp` - _sp_ * is for _Scalable Pixels_

###### `sp`  is for _Scalable Pixels_



### Image

#### Parameters (with value example)
- `painter = image_resource_ID`
- `contentDescription = "Image of a flying hippo"`
- `contentScale = ContentScale.Crop`
- `alpha = 0.5F` - for opacity (_F_ is to convert to _float_ which this parameter demands.)


# Styling
For styling the UI components, after setting them up.

## `modifier`
To style some content in a `@Composable`.


### Vertical \& Horizontal Arrangement
See the last part of this guide...
https://developer.android.com/codelabs/basic-android-kotlin-compose-add-images?continue=https%3A%2F%2Fdeveloper.android.com%2Fcourses%2Fpathways%2Fandroid-basics-compose-unit-1-pathway-3%23codelab-https%3A%2F%2Fdeveloper.android.com%2Fcodelabs%2Fbasic-android-kotlin-compose-add-images#4


# Libraries

## `androidx.compose.ui.graphics.Color`
For colors... obviously.


