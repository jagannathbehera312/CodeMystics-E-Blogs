from flask import Flask,render_template,request,session,redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import json
import os
from datetime import datetime
from werkzeug.utils import secure_filename

local_server = True

with open('templates/config.json', 'r') as c:

    params = json.load(c)["params"]


app = Flask(__name__)
app.secret_key = "secret-key-unique"
app.config.update(
    MAIL_SERVER = 'smtp.googlemail.com',
    MAIL_USE_TLS = True,
    MAIL_PORT = 587,
    # MAIL_USE_SSL = True,
    MAIL_USERNAME = params['gmail-user'],
    MAIL_PASSWORD = params['gmail-password']
)
app.config['UPLOAD_FOLDER'] = params['upload_location']
mail = Mail(app)


if(local_server == True):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']
    
db = SQLAlchemy(app)

# create app
class Contacts(db.Model):
    sno = db.Column(db.Integer,primary_key=True)
    name = db.Column(db.String(20),unique = True, nullable=False)
    email = db.Column(db.String(25),unique = True, nullable =False)
    message = db.Column(db.String(100),unique = False, nullable =False)
    phone_no = db.Column(db.String(12),unique = False, nullable =False)
    date = db.Column(db.String(6),unique = False, nullable =True)

class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(1000), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)
    tagline = db.Column(db.String(20), nullable=True)


@app.route("/")
def home_page():
    posts = Posts.query.filter_by().all()[0:params['no_of_post']]
    return render_template('index.html',params=params,posts=posts)

@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/dashboard')

@app.route("/delete/<string:sno>", methods = ['GET', 'POST'])
def delete(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route("/edit/<string:sno>" , methods=['GET', 'POST'])
def edit(sno):
    if "user" in session and session['user']==params['admin_user']:
        if request.method=="POST":
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()
        
            if sno=='0':
                posts = Posts(title=box_title, slug=slug, content=content, tagline=tline, img_file=img_file, date=date)
                db.session.add(posts)
                db.session.commit()
            else:
                posts = Posts.query.filter_by(sno=sno).first()
                posts.title = box_title
                posts.tagline = tline
                posts.slug = slug
                posts.content = content
                posts.img_file = img_file
                posts.date = date
                db.session.commit()
                return redirect('/edit/'+sno)

    posts = Posts.query.filter_by(sno=sno).first()
    return render_template('edit.html', params=params, posts=posts,sno=sno)

@app.route("/uploader", methods = ['GET', 'POST'])
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == 'POST'):
            f= request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename) ))
            return "Uploaded successfully"


@app.route("/dashboard", methods = ['GET','POST'])
def dashboard_page():

    if "user" in session and session['user']==params['admin_user']:
        posts = Posts.query.all()
        return render_template("dashboard.html",params=params,posts=posts)

    if(request.method == 'POST'):
        # Redirect to dashboard if username and password is correct
        username = request.form.get('uname')
        password = request.form.get('pass')
        if(username == params['admin_user'] and password == params['admin_pass'] ):
            # set the session variable
            session['user'] = username
            posts = Posts.query.all()
            return render_template("dashboard.html",params=params,posts=posts)

    return render_template('login.html',params = params)


@app.route("/about")
def about_page():
    return render_template('about.html',params=params)

@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):

    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params,post=post)


@app.route("/contact",methods= {'POST','GET'})
def contact_page():

    if(request.method == 'POST'):
        name = request.form.get('name')
        messge = request.form.get('msg')
        phone = request.form.get('phone')
        email_id = request.form.get('email')

        entry = Contacts(name = name,phone_no = phone,email = email_id,message = messge)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                            sender = email_id,
                            recipients = params['gmail-user'],
                            body = name + "\n" + messge + "\n" + phone 
                            )

    return render_template('contact.html',params=params)

@app.route("/post")
def post_page():
    return render_template('post.html',params=params)

app.run(debug=True)