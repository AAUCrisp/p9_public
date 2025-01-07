# Backend Part of the P9: Stream Performance Project
Switch back to *main* branch if you are looking for the *Android* app part of the project.  

___
___

The server is currently logging the *CMCD* data to a file (`./logs/cmcd_access.log`), but I am currently looking into having an actively running a *Server Service* also for active monitoring.


___
___

## Initial Setup

### Dependancies

- NginX
- Docker
- Python 3+
    - FastAPI  (PIP)
    - Uvicorn   (PIP)



### Dash / HLS Media Content
You need to create/download some *Dash* or *HLS* content for the server to serve.  
Which should be placed in a *media* directory, with another directory for *Dash* and *HLS* in it.  
The structure of the content in there is dependant on your *playlist* files (*mpd* and *m3u8*)

```
├── media  
│   ├── dash  
│   │   ├── **/  
│   │   ├── content_1/  
│   │   ├── content_2/  
│   │   ├── **/*.mpd   
│   │   ├── *.mpd  
│   │   ├── content_1.mpd  
│   │   ├── content_2.mpd  
│   |  
│   ├── hls  
│   │   ├── **/  
│   │   ├── content_1/  
│   │   ├── content_2/  
│   |   ├── **/*.m3u8  
│   │   ├── *.m3u8  
│   │   ├── content_1.m3u8  
│   │   ├── content_2.m3u8  
```

Need to update the paths for these in the `nginx.conf`.  
Meaning that this structure is technically optional...  

Added a *Shell* script, to pull a prepared sample and set it up.


### Preparing the Content Server

Open the *nginx/nginx.conf* file and edit the:
- `user bamse;` **--** to `user http` (or a user with privilege to access the files at the current destination).
- `root` and `alias` **--** to the directories where you have the backend (and media) files. 
- `access_log` **--** to the *log* file location, **do not** delete the `cmcd` at the end of the line!  


### CMCD Handler

Go to the `cmcd_handler` folder, and run a `docker build -t cmcd_handler .`


___
___


## Usage


### Content- \& *CMCD* Server
Run the *nginx_setup.py* in the *nginx* folder.  
This will stop the current *NginX* server if one is already running, and then boot up a new one, using the *nginx.conf* in the directory.  
It will throw an error if no *NginX* server is running beforehand, but it does not matter, it will still boot up a new one using the new config.


#### For the "Active Handler"
The `cmcd_handler.py` can be booted up as an app with *Uvicorn* (or something similar).  

By running the *BASH* command `uvicorn cmcd_handler:app --host 127.0.0.1 --port 5000`.  
Can add `--reload` at the end to have it reload the script every time there is a change to the file.

But as using *Uvicorn* is a little annoying, I've set up a *Docker* version, to make it easier to "get rid of".

Start it by using the command `docker run -d -p 5000:5000 --name cmcd-handler-container -v /home/bamse/Desktop/p9/back/media:/app/media cmcd_handler`  
You can omit the `-d` argument if you wanna see it's output.  

**OBS:** after the `-v` argument the first half, if **your** path to your media-files.  
Edit accordingly