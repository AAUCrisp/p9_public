import re

# import os
# import argparse         # For parsing terminal arguments
# import sys
# from fastapi import FastAPI, Request
# from fastapi.responses import FileResponse, JSONResponse
# from fastapi.staticfiles import StaticFiles
# from pathlib import Path


# CWD = os.getcwd()
# print(CWD)



###########################################
#  --  Argument Parsing Setup  --
#               Start

# parser = argparse.ArgumentParser()
# parser.add_argument('-ip', type=str, required=False)
# parser.add_argument('-dev', action=argparse.BooleanOptionalAction)



# args = parser.parse_args()    # The array containing our arguments

# # print(args)
# argsMsg = ' - Arguments Inserted' if len(sys.argv) > 1 else " - Program running without arguments"
# print(argsMsg)


# if args.dev:
#     print("Dev-Mode Activated")


#            End
#  --  Argument Parsing Setup  --
###########################################
#  --   Helper Function Setup  --
#           Start



def cmcd_to_dict( cmcd_header:str, separator:str = ',' ):
# def cmcd_to_dict( cmcd_header:str, result_dict:dict, separator:str = ',' ):
    result = {}

    for item in cmcd_header.split( separator ):
        if '=' in item:
            key, value = item.split('=', 1)

            if key in db_log_tags.keys():
                result[ db_log_tags[ key ]] = value.strip('"')
        else:
            if item in db_log_tags.keys():
                result[ db_log_tags[ item ]] = 1

    return result




def process_user_agent(user_agent:str):
    result = {}

    temp_split = user_agent.split( '(')   # Split the User Agent Header into "Product" and "inside bracket" parts
    result[user_agent_tags[0]] = temp_split[0]      # Insert "Product" at "client_application" tag

    print(f"Temp_Split is: {temp_split}")
    new_temp = temp_split[1][:-1].split('; ')
    print(f"New Temp is: {new_temp}")


    for agent_key, agent_value in enumerate( new_temp):      # Loop over the data inside the brackets
    # for agent_key, agent_value in enumerate(temp_split[1][:-1].split('; ')):      # Loop over the data inside the brackets
        
        if user_agent_tags[agent_key+1] in db_session_tags:
            result[user_agent_tags[agent_key+1]] = agent_value      # Should REALLY set this up as a RegEx, as they seem to be pretty different, from application to application

    return result




def extract_playlist(request:str):
    result = {}


    #############################################
    #  --  Active Stream  --

    # Match /dash, /hls, or /media and the next subdomain
    match_stream = re.search(r"/(dash|hls|media)/[^/]+", request )

    result['active_stream'] = match_stream.group(0) if match_stream else 'Something is weird...'

    # print(source_dict['active_stream'])

    return result



# def transfer_dict_values( source_dict:dict, target_dict:dict, key_diff:dict ):
#     for key, value in key_diff.items():
#         #  --  Move CMCD Version to where it belongs
#         temp_val = source_dict.pop(key, None)
#         if temp_val != None:
#             target_dict[value] = temp_val
    
#     return



#            End
#  --   Helper Function Setup   --
###########################################
#  --   HTTP Header Tag Setup   --
#           Start



other_header_tags = [
    'server_ip',
    'server_time',
    'object_requested',
    'client_ip',
    'user_agent',
    ]


user_agent_tags = [
    'client_application',
    'parent_platform',
    'no_idea',
    'os_version',
    'device_identity'
]



#            End
#  --   HTTP Header Tag Setup   --
###########################################
#  --  Database Information Setup  --
#           Start



db_log_tags = {
    'br': 'cmcd_encoded_bitrate',
    'bl': 'cmcd_buffer_length',
    'bs': 'cmcd_buffer_starvation',
    'cid': 'cmcd_content_id',       # Is This a Redundant Database Field?
    'd': 'cmcd_object_duration',
    'dl': 'cmcd_deadline',
    'mtp': 'cmcd_measured_throughput',
    'nor': 'cmcd_next_object',
    'nrr': 'cmcd_next_range',
    'ot': 'cmcd_object_type',
    'pr': 'cmcd_playback_rate',
    'rtp': 'cmcd_requested_max_throughput',
    'sf': 'cmcd_stream_format',
    'sid': 'session_id',            # Is This a Redundant Database Field?   How often does it change?
    # 'sid': 'cmcd_session_id',
    'st': 'cmcd_stream_type',
    'su': 'cmcd_startup',
    'tb': 'cmcd_top_bitrate',
    'v': 'SES_Version',
    'usr': 'SES_Customer'
}


log_to_session = {
    'SES_Customer': 'customer_id',
    'SES_Version': 'cmcd_version'
}


db_session_tags = [
    # 'session_id',
    'customer_id',
    'device_identity',
    'os_version',
    'client_ip',
    'client_application',
    'application_version',
    'cmcd_version',
    'http_user_agent'
]



#            End
#  --  Database Information Setup   --
###########################################
#  --  CMCD Information Setup  --
#           Start



# cmcd_keys = {
#     "br": "Encoded Bitrate",                    #  An estimation from the Client, as it's not known
#     "bl": "Buffer Length",                      #  Only used with object-type "v", "a" or "av"
#     "bs": "Buffer Starvation",                  #  Only included if there's been buffering issues
#     "cid": "Content ID",
#     "d": "Object Duration",                     #  Segment length
#     "dl": "Deadline",                           #  How long til the Segment is needed
#     "mtp": "Measured Throughput",               #  Should include "it all" even if being served from several servers
#     "nor": "Next Object Request",               #  Path to the next Object being requested (NOT the current request)
#     "nrr": "Next Range Request",                #  NOT SURE HWAT THIS IS SUPPOSED TO BE
#     "ot": "Object Type",                        #  Video, Audio, Manifest, Subtitles, etc.
#     "pr": "Playback Rate",                      #  Multiplicative with the speed, only sent if NOT "1"
#     "rtp": "Requested Maximum Throughput",      #  Requested maximum throughput that the CLIENT considers sufficient for delivery of the content.
#     "sf": "Streaming Format",                   #  Dash / HLS / etc.
#     "sid": "Session ID",
#     "st": "Stream Type",                        #  v = Video on Demand , l  = Live
#     "su": "Startup",                            #  If urgent, after starting a stream or having buffering issues
#     "tb": "Top Bitrate",                        #  Highest Bitrate that the client is allowed to use (for ANY reason)
#     "v": "CMCD Version",                        #  CMCD version number, to help with troubleshooting
# }




# NOT USED YET!   here to keep me reminded to use in USER_AGENT... and likely other places... 
# db_tag_regex = {
    # 'ip': """/((^\s*((([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5])\.){3}([0-9]|[1-9][0-9]|1[0-9]{2}|2[0-4][0-9]|25[0-5]))\s*$)|(^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*$))/""",

# }
