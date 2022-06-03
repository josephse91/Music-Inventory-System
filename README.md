
# Music App

Sometimes it's hard to answer the question, "what are your favorite songs and/or artist"? With this web application, you won't have to think twice. 

This music app is an inventory system where you can document your favorite albums, artists, songs and lyrics. You can now share your favorites without hesitation.


[Live Music Inventory App](https://serge-music.herokuapp.com/ "Music App")




## Technologies Used

- Rails
- SASS


## Highlighted Features

**User Session Authentication**

Utilizes a session controller to monitor is there is a current user. The user model contains methods that create a password digest that will be stored in the database. Password digests are created using Bcrypt for security.

```
 def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
```

**Setting up models**

With each music component(band,album,track). The schema was created using migrations which add tables and columns into the database.

Each table has relationships with each other. It was important to create the appropriate database connections using associations for each model. Additionally, validations for each model were set so that only valid entries are accepted into the database


Example of Model code (Tracks) - `app/model/track.rb`
```
validates :lyrics, :name, :ord, presence: true
  # can't use presence validation with boolean field
  validates :bonus, inclusion: { in: [true, false] }
  validates :ord, uniqueness: { scope: :album_id }

  # Each track will belong to one album
  belongs_to :album

  #Each track will belong to only one band
  has_one :band,
    through: :album,
    source: :band

  # Each user may provide many notes per track
  has_many :notes,
    dependent: :destroy
```



## Run Locally

Clone the project

```bash
git clone https://github.com/josephse91/Music-Inventory-System.git
```

Go to the project directory

Run `bundle install`
Make sure Postgres is running, then run `rails db:setup`

Run the rails server

```bash
  rails s
```

