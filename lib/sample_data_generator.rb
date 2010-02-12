class SampleDataGenerator
  FIRST_NAMES = %w(David Sean Ingrid Matthew Lachlan Claire Bruce Wendy)
  SURNAMES = %w(Parry Seefried Anzola Sander Kranz Hashman Taper Bornholdt)
  JOBS = %w(Developer Analyst Scientist Engineer Spruker Lawyer Director Manager)
  def self.create
    1000.times do
        person = Person.create!(
        :first_name => random_pick(FIRST_NAMES),
        :surname => random_pick(SURNAMES),
        :job => random_pick(JOBS),
        :birthday => random_date
        )
        p person
    end
  end
  
  def self.random_pick(arr)
    arr[rand(arr.length)]
  end
  
  def self.random_date
    Date.new(1900 + rand(100), rand(12) + 1, rand(26) + 1)
  end
end