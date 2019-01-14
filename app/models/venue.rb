class Venue
  attr_accessor :name, :location, :rental_fee

  @@all = []

  def initialize(name,location,rental_fee)
    @name = name
    @location = location
    @rental_fee = rental_fee
    @@all << self
  end

  def self.all
    @@all
  end

  def events
    Event.all.select {|events| events.venue == self}
  end

  def revenue
    events.inject(0) {|sum,rev| sum + rev.ticket_price}
  end

  def attendees
    events.map {|event| event.attendees}
  end

  def self.guest_lists
    guest_list = []
    Event.all.map do |events|
      newArr = {}
      newArr[:name] = events.name
      newArr[:guest_list] = events.attendees.each {|evnt| evnt.name}
      guest_list << newArr
    end
    guest_list
  end
end

### `Venue`
#
# Let's create another file in `app/models` for a new model that we'll call `Venue`. Make it so each `Venue` has a name, a location, and a rental_fee. When you create `Venue` instances, it'll be up to you to determine these attributes upon initiation. Then, build out the methods below. Go back into the file for the `Event` model and add an attribute that links each `Event` instance to a `Venue` instance. Draw out on a piece of paper how this new model looks in relation to the pre-existing model. Test your code in `tools/console.rb` to see if it works.
#
# + `Venue.all`
#   + Returns an array of all `Venue`s
# + `Venue#events`
#   + Returns an array of `Event`s that are take place at this `Venue`
# + `Venue#revenue`
#   + Returns the total amount of money the venue has made from hosting `Event`s
# + `Venue#attendees`
#   + Returns an array of every `Attendee` that has purchased a `Ticket` for an `Event` held at this `Venue`
#
# ## Bonus Method
#
# + `Venue.guest_lists`
#   + Returns an array of hashes for each `Event` being held at this particular `Venue`. Each hash will have the keys "name", and "guest_list", where "name" returns a string of the name of the `Event`, and "guest_list" returns an array of `Attendee`s attending that event.
