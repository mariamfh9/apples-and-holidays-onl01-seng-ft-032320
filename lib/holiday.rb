holiday_supplies = {
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_supplies)
  holiday_supplies[:summer][:fourth_of_july][1]
end

second_supply_for_fourth_of_july(holiday_supplies)



def add_supply_to_winter_holidays(holiday_hash, item)
 holiday_hash[:winter].each do |holiday, decor|
   decor << item
  end
end



add_supply_to_winter_holidays(holiday_supplies, "Rudolph")



def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day].push(supply)
end

add_supply_to_memorial_day(holiday_supplies, "beach chairs")



def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end
add_new_holiday_with_supplies(holiday_supplies, :fall, :birthday, ["balloons", "cake", "streamers"])

def add_new_season_and_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season] = {holiday_name => supply_array} # the new echelon being created is to the left of the equals sign.
  holiday_hash
end

mitzvos = ["seder", "matzah", "hagaddah"]
add_new_season_and_holiday_with_supplies(holiday_supplies, :aviv, :pesach, mitzvos)


def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash[:winter].values.flatten
end

all_winter_holiday_supplies(holiday_supplies)


def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each do | season, holiday|
     puts "#{season.capitalize}:"
     holiday.each do |holiday, item|
       puts "  #{holiday.to_s.split("_").map {|i| i.capitalize}.join(" ")}: #{item.join(", ")}"
     end
  end 
end

all_supplies_in_holidays(holiday_supplies)



def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  holiday_hash.map do |season, holiday|
    holiday.map do |holiday, item|
      holiday if item.include?("BBQ")
    end 
  end.flatten.compact
end

all_holidays_with_bbq(holiday_supplies)




