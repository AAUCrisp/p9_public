import mariadb
import sys

verbose = 1



def array_to_string(array):
    str_values = str(array)
    str_values = str_values.replace("[", "(")
    str_values = str_values.replace("]", ")")
    str_values = str_values[2:-2]

    return str_values



def dict_depth(dic, level = 1):

    str_dic = str(dic)
    counter = 0
    for i in str_dic:
        if i == "{" or i == "[":
            counter += 1
        elif i == "}" or i == "]":
            break

    return(counter)



def transposeArray(matrix):
    
    # print(f"Array in Transpose is: {matrix}")

    length = len(matrix)

    for i, key in enumerate(matrix):
        
        depth = len(matrix[key])
        global result

        if i == 0:
            result = [[None for j in range(length)] for i in range(depth)]
            # print(f"Empty array has structure {result}")

        for j, value in enumerate(matrix[key]):

            result[j][i] = value

            # print(f"""
            # In Transpose:
            #     i is: {i}
            #     key is: {key}
            #     j is: {j}
            #     value is: {value}
            #     array is now: {array}""")
    
    return result





class Database():

    def __init__(self, ip="192.168.50.3"):
    # Connect to MariaDB Platform
        try:
            self.conn = mariadb.connect(
                user="p9",
                password="2IvåWnYfegæænUOT5O3øaq5P",
                host=ip,
                port=3306,
                database="p9"
            )
            # print("Connected to Database Successfully")

        except mariadb.Error as e:
            print(f"Error connecting to MariaDB Platform: {e}")
            sys.exit(1)

        # Get Cursor
        self.cur = self.conn.cursor()









##########################################
##  --  Fetch Area --
############

    ######################################
    #  --  General Fetch function  --

    def fetch(self, table:str, setup:dict = None):
        """General Fetch Function
        -
        Will by default return everything in the requested table, as is configurable to whatever needed.

        
        Args:
        -----
        - `table (str)`: The table to get data from.
        - `setup (dict, optional)`: Configuration to specify the needs of your query.

        ________  

        Setup Options:
        -----
        Left ones are keys in the dict, right is values  

        - `select (str)`:  "column, other_column"  Really shouldn't be this way.
        - `where (dict)`:  {column: value}
        - `join (dict)`:  {join_table: 'OG_table.OG_column = join_table.join_column'}.  
        - `limit (int)`:  Limit number of returned rows.  
        - `order (dict)`:  {'column: 'ASC|DESC'}.  
        
        ________  
        
        Returns:
        -----
        `dict`: containing the retrieved data
        """        
        # print(setup)
        # print("Inside DB Fetch")


        # Default fetch config
        config = {'select': '*', 
            'where': None,
            'join': None,
            'limit': None,
            'order': None
            }

        # Replace defaults with set settings, if any exists
        if setup:
            config = dict(list(config.items()) + list(setup.items()))

        # print(config)

        sql = f"""
            SELECT {config['select']} 
            FROM {table}"""

        if config['join']:
            keys = list(config['join'].keys())

            for i, key in enumerate(config['join']):
                sql += f""" 
            FULL OUTER JOIN {keys[i]} 
            ON {config['join'][key]}"""


        if config['where']:
            
            # print(f"\nWhere parameters in DB is: {config['where']}\n")
            # print(f"Where OR key is: {config['where']['ip5g']}\n")

            orState = False

            for i, key in enumerate(config['where']):

                if i>0 and orState == False:     # If not first column
                    if key != "OR":
                        sql += """ 
            AND """
                    else:
                        sql += """ 
            OR """
                        orState = True

                elif i == 0:       # If first column
                    sql += """
            WHERE """

                if key != "OR":
                    sql += f"""{key}='{config['where'][key]}'"""

        if config['order']:
            sql += f"""
            ORDER BY """
            for i, key in enumerate(config['order']):
                if i > 0:
                    sql += ", "
                sql += f"{key} {config['order'][key]}"
        if config['limit']:
            sql += f"""
            LIMIT {config['limit']}"""


        if verbose:
            print(f"\nSQL Statement is:{sql}\n\n")
        self.cur.execute(sql)
        # print("Efter Execute")
        rows = self.cur.fetchall()
        # print("Efter Fetch All")
        # rows = self.cur.fetchone()


        ####################################
        ###  --  Test Printing Area  -- 
        if verbose:
            print(f"Fetched data is:")
            for row in rows:
                print(f"{row}")

        return rows






