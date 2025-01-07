from includes.setup import *
import signal
from fastapi import FastAPI, Request, BackgroundTasks
from fastapi.responses import Response
from fastapi.responses import JSONResponse
# from fastapi.responses import FileResponse, JSONResponse
# from fastapi.staticfiles import StaticFiles
# from pathlib import Path
import os
# import re
# from datetime import datetime

from includes.db import *




app = FastAPI()


# @app.post("/")
@app.post("/cmcd_handler")
# async def process_cmcd(request: Request):
async def process_cmcd(request: Request, background_tasks: BackgroundTasks):
    

    # Extract CMCD headers
    request_data = {
        "Host": request.headers.get("host", "No Host found"),
        "HTTP-Request": request.headers.get("request", "No Request found"),
        # "Client IP": request.headers.get("x-real-ip", "No X-Real-IP found"),
        "Custom-Headers-Map": request.headers.get("http_headers", "No HTTP Headers found"),
        "CMCD-Object": request.headers.get("cmcd-object", None),
        "CMCD-Request": request.headers.get("cmcd-request", None),
        "CMCD-Session": request.headers.get("cmcd-session", None),
        "CMCD-Status": request.headers.get("cmcd-status", None),
    }

    print("\n\n_____________________________________\n Responding to Content Server:\n")

    background_tasks.add_task(store_request_data, request_data)
    return Response(status_code=200)






#########################################
##  --  Data Storing Area  --
#             Start




def store_request_data(request_data):

    # Insert into database here...
    db = Database()



    ###########################################
    #  --  Header Handling Area  --
    #           Start

    if request_data['CMCD-Object'] is not None:


        
        log_values = {}
        session_values = {}


        if verbose:
            print('______________________________________\n Untouched Headers Contain:')

            for key, value in request_data.items():
                print(f"    {key}: {value}\n")





        # #############################################
        # #  --  Active Stream  --

        # # Match /dash, /hls, or /media and the next subdomain
        # match_stream = re.search(r"/(dash|hls|media)/[^/]+", request_data['HTTP-Request'] )
        # match_request = re.search(r"/(dash|hls|media)/[^/]+", request_data['HTTP-Request'] )

        # log_values['active_stream'] = match_stream.group(0) if match_stream else 'Something is weird...'
        # log_values['object_requested'] = match_request.group(0) if match_request else 'Something is weird...'

        # # print(log_values['active_stream'])



        #############################################
        #  --  CMCD Header Preperation  --
        if verbose:
            print('\n\n\n_______________________________________________\n Parsing Headers for Database Insertion:')


        log_values.update( cmcd_to_dict( request_data["CMCD-Object"] ) )
        if verbose:
            print('  --  CMCD Object   --  Done')



        log_values.update( cmcd_to_dict( request_data["CMCD-Request"] ) )
        if verbose:
            print('  --  CMCD Request  --  Done')



        log_values.update( cmcd_to_dict( request_data["CMCD-Session"] ) )
        if verbose:
            print('  --  CMCD Session  --  Done')



        if "CMCD_Status" in request_data.keys():
            log_values.update( cmcd_to_dict( request_data["CMCD-Status"] ) )
        if verbose:
            print('  --  CMCD Status   --  Done')






        ###########################################
        #  --   Session Preparation Area   --
        #           Start


        #  --  Prepare config to check for Session ID in Database
        session_check_params = {
            'where': {
                'session_id': log_values['session_id']
                }
            }

        session_check = db.fetch('session', session_check_params)

        # if db.fetch('session', session_check_params):       # Checking if it's a new or ongoing Session
        if not session_check:       # Checking if it's a new or ongoing Session

            ###################################
            #  --   New Session   --

            print(f'\n\n--------------------------------------\n  --  First Log of Session  --\n--------------\n Session ID: {log_values["session_id"]}')


            session_values['session_id'] = log_values['session_id']




            if verbose:
                print(f"\n\n\n  Custom Headers Map (Split) are:")

            for key, value in enumerate( request_data["Custom-Headers-Map"].split(' | ') ):
            # for key, value in enumerate(other_headers):
            # for i in range(other_headers):


                compare_key = other_header_tags[key]
            
                if verbose:
                    print(f"    {key} contains: {value}")
                    print(f"----  compare_key contains: {compare_key}\n")




                if compare_key != 'user_agent' and compare_key != 'server_ip' and compare_key != 'server_time' and compare_key != 'object_requested':
                    
                    session_values[compare_key] = value


                else:
                    #  --  Enter into correct (Log) table for the database
                    if compare_key == "server_ip" or compare_key == "server_time":
                        log_values[compare_key] = value



                    #  --  User Agent Header Processing  --  NO REAL STANDARD FOR THIS... WILL BREAK IN THE REAL WORLD!!
                    elif compare_key == "user_agent":
                        
                        session_values['http_user_agent'] = value

                        session_values.update( process_user_agent( value ))
                    
                    elif compare_key == "object_requested":

                        log_values[compare_key] = value
                        log_values.update( extract_playlist(value) )

        

                    

        else:

            ###################################
            #  --   Ongoing Session   --

            for key, value in enumerate( request_data["Custom-Headers-Map"].split(' | ', 3)[:3] ):

                log_values[other_header_tags[key]] = value

                if other_header_tags[key] == 'object_requested':
                    log_values.update( extract_playlist(value) )




        #           End
        #  --   Session Preparation Area   --
        ###########################################



        # #  --  Move entries to where they belong
        for key, value in log_to_session.items():

            temp_val = log_values.pop(key, None)
            if temp_val != None:
                session_values[value] = temp_val



        print(f"\n\n\n  Log Entries are:")
        for key, value in log_values.items():
            print(f"    {key} contains: {value}\n")


        print(f"\n\n\n  Session Entries are:")
        for key, value in session_values.items():
            print(f"    {key} contains: {value}\n")
        


    #            End
    #  --  Header Handling Area  --
    ###########################################
    #  --   Database Insertion Area   --
    #           Start


        if not session_check:
            print("New Session for Insertion")

            db.insert('session', session_values)

        db.insert('log', log_values)



    else:
        print("\n\n\n\n-----------\n----------------------\n-----------------------------------\n   Request for Manifest\n---------------------------------\n---------------------\n-----------\n\n\n")




if __name__ == '__main__':
    # uvicorn.run(app, host='localhost', port=8000)
    uvicorn.run(app, host='localhost', port=5000)