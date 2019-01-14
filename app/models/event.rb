class Event
  attr_accessor :name, :total_cost, :ticket_price
  attr_reader :venue

  @@all = []

  def initialize(name,total_cost,ticket_price,venue)
    @name = name
    @total_cost = total_cost
    @ticket_price = ticket_price
    @venue = venue
    @@all << self
  end

  def self.all
    @@all
  end

  def sales_to_break_even
    current_total = self.ticket_price * Ticket.all.select {|events| events.event == self}.size
    if current_total != total_cost
      ((total_cost - self.ticket_price) - current_total) / ticket_price
    else
      0
    end
  end

  def tickets
    Ticket.all.select {|holder| holder.event == self}
  end

  def attendees
    tickets.map {|ticket| ticket.attendee}
  end

  def average_age
    attendees.inject(0) {|sum,attendee| sum + attendee.age} / attendees.size
  end
end

# Event.all
  # Returns an array of all Events
# Event#sales_to_break_even
  # Returns the number of Tickets that still need to be "purchased" for this Event before the Event reaches the break-even point.
  # If the Event has sold enough Tickets to break-even, return the number 0.
# Event#attendees
  # Returns an array of Attendee that have Tickets for the Event
# Event#average_age
  # Returns the average age of all the Attendees that will be at the Event
