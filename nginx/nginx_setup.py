import subprocess
import os
import time

# config_path = "./nginx.conf"
# config_path = "./nginx/nginx.conf"
# config_path = "./nginx"


def start_nginx_with_config(config_path:str):
    try:
        # Ensure the configuration file exists
        if not os.path.isfile(config_path):
            raise FileNotFoundError(f"Configuration file not found: {config_path}")

        # Command to start NginX with the custom config
        command = ["sudo", "nginx", "-c", config_path]

        # Execute the command
        subprocess.run(command, check=True)

        print(f"NginX started with configuration: {config_path}")

    except subprocess.CalledProcessError as e:
        print(f"Failed to start NginX: {e}")
    except FileNotFoundError as e:
        print(e)
    except Exception as e:
        print(f"An unexpected error occurred: {e}")




def stop_nginx():
    try:
        subprocess.run(["sudo", "nginx", "-s", "quit"], check=True)
        time.sleep(1)
        print("NginX stopped.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to stop NginX: {e}")




def restart_nginx_with_config(config_path):
    # try:
    #     subprocess.run(["sudo", "nginx", "-s", "reload"], check=True)
    #     # subprocess.run(["sudo", "nginx", "-s", "HUP"], check=True)
    #     print("NginX reloading gracefully.")
    
    # except subprocess.CalledProcessError as e:
    #     print(f"Failed to reload NginX config: {e}")
    
    try:
        # Stop NginX if it's already running
        print("Stopping existing NginX process...")
        stop_nginx()

        # Start NginX with the custom configuration
        print("Starting NginX with custom configuration...")
        start_nginx_with_config(config_path)

    except Exception as e:
        print(f"An error occurred during NginX restart: {e}")








# print("Imported NginX Setup Correctly")


# config_files = os.listdir(config_path)
# print(config_files)


if __name__ == "__main__":
    # Specify your custom nginx.conf file
    # config_path = "./nginx.conf"
    config_path = "/home/bamse/Desktop/p9/back/nginx/nginx.conf"

    # Start NginX with the custom configuration
    # start_nginx_with_config(config_path)
    restart_nginx_with_config(config_path)