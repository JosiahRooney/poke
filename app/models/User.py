from system.core.model import Model

class User(Model):
    def __init__(self):
        super(User, self).__init__()

    def add_user(self, request_form):
        alias = request_form['alias']
        first_name = request_form['first_name']
        last_name = request_form['last_name']
        email = request_form['email']
        birthday = request_form['birthday']
        errors = []

        if not alias:
            errors.append("You must enter a username")
        elif len(alias) < 3:
            errors.append("You must enter at least 3 characters for your username")

        if not email:
            errors.append("You must enter an email")
        elif len(email) < 6:
            errors.append("You must enter at least 6 characters for your email")

        if not first_name:
            errors.append("You must enter a first name")
        elif len(first_name) < 2:
            errors.append("You must enter at least 2 characters for your first name")

        if not last_name:
            errors.append("You must enter a last name")
        elif len(last_name) < 2:
            errors.append("You must enter at least 2 characters for your last name")

        if not birthday:
            errors.append("You must enter your date of birth")

        if not request_form['password']:
            errors.append("You must enter a password")
        elif len(request_form['password']) < 8:
            errors.append("You must enter at least 8 characters for your password")

        if request_form['password'] != request_form['password_confirm']:
            errors.append("Your password didn't match")

        if errors:
            return {"status": False, "errors": errors}

        pw_hash = self.bcrypt.generate_password_hash(request_form['password'])

        query = "INSERT INTO users (alias, email, first_name, last_name, birthday, pw_hash, created_at, " \
                "updated_at) VALUES (" \
                ":alias, :email, :first_name, :last_name, :birthday, :pw_hash, NOW(), NOW())"
        data = {
            "alias": alias,
            "email": email,
            "first_name": first_name,
            "last_name": last_name,
            "pw_hash": pw_hash,
            "birthday": birthday
        }
        self.db.query_db(query, data)

        query = "SELECT * FROM users WHERE email = :email"
        data = {
            "email": email
        }
        user = self.db.get_one(query, data)
        return {"status": True, "user": user}

    def login(self, request_form):
        email = request_form['email']
        password = request_form['password']
        errors = []

        if not email:
            errors.append("You must enter your email address to log in")
            return {'status': False, 'errors': errors}

        if not password:
            errors.append("You must enter your password to log in")

        query = "SELECT * FROM users WHERE email = :email LIMIT 1"
        data = {"email": email}
        user = self.db.get_one(query, data)

        if not user:
            errors.append("Your username or password didn't work")

        if not self.bcrypt.check_password_hash(user.pw_hash, password):
            errors.append("Your username or password didn't work")

        if errors:
            return {'status': False, 'errors': errors}

        return {'status': True, 'user': user}


    def get_user(self, user_id):
        query = "SELECT * FROM users WHERE user_id = :user_id LIMIT 1"
        data = {
            "user_id": user_id
        }
        user = self.db.get_one(query, data)
        if user:
            return {"status": True, "user": user}
        return {"status": False, "error": "There is no user with the id of "+str(user_id)}