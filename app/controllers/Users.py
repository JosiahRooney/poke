from system.core.controller import *

class Users(Controller):
    def __init__(self, action):
        super(Users, self).__init__(action)
        self.load_model('User')
        self.load_model('Poke')
        self.db = self._app.db
   
    def index(self):
        return self.load_view('index.html')

    def register(self):
        result = self.models['User'].add_user(request.form)
        if result['status']:
            flash("Successfully registered!", "success")
            session['user'] = dict(result['user'])
            return redirect('/pokes')
        for error in result['errors']:
            flash(error, "error")
        return redirect('/')

    def login(self):
        result = self.models['User'].login(request.form)
        if result['status']:
            flash("Successfully logged in!","success")
            session['user'] = dict(result['user'])
            return redirect('/pokes')
        for error in result['errors']:
            flash(error, "errors")
        return redirect('/')

    def pokes(self):
        user = self.models['User'].get_user(session['user']['user_id'])             # get me
        users = self.models['Poke'].get_all()                                       # get them
        pokes = self.models['Poke'].get_pokes_by_user(session['user']['user_id'])   # get pokes for little box
        if pokes['pokes']:
            total_pokes = 0
            for poke in pokes['pokes']:
                print poke
                total_pokes += 1
        else:
            total_pokes = 0
        if user:
            return self.load_view('pokes.html', user=user['user'], users=users['pokes'], pokes=pokes['pokes'],
                                  total_pokes=total_pokes)

    def poke(self, target_id):
        poke = self.models['Poke'].add_poke(session['user']['user_id'], target_id)
        if poke['status']:
            flash("User poked!")
            return redirect('/pokes')

    def logout(self):
        session.clear()
        flash("Successfully logged out!", "success")
        return redirect('/')