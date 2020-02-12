deanna = Member.create(email: "dgeorges@gmail.com", password: "password", full_name: "Deanna Kelley", instrument: "Color Guard")
kim = Member.create(email: "kengel@yahoo.com", password: "trumpets4life", full_name: "Kimberly Engel", instrument: "Trumpet")
dyanne = Member.create(email: "dyirb25@gmail.com", password: "lucky25", full_name: "Dyanne Irby", instrument: "Sousaphone")
leslie = Member.create(email: "lbecks@yahoo.com", password: "solo66", full_name: "Leslie Becker", instrument: "Snare")


Gig.create(gig_name: "DC Pride", date: "6/13/2020", location: "Washington D.C.", attending: false)
Gig.create(gig_name: "NYC Pride", date: "6/28/2020", location: "New York City", attending: false)
Gig.create(gig_name: "Queens Pride", date: "6/6/2020", location: "Queens, NYC", attending: false)
Gig.create(gig_name: "Providence Pride", date: "6/20/2020", location: "Providence, RI", attending: false)

#build instantiates an object that already has an ID
deanna_gigs = deanna.gigs.build(gig_name: "DC Pride", date: "6/13/2020", location: "Washington D.C.", attending: true)
deanna_gigs.save
kim_gigs = kim.gigs.build(gig_name: "NYC Pride", date: "6/28/2020", location: "New York City", attending: true)
kim_gigs.save 