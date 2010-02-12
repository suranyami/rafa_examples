
desc "Creates sample data"
task :samples => :environment do
  SampleDataGenerator.create
end