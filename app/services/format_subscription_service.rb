class FormatSubscriptionService
  def initialize(attributes)
    @flower_subscription = attributes[:flower_subscription]
  end

  def call
    format_subscription
    return @flower_subscription
  end

  private

  def format_subscription
    format_size
    format_frequency
    format_time
  end

  def format_size
      # storing size of bouquet
    if @flower_subscription.size == "Small"
      @flower_subscription.price_cents = 2500
    elsif @flower_subscription.size == "Medium"
      @flower_subscription.price_cents = 4000
    else @flower_subscription.size == "Large"
      @flower_subscription.price_cents = 5500
    end
  end

  def format_frequency
    if @flower_subscription.frequency == "Monthly"
      @flower_subscription.frequency = 1
    elsif @flower_subscription.frequency == "Forthnightly"
      @flower_subscription.frequency = 2
    else @flower_subscription.frequency == "Weekly"
      @flower_subscription.frequency = 4
    end
  end

  def format_time
      # storing the time of day of bouquet
    if @flower_subscription.time_of_day == "Morning"
      @flower_subscription.time_of_day = "Between 8am-12pm"
    elsif @flower_subscription.time_of_day == "Afternoon"
      @flower_subscription.time_of_day = "Between 13pm-15pm"
    else @flower_subscription.time_of_day == "Evening"
      @flower_subscription.time_of_day = "Between 15pm-18pm"
    end
  end
end