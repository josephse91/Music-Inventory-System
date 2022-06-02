User.destroy_all
Band.destroy_all
Album.destroy_all
Track.destroy_all
Note.destroy_all

# User
serge = User.create!(email: 'serge@hiphop.com', password: 'tryitout')
raimi = User.create!(email: 'raimi@classical.com', password: 'hawaii')

# Band
ewf = Band.create!(name: 'Earth Wind & Fire')
b2m = Band.create!(name: 'Boyz II Men')

# Album
september  = Album.create!(name: 'September', band: ewf, year: 1978)
cooley  = Album.create!(name: 'Cooleyhighharmony', band: b2m, year: 1991)

# Track
track1 = september.tracks.create!(name: "Can't Let Go", ord: 1, lyrics: 'I love you so')
track2 = cooley.tracks.create!(name: 'End of the Road', ord: 2, lyrics: 'Although we fall')

# Note
note1 = track1.notes.create!(user: serge, content: "It's better that way")
note2 = track1.notes.create!(user: raimi, content: 'Can you add some spacing here?')