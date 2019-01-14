require 'bundler/setup'
Bundler.require
require_rel '../app'

v1 = Venue.new("Barclay","139 Atlantic Ave.",500)
v2 = Venue.new("Scotiabank Arena","4 Blue Jay Dr.",1500)

e1 = Event.new("Biggie",25,25,v1)
e2 = Event.new("Mada",1500,100,v1)
e3 = Event.new("Modo",2500,50,v2)

a1 = Attendee.new("Roger",25)
a2 = Attendee.new("Michael",28)

t1 = Ticket.new(e1,a1)
t2 = Ticket.new(e2,a2)
t3 = Ticket.new(e3,a2)

#binding.pry
