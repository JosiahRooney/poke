"""
    Routes Configuration File

    Put Routing rules here
"""
from system.core.router import routes

routes['default_controller'] = 'Users'
routes['/'] = "Users#index"
routes['/pokes'] = "Users#pokes"
routes['POST']['/register'] = "Users#register"
routes['/poke/user/<target_id>'] = "Users#poke"
routes['/logout'] = "Users#logout"
routes['POST']['/login'] = "Users#login"