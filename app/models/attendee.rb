class Attendee
  attr_accessor :name, :age
  attr_reader :event

  @@all = []

  def initialize(name,age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def tickets
    Ticket.all.select {|ticket| ticket.attendee == self}
  end

  def events
    tickets.map {|eventer| eventer.event}
  end

  def money_spent
    tickets.map {|eventer| return eventer.event.ticket_price}
  end

  def venues
    events.map {|evnts| evnts.venue}
  end
end

# Attendee#venues
# Returns an array of each Venue instance for every Event the particular Attendee has a Ticket for.

# Attendee.all
  # Returns an array of all Attendees
# Attendee#events
  # Returns an array of all Events that the Attendee is attending.
# Attendee#money_spent
  # Returns the dollar amount this Attendee has spent on Tickets for Events
