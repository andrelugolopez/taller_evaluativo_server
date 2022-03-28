from flask.views import MethodView
from flask import jsonify, request, session
from model import users
import hashlib
import bcrypt # pip3 install bcrypt
import jwt # pip3 install pyjwt
from config import KEY_TOKEN_AUTH
import datetime
import pymysql.cursors

from validators import CreateRegisterSchema, CreateLoginSchema, CreateCrearProductoSchema
create_register_schema = CreateRegisterSchema()
create_login_schema = CreateLoginSchema()
create_Crear_Producto_shema= CreateCrearProductoSchema()

connection = pymysql.connect(host='localhost',
                             user='root',
                             password='1234',
                             database='tienda_evaluacion',
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)

print("conexion", connection)

#http://127.0.0.1:5000/register
"""{
"nombres": "andrea",
 "apellidos": "lugo lopez",
 "password": "212454545",
 "email" : "andrea@gmail.com"
}
"""
class RegisterControllers(MethodView):
    """
        register
    """
    def post(self):
        content = request.get_json()
        nombres = content.get("nombres")
        apellidos = content.get("apellidos")
        password = content.get("password")
        email = content.get("email")      

        print("---Datos-----", email, nombres, apellidos,password)
        

        salt = bcrypt.gensalt()
        hash_password = bcrypt.hashpw(bytes(str(password), encoding= 'utf-8'), salt)

        with connection:
            with connection.cursor() as cursor:
                # Create a new record
                sql = "INSERT INTO `usuarios` (`nombres`, `apellidos`, `password`,`email` ) VALUES (%s, %s, %s, %s)"
                cursor.execute(sql, (nombres, apellidos, hash_password, email))
                connection.commit()

        # connection is not autocommit by default. So you must commit to save
        # your changes.
        
        errors = create_register_schema.validate(content)
        if errors:
            return errors, 400
        
        return jsonify({"Status": "Registro ok"}), 200
         #           "password_encriptado": hash_password.decode(),
         #               "password_plano": password}), 200
    

#http://127.0.0.1:5000/login
"""
{
  "password": "212454545",
  "email": "andrea@gmail.com"
}
"""

class LoginControllers(MethodView):
    """
        Login por parametro de consulta
    """
    def post(self):
        content = request.get_json()
        password = content.get("password")
        email = content.get("email")

        with connection:
            with connection.cursor() as cursor:
                # Read a single record
                sql = "SELECT `email`, `password` FROM `usuarios` WHERE `email`=%s"
                cursor.execute(sql, (email))
                result = cursor.fetchone()
                print(result)


        errors = create_login_schema.validate(content)
        if errors:
            return errors, 400

        if not result:
            return jsonify({"Status": "Login incorrecto 11"}), 400
            
        byte_password = bytes(password, encoding="utf-8")
        db_password = bytes(result["password"], encoding="utf-8")

        print(byte_password)
        print(db_password)

        if not bcrypt.checkpw(byte_password, db_password):
            return jsonify({"Status": "Login incorrecto 22"}), 400

        encoded_jwt = jwt.encode({'exp': datetime.datetime.utcnow() + datetime.timedelta(seconds=300), 'email': email}, KEY_TOKEN_AUTH , algorithm='HS256')        
        return jsonify({"Status": "Login ok", "token": encoded_jwt.decode('utf-8')}), 200
            
 

#http://127.0.0.1:5000/crearproducto

"""
{
  "nombre": "computador",
  "precio": 1000
}
"""

class CrearProductoControllers(MethodView):
    def post(self):
        content = request.get_json()
        nombre = content.get("nombre")
        precio = content.get("precio")


        #Parametros por cabecera
        if(request.headers.get("Authorization")):
            token = request.headers.get("Authorization").split(" ")
            print(token)

            try: 
                decoded_jwt = jwt.decode(token[1], KEY_TOKEN_AUTH , algorithms= ['HS256'])
                print(decoded_jwt)
                
                #validaciones
                errors = create_Crear_Producto_shema.validate(content)
                if errors:
                 return errors, 400
                
                           
                #consulta base de datos
                print("token",decoded_jwt)
                
                with connection:
                    with connection.cursor() as cursor:
                        # Create a new record
                        sql = "INSERT INTO `productos` (`nombre`, `precio`) VALUES (%s, %s)"
                        cursor.execute(sql, (nombre, precio))

                        # connection is not autocommit by default. So you must commit to save
                        # your changes.
                        connection.commit()
                
                return jsonify({"Status": "nuevo producto ok"}), 200
            
            except:
                print("Hola ya llegue")
                return jsonify({"Status": "Token invalido"}), 400


#http://127.0.0.1:5000/productos
class ProductosArrayControllers(MethodView):
    """
        json
    """
    def get(self):
        #consulta base de datos
            with connection:
                with connection.cursor() as cursor:
                    # Read a single record
                    sql = "SELECT `idproductos`, `nombre`, `precio` FROM `productos`"
                    cursor.execute(sql)
                    result = cursor.fetchall()
                    print(result)
                
            return jsonify(result), 200