##########################################
##  --  Insert Area --
############


    ######################################
    #  --  General Insert function  --
    def insert(self, table:str, params:dict):
        """General Insert Function
        -

        
        Args:
        -----
        - `table (str)`: The table to get data from.
        - `params (dict)`:  {database_column: value}
        
        ________  
        
        Returns:
        -----
        `int`: containing the last inserted row id
        """       
        if verbose:
            print("\n\n  NEW INSERT  \nInside DB Insert\n")
        # print("Inside DB Insert")


        sql = f"""
            INSERT INTO {table}
            ("""

        sql_end = ""

        
        depth = dict_depth(params)
        global values

        if depth > 1:
            # print(f"Several Inserts Entered")
            values = transposeArray(params)
            # print(f"Transposed Values Array is: {values}")
            
            str_values = array_to_string(values)
            # str_values = self.array_to_string(values)
            # print(f"\n\nProbable Insert thing!! :  {str_values}\n")

            sql_end += str_values



        if verbose:
            print(f"\n\nParams in Insert is: {params}\n")
            # print(f"Param Array Depth is: {depth}")


        for i, key in enumerate(params):
            if i>0:     # If not first column
                sql += ", "
       
            sql += f"{key}"

            if depth == 1:
                if i>0:     # If not first column
                    sql_end += ", "

                sql_end += f"'{params[key]}'"


        # if depth > 1:
        #     str_values = array_to_string(values)
        #     str_values = self.array_to_string(values)

        #     print(f"\n\nProbable Insert thing!! :  {str_values}\n")

        #     sql_end += str_values


        sql += f""")
            VALUES ({sql_end});"""
            # RETURNING 'id'"""


        if verbose:
            print(f"\nSQL Statement is:{sql}\n\n")
        self.cur.execute(sql)
        self.conn.commit()

        # lastRow = self.cur.lastrowid()

        if verbose:
            (f"Inserted at row in {table} table: {self.cur.lastrowid}")
            # print(f"Inserted at row in {table} table: {lastRow}")

        return self.cur.lastrowid
        return lastRow





##########################################
##  --  Update Area --
############


    ######################################
    #  --  General update function  --
    def update(self, table:str, params:dict):

        if verbose:
            print(f"Params in Update is:")

            for i, key in enumerate(params):
                print(f"{params[key]}")

        sql = f"""
            UPDATE {table}
            SET """


        for i, key in enumerate(params['values']):

            if i>0:     # If not first column
                sql += ", "
            
            sql += f"{key} = {params['values'][key]}"



        for i, key in enumerate(params['where']):

            if i>0:     # If not first column
                sql += """ 
            AND """

            else:       # If first column
                sql += """
            WHERE """
        
            sql += f"""{key}={params['where'][key]}"""



        if verbose:
            print(f"\nSQL Statement is:{sql}\n\n")
        self.cur.execute(sql)
        self.conn.commit()

        # print(f"Inserted at row in {table} table: {self.cur.lastrowid}")

        return self.cur.lastrowid

    # def updateHeadend(self, data):


if __name__ == "__main__":

    db = Database()

    test = db.fetch("brand")

    params = {'session_id':'asnfujiwefd',
              'device_identity': 'nisse-fon',
              'last_active':'nu?'}
    
    db.insert('session', params)


    # for val in test:
    #     print(val)

    # try:
    #     cur.execute("SELECT * FROM brand")

    #         # Print Result-set
    #     for val in cur:
    #         print(val)
    #     # for (first_name, last_name) in cur:
    #         # print(f"First Name: {first_name}, Last Name: {last_name}")
    # except mariadb.Error as e:
    #     print(f"Error: {e}")