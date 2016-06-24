from system.core.model import Model

class Poke(Model):
    def __init__(self):
        super(Poke, self).__init__()

    def add_poke(self, user_id, target_id):
        query = "INSERT INTO pokes (users_user_id, poked_user_id, poked_at) VALUES (:users_user_id, :poked_user_id, " \
                "NOW())"
        data = {
            "users_user_id": user_id,
            "poked_user_id": target_id
        }
        self.db.query_db(query, data)
        return {"status": True}

    def get_all(self):
        query = "SELECT COUNT(pokes.poked_user_id) as 'total_pokes', pokes.poked_user_id, pokes.users_user_id, " \
                "users.user_id, users.first_name, users.last_name, users.email, users.alias FROM users " \
                "LEFT JOIN pokes on pokes.poked_user_id = users.user_id GROUP BY users.user_id"
        pokes = self.db.query_db(query)
        return {"status": True, "pokes": pokes}

    def get_pokes_by_user(self, user_id):
        query = "SELECT COUNT(pokes.poke_id) as 'total_pokes', pokes.poked_user_id, users.user_id, users.first_name " \
                "FROM pokes JOIN users on users.user_id = pokes.users_user_id WHERE pokes.poked_user_id = :user_id " \
                "GROUP BY users.user_id ORDER BY COUNT(pokes.poke_id) DESC"
        data = {
            "user_id": user_id
        }
        pokes = self.db.query_db(query, data)
        return {"status": True, "pokes": pokes}