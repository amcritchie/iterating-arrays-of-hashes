class Dogs
  POOR      = (0..5).to_a.sample
  AVERAGE   = (6..10).to_a.sample
  EXCELLENT = (11..15).to_a.sample

  def initialize
    joe   = {
      :name => {:first => "Joe", :last=> "Smith"},
      :owner_quality => EXCELLENT
    }
    sarah = {
      :name => {:first => "Sarah", :last => "Darnum"},
      :owner_quality => AVERAGE
    }
    andrew = {
      :name => {:first => "Andrew", :last => "Beter"},
      :owner_quality => AVERAGE
    }

    @dogs = [
      {name: "Fido",     size: :large,  owner: joe},
      {name: "Yapper",   size: :small,  owner: joe},
      {name: "Bruiser",  size: :large,  owner: joe},
      {name: "Tank",     size: :huge,   owner: sarah},
      {name: "Beast",    size: :large,  owner: sarah},
      {name: "Harleigh", size: :medium, owner: andrew},
      {name: "Trixie",   size: :small,  owner: andrew}
    ]
  end

  def small_dogs
    @dogs.select{|dog| dog[:size] == :small}
  end

  def huge_dog
    huge_dogs = []
    @dogs.each do |dog|
      if dog[:size] == :huge
        huge_dogs.push({name: dog[:name]})
      end
    end
    huge_dogs
  end

  def large_dog_names
    large_dogs=[]
    @dogs.each do |dog|
      if dog[:size] == :large
        large_dogs.push dog[:name]
      end
    end
    large_dogs
  end

  def joes_large_dogs
    joes_large_dogs = []
    @dogs.each do |dog|
      if (dog[:size] == :large)&&(dog[:owner][:name][:first] == "Joe")
        joes_large_dogs.push(dog[:name])
      end
    end
    joes_large_dogs
  end

  def sizes
    sizes = []
    @dogs.each do |dog|
      sizes.push dog[:size]
    end
    sizes.uniq.sort
  end

  def owners
    owners = []
    @dogs.each do |dog|
      owners.push(dog[:owner][:name][:first] + " " + dog[:owner][:name][:last])
    end
    owners.uniq
  end

  def average_owners
    owners = []
    @dogs.each do |dog|
      if dog[:owner][:owner_quality] == AVERAGE
        owners.push(dog[:owner][:name][:first] + " " + dog[:owner][:name][:last])
      end
    end
    owners.uniq
  end

  def to_s
    dogs = [[],[],[]]
    @dogs.each do |dog|
      if dog[:owner][:name][:first] == "Joe"
        dogs[0].push dog[:name]
      elsif dog[:owner][:name][:first] == "Sarah"
        dogs[1].push dog[:name]
      else
        dogs[2].push dog[:name]
      end
    end
    "Joe owns: #{dogs[0][0]}, #{dogs[0][1]}, and #{dogs[0][2]}\nSarah owns: #{dogs[1][0]} and #{dogs[1][1]}\nAndrew owns: #{dogs[2][0]} and #{dogs[2][1]}"
  end

  def find_by_owner(name)
    @dogs.select{|dog| (dog[:owner][:name][:first] == name)||(dog[:owner][:name][:last] == name)||(dog[:owner][:name][:first]+" "+dog[:owner][:name][:last] == name)}
  end

end
